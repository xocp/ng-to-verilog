import ng_to_verilog as ngv


def test_is_ng_primitive():
	assert ngv.is_ng_primitive({'componentName': 'test'}) is False
	assert ngv.is_ng_primitive({'componentName': 'NandGame:PrimitiveComponent:'}) is True

def test_is_ng_testbench():
	assert ngv.is_ng_testbench({'componentName': 'test'}) is False
	assert ngv.is_ng_testbench({'componentName': 'NandGame:TestbenchComponent:Testbench'}) is True

def test_fix_name():
	assert ngv.fix_name('xor') == '_xor'
	assert ngv.fix_name('123_as$df^') == '_123_asdf'

def test_strip_special_chars():
	assert ngv.strip_special_chars('x$or_') == 'xor_'

def test_get_component_id_key_name():
	assert ngv.get_component_id_key_name('12') == 'key'
	assert ngv.get_component_id_key_name('test') == 'name'
