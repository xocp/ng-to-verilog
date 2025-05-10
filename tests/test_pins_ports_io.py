import json

import pytest

import ng_to_verilog as ngv


def test_create_ng_pin():
	pin = ngv.pins_ports_io.create_ng_pin("test", 16)
	assert pin['pins'][0]['label'] == 'test'
	assert pin['pins'][0]['width'] == 16

def test_get_ng_level_io_pins():
	ngv.set_word_size(8)

	(name, inputs, outputs) = ngv.get_ng_level_io_pins('XOR')
	assert name == 'XOR'
	assert len(inputs) == 2
	assert len(outputs) == 1

	(name, inputs, outputs) = ngv.get_ng_level_io_pins('COUNTER')
	assert name == 'COUNTER'
	assert len(inputs) == 3
	assert len(outputs) == 1

	test_input = [input for input in inputs if input['pins'][0]['label'] == 'X']
	assert len(test_input) == 1
	test_input = test_input[0]
	assert test_input['pins'][0]['width'] == 8

	test_output = outputs[0]
	assert test_output['pins'][0]['width'] == 8

	with pytest.raises(Exception):
		ngv.get_ng_level_io_pins('XYZZY')

	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)

def test_fix_ng_pins():
	orig_name_dict = ngv.get_primitive_name_dictionary()
	test_component = load_component()

	assert test_component['inputs'][0]['pins'][0]['width'] == 16
	ngv.set_word_size(8)
	ngv.fix_ng_pins(test_component, 'inputs', 'IN')
	assert test_component['inputs'][0]['pins'][0]['width'] == 8

	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	ngv.set_primitive_name_dictionary(orig_name_dict)

def test_fix_ng_inputs_outputs():
	orig_name_dict = ngv.get_primitive_name_dictionary()
	test_component = load_component()

	ngv.set_word_size(8)
	test_component['inputs'] = ngv.fix_ng_pins(test_component, 'inputs', 'IN')
	test_component['outputs'] = ngv.fix_ng_pins(test_component, 'outputs', 'OUT')
	ngv.fix_ng_inputs_outputs(test_component)

	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	ngv.set_primitive_name_dictionary(orig_name_dict)

def test_get_ports():
	orig_name_dict = ngv.get_primitive_name_dictionary()
	test_component = load_component()

	ngv.set_word_size(8)
	test_component['inputs'] = ngv.fix_ng_pins(test_component, 'inputs', 'IN')
	test_component['outputs'] = ngv.fix_ng_pins(test_component, 'outputs', 'OUT')
	ngv.fix_ng_inputs_outputs(test_component)

	ports = ngv.get_ports(test_component)
	assert ports is not None

	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	ngv.set_primitive_name_dictionary(orig_name_dict)

def test_get_port_input_name():
	orig_name_dict = ngv.get_primitive_name_dictionary()
	ng_data = ngv.load_ng_data("tests/resources/nandgame_export.json")
	test_component = [component for component in ng_data if component['componentName'] == 'NandGame:Levels:SUB'][0]

	name = ngv.get_port_input_name(test_component['connections'][0], test_component, ng_data)
	assert len(name) > 0

	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	ngv.set_primitive_name_dictionary(orig_name_dict)

def load_component():
	with open("tests/resources/nandgame_export.json") as f:
		ng_data = json.load(f)

	ng_data = ngv.load.normalize_ng_data(ng_data)

	test_component = [component for component in ng_data if component['componentName'] == 'NandGame:Levels:SUB']
	assert len(test_component) == 1
	test_component = test_component[0]

	(name, inputs, outputs) = ngv.get_ng_level_io_pins('SUB')
	test_component["key"] = 'SUB'
	test_component["name"] = name
	test_component["inputs"] = inputs
	test_component["outputs"] = outputs

	return test_component
