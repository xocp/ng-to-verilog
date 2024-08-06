def is_ng_primitive(component):
	return component["componentName"].startswith("NandGame:PrimitiveComponent:")

def is_ng_testbench(component):
	return component["componentName"] == "NandGame:TestbenchComponent:Testbench"

def fix_name(name):
	name = strip_special_chars(name)

	if name[0:1].isnumeric():
		name = "_" + name

	# Verilog reserved words
	if name in ['always', 'and', 'assign', 'automatic',
		'begin', 'buf', 'bufif0', 'bufif1',
		'case', 'casex', 'casez', 'cell',
		'cmos', 'config', 'deassign', 'default',
		'defparam', 'design', 'disable', 'edge',
		'else', 'end', 'endcase', 'endconfig',
		'endfunction', 'endgenerate', 'endmodule', 'endprimitive',
		'endspecify', 'endtable', 'endtask', 'event',
		'for', 'force', 'forever', 'fork',
		'function', 'generate', 'genvar', 'highz0',
		'highz1', 'if', 'ifnone', 'incdir',
		'include', 'initial', 'inout', 'input',
		'instance', 'integer', 'join', 'larger',
		'liblist', 'library', 'localparam', 'macromodule',
		'medium', 'module', 'nand', 'negedge',
		'nmos', 'nor', 'noshow-cancelled', 'not',
		'notif0', 'notif1', 'or', 'output',
		'parameter', 'pmos', 'posedge', 'primitive',
		'pull0', 'pull1', 'pullup', 'pulldown',
		'pulsestyle_ondetect', 'pulsestyle_onevent', 'rcmos', 'real',
		'realtime', 'reg', 'release', 'repeat',
		'rnmos', 'rpmos', 'rtran', 'rtranif0',
		'rtranif1', 'scalared', 'show-cancelled', 'signed',
		'small', 'specify', 'specpa', 'strong0',
		'strong1', 'supply0', 'supply1', 'table',
		'task', 'time', 'tran', 'tranif0',
		'tranif1', 'tri', 'tri0', 'tri1',
		'triand', 'trior', 'trireg', 'use',
		'vectored', 'wait', 'wand', 'weak0',
		'weak1', 'while', 'wire', 'wor',
		'xnor', 'xor']:
		name = "_" + name
	
	return name

def strip_special_chars(input):
	return ''.join(e for e in input if e.isalnum() or e == "_")

def get_component_id_key_name(identifier):
	if identifier.isnumeric():
		return "key"
	else:
		return "name"
