# RiscV-FPGA-demo
Quick demo for Lattice FPGA with RiscV, Based on Trenz CR00103-03 Certus-NX board.<br>

![logo](/images/CR00103-03demo.jpg?raw=true)

____

## About
FPGA based RiscV, based on the out-of-the-box 'hello world' template from Lattice.<br>
More info to be found on the following<br>

+ [Trenz Cruvi Board](https://wiki.trenz-electronic.de/display/PD/CR00103+Resources)
+ [Example1 - not the best example, but its a start.](https://antti-brain.blogspot.com/2022/04/lattice-propel-easy-way.html)
+ [Example2 - a bit more details but based on other board.](https://www.adiuvoengineering.com/post/lattice-propel-risc-v-part-one-hardware)
+ [Propel Tools video @ Lattice - MUST SEE !](https://www.latticesemi.com/Products/DesignSoftwareAndIP/FPGAandLDS/LatticePropel/Propel-Design-Environment-Video-Training-Series)
+ [Lattice Certus-NX](https://www.latticesemi.com/products/fpgaandcpld/certus-nx)

## Content
Code Content is the Propel Builder (verilog project) and the Propel SDK code (C-project)<br>
Lattice currently is pretty lean on the base templates for propel and RiscV. This project is a try out and adds an I2C master port.<br>
C-Code is added to drive an AdaFruit PiOled display of 128x32 pixels to show the concept.

+ [Oled info / ssd1306 based](https://learn.adafruit.com/adafruit-pioled-128x32-mini-oled-for-raspberry-pi/overview)

## Wiring
Follow the Lattice Propel Video's to understand the work-flow for designing a RiscV on FPGA.<br>
Key is to add the post-constain file to constain the IO pins of the RX/TX and SCL/SDA pins, and add the sysmem initialisation to your C-code mem-file.<br>

+ ![logo](/images/Propel_Schematic.jpg?raw=true)
  <br>
+ ![logo](/images/Sysmem0.jpg?raw=true)

## Licenses
Propel is license free, but yo udo need to apply for a free license via their website.
+ [Tools / License overview](https://www.latticesemi.com/Support/Licensing)
