import ng_to_verilog as ngv
import pytest

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
