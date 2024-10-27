import ng_to_verilog as ngv

def test_get_component():
	ngData = ngv.load_ng_data("tests/resources/nandgame_export.json")
	component = ngv.get_component('computer', ngData)
	assert component['name'] == 'computer'