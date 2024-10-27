import ng_to_verilog as ngv

def test_load_ng_data():
	ngData = ngv.load_ng_data("tests/resources/nandgame_export.json")
	assert ngData is not None
