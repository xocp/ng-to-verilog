# https://docs.python-guide.org/writing/structure/
import json
import os

import ng_to_verilog as ngv


def load_ng_data(filename):
    with open(filename) as f:
        ngData = json.load(f)

    ngData = normalize_ng_data(ngData)

    # merge primitive definitions
    with open(f"{os.path.dirname(ngv.__file__)}/resources/primitives.json") as f:
        ng_primitives = json.load(f)
        ngData = ngData + ng_primitives

    for component in ngData:
        componentName = component["componentName"]

        if componentName.startswith("NandGame:CustomComponent:"):
            # remove the diagram entry and boost children up a level, to match format of NandGame:Levels: components
            component["nodes"] = component["diagram"]["nodes"]
            component["connections"] = component["diagram"]["connections"]
            del component["diagram"]
        elif componentName.startswith("NandGame:Levels:"):
            levelName = component["componentName"][len("NandGame:Levels:") :]

            # add entries that aren't provided by default in NandGame:Levels: components
            component["key"] = levelName
            (name, inputs, outputs) = ngv.get_ng_level_io_pins(levelName)
            component["name"] = name
            component["inputs"] = inputs
            component["outputs"] = outputs

        for node in component["nodes"]:
            # replace any references in the nodes section of type="RAM" to type="RAM16"
            # this is because there is a level called RAM, but it uses a 2-bit address, and when used outside of the level
            # it uses a 16-bit address (also, the inputs are in a different order than the level)
            # RAM16 will refer to a new primitive component
            if node["type"] == "RAM":
                node["type"] = "RAM16"

        component["inputs"] = ngv.fix_ng_pins(component, "inputs", "IN")
        component["outputs"] = ngv.fix_ng_pins(component, "outputs", "OUT")
        ngv.fix_ng_inputs_outputs(component)

        component["name"] = ngv.fix_name(component["name"])

    ngv.fix_ng_primitives(ngData)

    return ngData

def normalize_ng_data(ngData):
    # normalize the exported json
    # First, filter out any items that are code or lists (these won't represent entries we want to process)
    # also add an entry with the parent's key as the value for each dict in the list
    return [
        {"componentName": key} | value
        for (key, value) in ngData.items()
        if "code" not in value
        and not isinstance(value, list)
        and key
        not in [
            "NandGame:Levels:OPCODES2",
            "NandGame:Levels:IO2",
            "NandGame:Levels:RELAY_NAND",
            "NandGame:Levels:DFF"
        ]
    ]
