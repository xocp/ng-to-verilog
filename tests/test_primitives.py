import ng_to_verilog as ngv


def test_fix_ng_primitives():
	orig_name_dict = ngv.get_primitive_name_dictionary()
	ngv.set_primitive_name_dictionary({})

	ng_data = ngv.load_ng_data("tests/resources/nandgame_export.json")
	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	ngv.fix_ng_primitives(ng_data)
	assert len(ngv.get_primitive_name_dictionary()) == 0

	ngv.set_word_size(8)
	ngv.fix_ng_primitives(ng_data)
	new_name_dict = ngv.get_primitive_name_dictionary()
	assert len(new_name_dict) > 0
	assert new_name_dict["SPLIT16"]["newName"] == "SPLIT8"
	assert new_name_dict["BUNDLE16"]["newName"] == "BUNDLE8"
	assert new_name_dict["ZERO16"]["newName"] == "ZERO8"

	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	ngv.set_primitive_name_dictionary(orig_name_dict)

def test_fix_ng_primitive_refs():
	orig_name_dict = ngv.get_primitive_name_dictionary()

	ng_data = ngv.load_ng_data("tests/resources/nandgame_export.json")
	ngv.set_word_size(8)
	ngv.fix_ng_primitives(ng_data)

	test_component = [component for component in ng_data if component['componentName'] == 'NandGame:Levels:SUB']
	assert len(test_component) == 1
	test_component = test_component[0]

	test_node = [node for node in test_component['nodes'] if node['type'] == 'INC16']
	assert len(test_node) == 1
	test_node = test_node[0]

	ngv.fix_ng_primitive_refs(test_component)

	assert test_node['type'] == 'INC8'

	ngv.set_word_size(ngv.DEFAULT_WORD_SIZE)
	ngv.set_primitive_name_dictionary(orig_name_dict)
