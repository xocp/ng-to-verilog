# ng_to_verilog

ng_to_verilog is a Python module that enables conversion of [Nandgame](https://nandgame.com/) json exports into [Verilog](https://standards.ieee.org/ieee/1364/2051/).

Run your favorite Nandgame creations on real or simulated hardware! Reify your totally inefficient ripple-carry adders onto an FPGA board! Kickstart a career or life-long interest in digital logic from an accessible entry-point.

![Nandgame](https://github.com/xocp/ng-to-verilog/blob/main/images/nandgame_mrcomputer.png?raw=true)

## Features

- Convert from Nandgame json exports into Verilog
- Automatic generation of testbench files, Verilog source code and primitives
- Compatible with iverilog and your favorite EDA tool / FPGA development boards
- Uses Jinja2 templating system for Verilog file generation
- Linux and Windows support
- Output has been tested in iverilog as well as Vivado
- Sample CPU was tested on an Arty S7-25 FPGA board

## Motivation

People end up doing digital logic design from many different starting points. My 10 year old son became interested in digital logic from Minecraft and the many YouTube Minecraft Redstone content creators such as [Mattbatwings](https://www.youtube.com/@mattbatwings). There are a number of excellent game-oriented entry-points such as [Nandgame](https://nandgame.com/). How do you start from a game and level up into more mainstream digital design tools? This module provides one answer.

## Getting Started

```
pip install ng-to-verilog
```

or, from the root folder of the repo
```
python -m pip install -e .
```

You can run the provided example via `python3 samples/NgToVerilog.py` and it will convert a sample Nandgame export with a custom CPU into Icarus Verilog compatible output (see below for a Vivado output and FPGA synthesis using an Arty S7-25 development board). Build scripts will be generated for Icarus Verilog / GtkWave along with instructions output to the python console. You can also uncomment and run the CPU3 export which is the Nandgame computer. You'll have to edit any exported ROMs and copy in specific level code for the Nandgame CPU. The included custom CPU loads a Fibonacci sequence program which is output on a debug port. A basic testbench will be created, but will no doubt need to be modified. In the case of the custom CPU, a fileset is provided in samples/verilog that has had small modifications to enable running on an FPGA.

Sample GTKWave output, showing the Fibonacci sequence on a debug port
![Sample GTKWave Output](https://github.com/xocp/ng-to-verilog/blob/main/images/mrcomputer_gtkwave_sample.png?raw=true)

## Troubleshooting
All flip-flops and registers are converted to equivalent (non-primitive) Verilog. There is no provision currently for detecting custom flip-flop or register components. You will have to use the built-in Nandgame primitives.

One important note is that registers are exported to activate on posedge CLK. However, the 1-bit D flip-flop is exported to activate on negedge CLK. This is the configuration that worked for the purposes of the sample CPU. You may have to experiment here.

## FPGA Notes
Included in the samples/verilog folder is a Vivado constraints file for the Arty S7-25, which can be used in Vivado, along with the testbench and associated files, to enable flashing to FPGA. The defined constraint names are referenced in the testbench file (e.g., clock, LEDs).

![Running on Arty S7-25](https://github.com/xocp/ng-to-verilog/blob/main/images/mrcomputer_fpga.gif?raw=true)

## Credits
- To Olav Junker Kjær, the creator of [Nandgame](https://nandgame.com/) who has undoubtedly inspired more generations of people into the world of digital logic. Kudos.

## License
MIT
