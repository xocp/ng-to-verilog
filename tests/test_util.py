import ng_to_verilog as ngv

def test_is_ng_primitive():
	assert ngv.is_ng_primitive({'componentName': 'test'}) is False
	assert ngv.is_ng_primitive({'componentName': 'NandGame:PrimitiveComponent:'}) is True
