import ng_to_verilog as ngv

# add/update primitive definitions in primitives.json

def fix_ng_primitives(ngData):
    word_size = ngv.get_word_size()

    if word_size == ngv.DEFAULT_WORD_SIZE:
        return

    nameDictionary = {}

    # fix up the default 16-bit primitives to the selected word size
    for component in ngData:
        if ngv.is_ng_primitive(component):
            componentName = component["name"]
            
            if componentName == "DFF16":
                if ngv.get_register_trigger() == ngv.RegisterTrigger.Default:
                    if ngv.get_target_platform == ngv.TargetPlatform.IVerilog:
                        triggerValue = "negedge"
                    else:
                        triggerValue = "posedge"
                else:
                    if ngv.get_register_trigger() == ngv.RegisterTrigger.Negedge:
                        triggerValue = "negedge"
                    else:
                        triggerValue = "posedge"
                    
                component["verilog"]["body"] = component["verilog"]["body"].replace(r"{trigger}", triggerValue)

            if componentName.endswith("16"):
                updatedComponentName = f"{componentName[0:-2]}{word_size}"
                nameDictionary[componentName] = {"newName": updatedComponentName}
                component["name"] = updatedComponentName

                # the following primitives need special handling
                if componentName == "SPLIT16":
                    nameDictionary[componentName]["fixConnectionKey"] = "source"
                    while component["outputs"][0]["label"] != f"D{word_size - 1}":
                        del component["outputs"][0]
                elif componentName == "BUNDLE16":
                    nameDictionary[componentName]["fixConnectionKey"] = "target"
                    while component["inputs"][0]["label"] != f"D{word_size - 1}":
                        del component["inputs"][0]
                    pass

    ngv.set_primitive_name_dictionary(nameDictionary)


def fix_ng_primitive_refs(component):
    nameDictionary = ngv.get_primitive_name_dictionary()
    word_size = ngv.get_word_size()

    if word_size == ngv.DEFAULT_WORD_SIZE:
        return

    # fix up references (and connections) to renamed primitives
    if not ngv.is_ng_primitive(component):
        for node in component["nodes"]:
            nodeType = node["type"]
            if nodeType in nameDictionary:
                dictEntry = nameDictionary[nodeType]
                node["type"] = dictEntry["newName"]

                if "fixConnectionKey" in dictEntry:
                    connectionKey = dictEntry["fixConnectionKey"]
                    nodeId = node["id"]

                    for connection in component["connections"]:
                        if connection[connectionKey]["nodeId"] == nodeId:
                            # offset the connectorId based on the new word size
                            # this is needed since the game numbers connections from left-to-right
                            # and, the components in question have the most-significant-bit on the far left
                            connectorId = int(connection[connectionKey]["connectorId"])

                            if connectorId == 0:
                                # there is a case where someone might be checking the high bit to see if a signed number is negative
                                newConnectorId = 0
                            else:
                                newConnectorId = connectorId - (
                                    ngv.DEFAULT_WORD_SIZE - word_size
                                )

                            if newConnectorId >= 0:
                                connection[connectionKey]["connectorId"] = str(
                                    newConnectorId
                                )
                            else:
                                raise Exception(
                                    f"You have selected a word_size of {word_size}, but component {component['componentName']} ({component['name']}) has a reference to a {nodeType} that accesses bits outside of the word boundary (i.e. bit {ngv.DEFAULT_WORD_SIZE - connectorId - 1})"
                                )
