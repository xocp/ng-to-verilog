# ng_to_verilog

ng_to_verilog is a Python module that enables conversion of [Nandgame](https://nandgame.com/) json exports into [Verilog](https://standards.ieee.org/ieee/1364/2051/).

Run your favorite Nandgame creations on real or simulated hardware! Reify your totally inefficient ripple-carry adders onto an FPGA board! Kickstart a career or life-long interest in digital logic from an accessible entry-point.

## Features

- Convert from Nandgame json exports into Verilog
- Automatic generation of testbench files, Verilog source code and primitives
- Compatible with iverilog and your favorite EDA tool / FPGA development boards
- Uses Jinja2 templating system for Verilog file generation

## Motivation

People end up doing digital logic design from many different starting points. My 10 year old son became interested in digital logic from Minecraft and the many YouTube Minecraft Redstone content creators such as [Mattbatwings](https://www.youtube.com/@mattbatwings). There are a number of excellent game-oriented entry-points such as [Nandgame](https://nandgame.com/). How do you start from a game and level up into more mainstream digital design tools? This module provides one answer.

## Getting Started

```
pip install ng-to-verilog (TBD)
```

or, from the root folder of the repo

```
python -m pip install -e .
```

You can run the provided samples/NgToVerilog.py and it will convert a sample Nandgame export with a custom CPU. You can also uncomment and run the CPU3 export which is the Nandgame computer. You'll have to edit any exported ROMs and copy in specific level code for the Nandgame CPU. The included custom CPU loads a Fibonacci sequence program which is output on a debug port. A basic testbench will be created, but will no doubt need to be modified. In the case of the custom CPU, you will need to add two lines above RST=0; in mrcomputer_tb.v as shown below:

```python
// TODO: adjust any reg (input) values here
RST = 1;
#20;
RST = 0;
#10000;
```

## Credits
- To Olav Junker Kjær, the creator of [Nandgame](https://nandgame.com/) who has undoubtedly inspired more generations of people into the world of digital logic. Kudos.

## License
MIT
