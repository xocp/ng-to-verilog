from jinja2 import Environment, PackageLoader
import ng_to_verilog as ngv
import os

_UNDEFINED_PORT = "undefined"

def get_component(identifier, ngData):
    keyName = ngv.get_component_id_key_name(identifier)

    for component in ngData:
        if component[keyName] == identifier:
            return component

    raise Exception(f"Cannot find a component with {keyName} equaling {identifier}")


def export(topLevelComponentName, ngData):
    global _exported_components
    _exported_components = []

    # make sure the output folder is there
    outputFolder = ngv.get_output_folder()
    if not os.path.exists(outputFolder):
        os.mkdir(outputFolder)

    env = Environment(
        loader=PackageLoader("ng_to_verilog"),
        autoescape=False,
        trim_blocks=True,
        lstrip_blocks=True,
    )

    # export the component
    topLevelComponentName = ngv.fix_name(topLevelComponentName)
    topLevelComponent = export_module(topLevelComponentName, ngData, env)

    # create and export a test-bench
    testbenchComponentName = f"{topLevelComponentName}_tb"
    testbenchInputs = topLevelComponent["inputs"]
    testbenchOutputs = topLevelComponent["outputs"]
    testbenchConnections = []

    for connectorId in range(0, len(testbenchInputs)):
        testbenchConnections.append(
            {
                "source": {"nodeId": "input", "connectorId": str(connectorId)},
                "target": {"nodeId": "0", "connectorId": str(connectorId)},
            }
        )
        connectorId += 1

    for connectorId in range(0, len(testbenchOutputs)):
        testbenchConnections.append(
            {
                "source": {"nodeId": "0", "connectorId": str(connectorId)},
                "target": {"nodeId": "output", "connectorId": str(connectorId)},
            }
        )
        connectorId += 1

    testbenchComponent = {
        "componentName": "NandGame:TestbenchComponent:Testbench",
        "key": "-1337",
        "name": testbenchComponentName,
        "inputs": testbenchInputs,
        "outputs": testbenchOutputs,
        "nodes": [{"type": topLevelComponent["key"], "id": 0}],
        "connections": testbenchConnections,
        "verilog": {
            "header": ["`timescale 1ns / 1ns"],
            "body": [
                "initial begin",
                f'\t$dumpfile("{testbenchComponentName}.vcd");',
                f"\t$dumpvars(0, {testbenchComponentName});",
                "\t",
                "\t// TODO: adjust any reg (input) values here",
            ],
        },
    }

    for input in testbenchInputs:
        testbenchComponent["verilog"]["body"].append(f"\t{input['label']} = 0;")

    testbenchComponent["verilog"]["body"] += [
        "\t#10000;",
        "\t",
        '\t$display("Test complete");',
        "\t$finish;",
        "end",
    ]

    ngData.append(testbenchComponent)
    testbenchComponent = export_module(testbenchComponentName, ngData, env)

    # move the last entry (the testbench) to the front of the list
    # without this the `timescale setting doesn't seem to get applied to the other files
    _exported_components.insert(0, _exported_components.pop())

    # create a build script
    buildScriptTemplate = env.get_template("build.j2")

    buildScriptExtension = ""
    platformInstallText = ""

    osName = os.name
    if osName == "posix":
        buildScriptExtension = "sh"
        platformInstallText = "https://steveicarus.github.io/iverilog/usage/installation.html, apt install iverilog, apt install gtkwave"
    elif osName == "nt":
        buildScriptExtension = "cmd"
        platformInstallText = (
            "https://bleyer.org/icarus/, install both iverilog and gtkwave"
        )
    else:
        raise Exception(f"Unsupported os.name platform of {os.name}")

    buildFilename = f"{ngv.get_output_folder()}/build{testbenchComponentName}.{buildScriptExtension}"
    with open(buildFilename, "w") as build_file:
        buildScriptTemplate.stream(
            {
                "topLevelComponentName": testbenchComponentName,
                "exportedComponents": _exported_components,
            }
        ).dump(build_file)

    print(
        f'Export complete. Proceed with editing the testbench file ({ngv.get_output_folder()}/{testbenchComponentName}.v), and then execute "{buildFilename}" in the output directory to build, run and view the simulation results.\n'
    )
    print(
        f"Please ensure iverilog and gtkwave ({platformInstallText}) are installed before proceeding (or use other software of your choice).\n"
    )


def export_module(name_or_key, ngData, env, node=None):
    global _exported_components
    component = get_component(name_or_key, ngData)

    if component["name"] in _exported_components or component["name"] in ["CONST"]:
        return component
    else:
        _exported_components.append(component["name"])

    ngv.fix_ng_primitive_refs(component)

    module = build_module(component, ngData, env, node)

    # write module
    moduleTemplate = env.get_template("verilogModule.j2")
    with open(f"{ngv.get_output_folder()}/{component['name']}.v", "w") as module_file:
        moduleTemplate.stream({"module": module}).dump(module_file)

    return component


def build_module(component, ngData, env, node=None):
    module = {
        "name": component["name"],
        "ports": [],
        "variables": [],
        "instances": [],
        "verilog": {"header": [], "body": []},
        "assigns": [],
    }

    if not ngv.is_ng_testbench(component):
        for port in ngv.get_ports(component):
            newPort = {
                "type": port["type"],
                "size": port["width"],
                "name": port["label"],
            }

            if "verilogType" in port:
                newPort["verilogType"] = port["verilogType"]

            module["ports"].append(newPort)

    if "verilog" in component:
        if "header" in component["verilog"]:
            module["verilog"]["header"] = component["verilog"]["header"]
        if "body" in component["verilog"]:
            module["verilog"]["body"] = component["verilog"]["body"]

    for subComponentNode in component["nodes"]:
        subComponentNodeType = subComponentNode["type"]

        subComponent = export_module(
            subComponentNodeType, ngData, env, subComponentNode
        )
        subComponentName = subComponent["name"]
        subComponentNodeInstanceName = f"{subComponentName}_{subComponentNode['id']}"

        instance = None
        if subComponentName not in ["CONST"]:
            instantiateModule = True
            instance = {
                "type": subComponentName,
                "name": subComponentNodeInstanceName,
                "ports": [],
            }
        else:
            instantiateModule = False

        subComponentPorts = ngv.get_ports(subComponent)

        for subComponentPortIndex, subComponentPort in enumerate(subComponentPorts):
            port = {
                "name": subComponentPort["label"],
                "size": subComponentPort["width"],
                "variableName": "",
            }

            subComponentPortType = subComponentPort["type"]
            if subComponentPortType == "input":
                portInputName = _UNDEFINED_PORT

                # json "connections" are one of the following:
                # 	module input to component input
                # 	component output (wire) to component input
                # 	component output (wire) to module output
                # 	module input to module output

                # search component connections for a target that matches this sub-component's nodeId; the source is the corresponding input
                for connection in component["connections"]:
                    target = connection["target"]

                    # offset subComponentPortIndex here with the number of output ports
                    # (since we force outputs to come first elsewhere [and inputs second], and we are looking for inputs to this sub-component)
                    if (
                        target["nodeId"].isnumeric()
                        and int(target["nodeId"])
                        == component["nodes"].index(subComponentNode)
                        and int(target["connectorId"])
                        == subComponentPortIndex - len(subComponent["outputs"])
                    ):
                        portInputName = ngv.get_port_input_name(
                            connection, component, ngData
                        )
                        break

                if portInputName == _UNDEFINED_PORT:
                    # input port is not connected to anything, likely a scenario where Nandgame allows a floating input; don't allow here
                    raise Exception(
                        f"Component inputs must be tied to something, likely you are missing connecting this to a ZERO input. Component: {component['componentName']}, Component Name: {component['name']} sub-component: {subComponentName}, input port: {subComponentPort['label']}"
                    )

                port["variableName"] = portInputName

                if ngv.is_ng_testbench(component):
                    # create a reg in the variables section for the input
                    variable = {
                        "type": "reg",
                        "size": subComponentPort["width"],
                        "name": portInputName,
                    }
                    module["variables"].append(variable)

            elif subComponentPortType == "output":
                # define a wire for each output
                variable = {
                    "type": "wire",
                    "size": subComponentPort["width"],
                    "name": f"{subComponentNodeInstanceName}_{subComponentPort['label']}",
                }
                module["variables"].append(variable)

                port["variableName"] = variable["name"]

                if subComponentName == "CONST":
                    assign = {
                        "variableName": variable["name"],
                        "value": subComponentNode["state"],
                    }
                    module["assigns"].append(assign)

            if instance is not None:
                instance["ports"].append(port)

        if instantiateModule:
            module["instances"].append(instance)

    # assign module outputs
    if not ngv.is_ng_testbench(component):
        for connection in component["connections"]:
            target = connection["target"]
            if target["nodeId"] == "output":
                targetConnectorId = int(target["connectorId"])
                portInputName = ngv.get_port_input_name(connection, component, ngData)
                assign = {
                    "variableName": component["outputs"][targetConnectorId]["label"],
                    "value": portInputName,
                }
                module["assigns"].append(assign)

    if ngv.is_ng_primitive(component):
        module["variables"] = []
        module["assigns"] = []

        if component["name"] == "ROM":
            romData = ""
            currentAddress = 0

            for word in node["state"]["words"]:
                romData += f"\t\t{currentAddress}: D = {word};\n"
                currentAddress += 1

            romData += "\t\tdefault: D = 0;"

            for verilogBodyIndex, bodyLine in enumerate(module["verilog"]["body"]):
                if "%ROM_DATA%" in bodyLine:
                    module["verilog"]["body"][verilogBodyIndex] = bodyLine.replace(
                        "%ROM_DATA%", romData
                    )

    return module
