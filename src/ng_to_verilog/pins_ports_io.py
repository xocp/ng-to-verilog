import ng_to_verilog as ngv


def create_ng_pin(label, width):
    return {"pins": [{"label": label, "width": width}]}


def get_ng_level_io_pins(levelName):
    (name, inputs, outputs) = (levelName, [], [])

    wordSize = ngv.get_word_size()

    if levelName in ["AND", "XOR", "OR"]:
        inputs = [create_ng_pin("A", 1), create_ng_pin("B", 1)]
        outputs = [create_ng_pin("OUT", 1)]
    elif levelName == "SIGN":
        name = "ISNEG"
        inputs = [create_ng_pin("IN", wordSize)]
        outputs = [create_ng_pin("IS_NEG", 1)]
    elif levelName == "FULLADD":
        inputs = [create_ng_pin("A", 1), create_ng_pin("B", 1), create_ng_pin("C", 1)]
        outputs = [create_ng_pin("H", 1), create_ng_pin("L", 1)]
    elif levelName == "DEMUX":
        inputs = [create_ng_pin("S", 1), create_ng_pin("D", 1)]
        outputs = [create_ng_pin("C1", 1), create_ng_pin("C0", 1)]
    elif levelName == "COUNTER":
        inputs = [
            create_ng_pin("ST", 1),
            create_ng_pin("X", wordSize),
            create_ng_pin("CLK", 1),
        ]
        outputs = [create_ng_pin("OUT", wordSize)]
    elif levelName == "MULTIPLEXER":
        inputs = [create_ng_pin("S", 1), create_ng_pin("D1", 1), create_ng_pin("D0", 1)]
        outputs = [create_ng_pin("OUT", 1)]
    elif levelName == "CPU3":
        pass
    elif levelName == "CPU_STATE":
        name = "STATE"
        inputs = [
            create_ng_pin("A_IN", 1),
            create_ng_pin("D_IN", 1),
            create_ng_pin("STAR_A_IN", 1),
            create_ng_pin("X", wordSize),
            create_ng_pin("CLK", 1),
        ]
        outputs = [
            create_ng_pin("A", 1),
            create_ng_pin("D", 1),
            create_ng_pin("STAR_A", 1),
        ]
    elif levelName == "RAM":
        inputs = [
            create_ng_pin("AD", 1),
            create_ng_pin("ST", 1),
            create_ng_pin("X", wordSize),
            create_ng_pin("CLK", 1),
        ]
        outputs = [create_ng_pin("OUT", wordSize)]
    elif levelName == "SUB":
        inputs = [create_ng_pin("A", wordSize), create_ng_pin("B", wordSize)]
        outputs = [create_ng_pin("OUT", wordSize)]
    elif levelName == "ALU2":
        inputs = [
            create_ng_pin("U", 1),
            create_ng_pin("PP1", 1),
            create_ng_pin("PP0", 1),
            create_ng_pin("ZX", 1),
            create_ng_pin("SW", 1),
            create_ng_pin("X", wordSize),
            create_ng_pin("Y", wordSize),
        ]
        outputs = [create_ng_pin("OUT", wordSize)]
    elif levelName == "ALU_INSTRUCTION":
        inputs = [
            create_ng_pin("I", wordSize),
            create_ng_pin("A_IN", wordSize),
            create_ng_pin("D_IN", wordSize),
            create_ng_pin("STAR_A_IN", wordSize),
        ]
        outputs = [
            create_ng_pin("R", wordSize),
            create_ng_pin("A", 1),
            create_ng_pin("D", 1),
            create_ng_pin("STAR_A", 1),
            create_ng_pin("J", 1),
        ]
    elif levelName == "ALU_LOGIC":
        name = "LOGIC_UNIT"
        inputs = [
            create_ng_pin("PP1", 1),
            create_ng_pin("PP0", 1),
            create_ng_pin("X", wordSize),
            create_ng_pin("Y", wordSize),
        ]
        outputs = [create_ng_pin("OUT", wordSize)]
    elif levelName == "DFF2":
        inputs = [
            create_ng_pin("ST", 1),
            create_ng_pin("D1", 1),
            create_ng_pin("D0", 1),
            create_ng_pin("CLK", 1),
        ]
        outputs = [create_ng_pin("D1", 1), create_ng_pin("D0", 1)]
    elif levelName == "CONTROL_UNIT":
        inputs = [
            create_ng_pin("I", wordSize),
            create_ng_pin("A_IN", wordSize),
            create_ng_pin("D", wordSize),
            create_ng_pin("STAR_A", wordSize),
        ]
        outputs = [
            create_ng_pin("R", wordSize),
            create_ng_pin("A", 1),
            create_ng_pin("D", 1),
            create_ng_pin("STAR_A", 1),
            create_ng_pin("J", 1),
        ]
    elif levelName == "ISZERO":
        inputs = [
            create_ng_pin("B3", 1),
            create_ng_pin("B2", 1),
            create_ng_pin("B1", 1),
            create_ng_pin("B0", 1),
        ]
        outputs = [create_ng_pin("OUT", 1)]
    elif levelName == "INV":
        inputs = [create_ng_pin("IN", 1)]
        outputs = [create_ng_pin("OUT", 1)]
    elif levelName == "CONDITION":
        name = "CONDITION2"
        inputs = [
            create_ng_pin("LT", 1),
            create_ng_pin("EQ", 1),
            create_ng_pin("GT", 1),
            create_ng_pin("X", wordSize),
        ]
        outputs = [create_ng_pin("OUT", 1)]
    elif levelName == "HALFADD":
        inputs = [create_ng_pin("A", 1), create_ng_pin("B", 1)]
        outputs = [create_ng_pin("H", 1), create_ng_pin("L", 1)]
    elif levelName == "SR_LATCH":
        inputs = [create_ng_pin("S", 1), create_ng_pin("R", 1)]
        outputs = [create_ng_pin("OUT", 1)]
    elif levelName == "IO2":
        inputs = [create_ng_pin("", 1)]
        outputs = [create_ng_pin("", 1)]
    elif levelName == "ALU_ARITHMETIC":
        name = "ARITHMETIC_UNIT"
        inputs = [
            create_ng_pin("PP1", 1),
            create_ng_pin("PP0", 1),
            create_ng_pin("X", wordSize),
            create_ng_pin("Y", wordSize),
        ]
        outputs = [create_ng_pin("OUT", wordSize)]
    elif levelName == "INC":
        inputs = [create_ng_pin("IN", wordSize)]
        outputs = [create_ng_pin("OUT", wordSize)]
    elif levelName == "ADD2":
        inputs = [
            create_ng_pin("A1", 1),
            create_ng_pin("A0", 1),
            create_ng_pin("B1", 1),
            create_ng_pin("B0", 1),
            create_ng_pin("C_IN", 1),
        ]
        outputs = [
            create_ng_pin("C", 1),
            create_ng_pin("S1", 1),
            create_ng_pin("S0", 1),
        ]
    elif levelName == "LATCH":
        inputs = [create_ng_pin("ST", 1), create_ng_pin("D", 1)]
        outputs = [create_ng_pin("OUT", 1)]
    elif levelName == "DFF":
        inputs = [
            create_ng_pin("ST", 1),
            create_ng_pin("D", 1),
            create_ng_pin("CLK", 1),
        ]
        outputs = [create_ng_pin("OUT", 1)]
    else:
        raise Exception(f"Unknown Nandgame level: '{levelName}'")

    return (name, inputs, outputs)


def fix_ng_pins(component, pinListKey, direction):
    pins = component[pinListKey]

    if ngv.is_ng_primitive(component):
        output = pins  # these were originally merged in the proper format

        for pin in pins:
            if pin["width"] > 1:
                pin["width"] = ngv.get_word_size()
    else:
        output = []
        pin_number = 0

        for pin in pins:
            to_append = pin["pins"][0]

            to_append["label"] = ngv.strip_special_chars(to_append["label"])

            if len(to_append["label"]) == 0:
                to_append["label"] = f"{direction}{pin_number}"
            elif to_append["label"].isnumeric():
                to_append["label"] = f"{direction}{to_append['label']}"

            to_append["label"] = to_append["label"].upper()

            if to_append["width"] > 1:
                to_append["width"] = ngv.get_word_size()

            output.append(pin["pins"][0])
            pin_number += 1

    return output


def fix_ng_inputs_outputs(component):
    # ensure that input and output names are unique
    # this is very simplistic and doesn't account for all scenarios
    for input in component["inputs"]:
        matches = list(
            filter(
                lambda output: output["label"] == input["label"], component["outputs"]
            )
        )
        if len(matches) > 0:
            input["label"] = f"{input['label']}_IN"


def get_ports(component):
    inputs = [{"type": "input"} | input for input in component["inputs"]]
    outputs = [{"type": "output"} | output for output in component["outputs"]]

    # return outputs first to match verilog conventions
    return outputs + inputs


def get_port_input_name(connection, component, ngData):
    portInputName = "undefined"

    source = connection["source"]
    sourceNodeId = source["nodeId"]
    sourceConnectorId = int(source["connectorId"])

    if sourceNodeId == "input":
        portInputName = component["inputs"][sourceConnectorId]["label"]
    else:
        sourceNodeId = int(sourceNodeId)
        sourceNodeType = component["nodes"][sourceNodeId]["type"]
        sourceComponent = ngv.get_component(sourceNodeType, ngData)
        sourceComponentName = sourceComponent["name"]

        sourceInstanceName = f"{sourceComponentName}_{sourceNodeId}"
        sourcePortName = sourceComponent["outputs"][sourceConnectorId]["label"]
        portInputName = f"{sourceInstanceName}_{sourcePortName}"

    return portInputName
