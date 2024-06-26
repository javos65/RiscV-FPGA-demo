# RiscV-FPGA-demo
Quick demo for Lattice FPGA with RiscV, Based on Trenz CR00103-03 Certus-NX board.<br>

![logo](/images/CR00103-03demo.jpg?raw=true)

____

## About
FPGA based RiscV, based on the out-of-the-box 'hello world' template from Lattice.<br>
More info to be found on the following<br>

+ [Tenz Cruvi Board](https://wiki.trenz-electronic.de/display/PD/CR00103+Resources)
+ [Example1 - not the best example, but its a start.](https://antti-brain.blogspot.com/2022/04/lattice-propel-easy-way.html)
+ [Example2 - a bit more details but based on other board.](https://www.adiuvoengineering.com/post/lattice-propel-risc-v-part-one-hardware)
+ [Propel Tools video @ Lattice - MUST SEE !](https://www.latticesemi.com/Products/DesignSoftwareAndIP/FPGAandLDS/LatticePropel/Propel-Design-Environment-Video-Training-Series)

## Content
Content is the PRopel Builder (verilog project) and the Propel SDK code (C-project)<br>
Latticecureently is pretty lean on the base templates for propel and RiscV. This project is a try out and adds an I2C master port.<br>
C-Code is added to drive an AdaFruit PiOled display of 128x32 pixels to show the 

## Wiring
Follolw the Lattice Propel Video's to understand the work-flow for designing a RiscV on FPGA.<br>
Key is to add the post-constain file to constain the IO pins of the RX/TX and SCL and SDA pins.

![logo](/images/Propel_Schematic.jpg?raw=true)


