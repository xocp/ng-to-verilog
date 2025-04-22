import ng_to_verilog as ngv

ngv.set_output_folder("_output")
ngv.set_register_trigger(ngv.RegisterTrigger.Default)

ngData = ngv.load_ng_data("samples/resources/nandgame_export.json")
ngv.export("m.r. computer", ngData)
# ngv.export("CPU3", ngData)
