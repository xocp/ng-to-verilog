import pytest

import ng_to_verilog as ngv


def test_primitive_name_dictionary():
	dict = { "one": 1, "two": "2" }
	ngv.set_primitive_name_dictionary(dict)
	dict = ngv.get_primitive_name_dictionary()

	assert dict["one"] == 1

def test_word_size():
	assert ngv.get_word_size() == ngv.DEFAULT_WORD_SIZE
	ngv.set_word_size(8)
	assert ngv.get_word_size() == 8
	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	assert ngv.get_word_size() == 16

	with pytest.raises(Exception):
		ngv.set_word_size(0)

	assert ngv.get_word_size() == ngv.DEFAULT_WORD_SIZE

def test_output_folder():
	assert ngv.get_output_folder() == "_output"
	ngv.set_output_folder("test")
	assert ngv.get_output_folder() == "test"
	ngv.set_output_folder("_output")
