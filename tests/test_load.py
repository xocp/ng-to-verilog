import unittest
from .context import ng_to_verilog as ngv

class TestLoad(unittest.TestCase):
    def test_load_ng_data(self):
        ngData = ngv.load_ng_data("samples/resources/nandgame_export.json")
        self.assertIsNotNone(ngData)

if __name__ == '__main__':
    unittest.main()
