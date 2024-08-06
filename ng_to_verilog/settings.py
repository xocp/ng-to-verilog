_MIN_WORD_SIZE = 2
DEFAULT_WORD_SIZE = 16

# override this below by calling set_word_size if you've used Nandgame to create a computer with other than a 16-bit word size
_word_size = DEFAULT_WORD_SIZE
_output_folder = "_output"
_exported_components = []
_primitiveNameDictionary = None

def get_primitive_name_dictionary():
	global _primitiveNameDictionary
	return _primitiveNameDictionary

def set_primitive_name_dictionary(dict):
	global _primitiveNameDictionary
	_primitiveNameDictionary = dict

def get_word_size():
	global _word_size
	return _word_size

def set_word_size(size):
	global _word_size

	if size > DEFAULT_WORD_SIZE or size < _MIN_WORD_SIZE:
		raise Exception(f"Word size must be between {_MIN_WORD_SIZE} and {DEFAULT_WORD_SIZE}")

	_word_size = size

def get_output_folder():
	global _output_folder
	return _output_folder

def set_output_folder(folderName):
	global _output_folder
	_output_folder = folderName