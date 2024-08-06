from setuptools import setup

setup(
   name='ng_to_verilog',
   version='1.0',
   description='Convert Nandgame json exports into Verilog',
   author='Patrick Cox',
   author_email='patrick.cox@gmail.com',
   packages=['ng_to_verilog'],
   install_requires=['Jinja2', 'MarkupSafe', 'setuptools', 'wheel']
)
