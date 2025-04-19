import ng_to_verilog as ngv

ngData = ngv.load_ng_data("samples/resources/nandgame_export.json")

ngv.set_output_folder("_output")
ngv.set_target_platform(ngv.TargetPlatform.IVerilog)
ngv.export("m.r. computer", ngData)
# ngv.export("CPU3", ngData)
