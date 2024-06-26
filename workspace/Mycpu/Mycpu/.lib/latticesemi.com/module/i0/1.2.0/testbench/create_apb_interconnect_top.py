#!/usr/bin/python2.4


def write_top_codes(mst_no,slv_no):
    f_rtl.write("// =============================================================================\n")
    f_rtl.write("// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")
    f_rtl.write("// -----------------------------------------------------------------------------\n")
    f_rtl.write("//   Copyright (c) 2019 by Lattice Semiconductor Corporation\n")
    f_rtl.write("//   ALL RIGHTS RESERVED\n")
    f_rtl.write("// -----------------------------------------------------------------------------\n")
    f_rtl.write("//\n")
    f_rtl.write("//   Permission:\n\n")
    f_rtl.write("//      Lattice SG Pte. Ltd. grants permission to use this code\n")
    f_rtl.write("//      pursuant to the terms of the Lattice Reference Design License Agreement.\n")
    f_rtl.write("//\n")
    f_rtl.write("//\n")
    f_rtl.write("//   Disclaimer:\n\n")
    f_rtl.write("//      This VHDL or Verilog source code is intended as a design reference\n")
    f_rtl.write("//      which illustrates how these types of functions can be implemented.\n")
    f_rtl.write("//      It is the user's responsibility to verify their design for\n")
    f_rtl.write("//      consistency and functionality through the use of formal\n")
    f_rtl.write("//      verification methods.  Lattice provides no warranty\n")
    f_rtl.write("//      regarding the use or functionality of this code.\n\n")
    f_rtl.write("// -----------------------------------------------------------------------------\n")
    f_rtl.write("//\n")
    f_rtl.write("//                  Lattice SG Pte. Ltd.\n")
    f_rtl.write("//                  101 Thomson Road, United Square #07-02\n")
    f_rtl.write("//                  Singapore 307591\n\n\n")
    f_rtl.write("//                  TEL: 1-800-Lattice (USA and Canada)\n")
    f_rtl.write("//                       +65-6631-2000 (Singapore)\n")
    f_rtl.write("//                       +1-503-268-8001 (other locations)\n\n")
    f_rtl.write("//                  web: http://www.latticesemi.com/\n")
    f_rtl.write("//                  email: techsupport@latticesemi.com\n\n")
    f_rtl.write("// -----------------------------------------------------------------------------\n")
    f_rtl.write("//\n")
    f_rtl.write("//\n")
    f_rtl.write("// =============================================================================\n")
    f_rtl.write("//                         FILE DETAILS\n")
    f_rtl.write("// Project               :\n")
    f_rtl.write("// File                  : apb_int_top.v\n")
    f_rtl.write("// Title                 :\n")
    f_rtl.write("// Dependencies          : 1.\n")
    f_rtl.write("//                       : 2.\n")
    f_rtl.write("// Description           :\n")
    f_rtl.write("// =============================================================================\n")
    f_rtl.write("//                        REVISION HISTORY\n")
    f_rtl.write("// Version               : 1.0.0\n")
    f_rtl.write("// Author(s)             :\n")
    f_rtl.write("// Mod. Date             :\n")
    f_rtl.write("// Changes Made          : Initial release.\n")
    f_rtl.write("// =============================================================================\n\n")
    f_rtl.write("`ifndef APB_INT_TOP\n")
    f_rtl.write("`define APB_INT_TOP\n\n")
    f_rtl.write("`timescale 1 ns / 1 ps\n\n")
    f_rtl.write("`include \"lscc_apb_master_dummy.v\"\n")
    f_rtl.write("`include \"lscc_apb_slave_dummy.v\"\n\n")
    f_rtl.write("module apb_int_top (\n")
    f_rtl.write("input         apb_pclk_i        ,\n")
    f_rtl.write("input         apb_presetn_i     ,\n")
    f_rtl.write("\n")
    f_rtl.write("input  [%d:0] apb_mstr_dummy_in ,\n" % (mst_no - 1))
    f_rtl.write("output [%d:0] apb_mstr_dummy_out,\n" % (mst_no - 1))
    f_rtl.write("input  [%d:0] apb_slv_dummy_in  ,\n" % (slv_no - 1))
    f_rtl.write("output [%d:0] apb_slv_dummy_out\n" % (slv_no - 1))
    f_rtl.write(");\n\n")
    f_rtl.write("`include \"dut_params.v\"\n\n")


def create_mst2int_wires(idx):
    f_rtl.write("  wire                    apb_s%02d_psel_slv_i   ;\n" % idx) 
    f_rtl.write("  wire [M_ADDR_WIDTH-1:0] apb_s%02d_paddr_slv_i  ;\n" % idx) 
    f_rtl.write("  wire                    apb_s%02d_pwrite_slv_i ;\n" % idx) 
    f_rtl.write("  wire [DATA_WIDTH-1:0]   apb_s%02d_pwdata_slv_i ;\n" % idx) 
    f_rtl.write("  wire                    apb_s%02d_penable_slv_i;\n" % idx) 
    f_rtl.write("  wire                    apb_s%02d_pready_slv_o ;\n" % idx) 
    f_rtl.write("  wire                    apb_s%02d_pslverr_slv_o;\n" % idx) 
    f_rtl.write("  wire [DATA_WIDTH-1:0]   apb_s%02d_prdata_slv_o ;\n" % idx)
    f_rtl.write("\n")


def instantiate_dummy_master(idx):
    f_rtl.write("  lscc_apb_master_dummy #(\n")
    f_rtl.write("    .DATA_WIDTH(DATA_WIDTH  ),\n")
    f_rtl.write("    .ADDR_WIDTH(M_ADDR_WIDTH))\n")
    f_rtl.write("  apb_mst_%02d (\n" % idx)
    f_rtl.write("    .apb_pclk_i        (apb_pclk_i             ),\n")
    f_rtl.write("    .apb_presetn_i     (apb_presetn_i          ),\n")
    f_rtl.write("    .apb_psel_o        (apb_s%02d_psel_slv_i   ),\n" % idx)
    f_rtl.write("    .apb_paddr_o       (apb_s%02d_paddr_slv_i  ),\n" % idx)
    f_rtl.write("    .apb_pwdata_o      (apb_s%02d_pwdata_slv_i ),\n" % idx)
    f_rtl.write("    .apb_pwrite_o      (apb_s%02d_pwrite_slv_i ),\n" % idx)
    f_rtl.write("    .apb_penable_o     (apb_s%02d_penable_slv_i),\n" % idx)
    f_rtl.write("    .apb_pready_i      (apb_s%02d_pready_slv_o ),\n" % idx)
    f_rtl.write("    .apb_pslverr_i     (apb_s%02d_pslverr_slv_o),\n" % idx)
    f_rtl.write("    .apb_prdata_i      (apb_s%02d_prdata_slv_o ),\n" % idx)
    f_rtl.write("    .apb_mstr_dummy_in (apb_mstr_dummy_in[%d]  ),\n" % idx)
    f_rtl.write("    .apb_mstr_dummy_out(apb_mstr_dummy_out[%d] ));\n" % idx)
    f_rtl.write("\n")
    

def create_int2slv_wires(idx):
    f_rtl.write("  wire                    apb_m%02d_psel_mstr_o   ;\n" % idx) 
    f_rtl.write("  wire [M_ADDR_WIDTH-1:0] apb_m%02d_paddr_mstr_o  ;\n" % idx) 
    f_rtl.write("  wire                    apb_m%02d_pwrite_mstr_o ;\n" % idx) 
    f_rtl.write("  wire [DATA_WIDTH-1:0]   apb_m%02d_pwdata_mstr_o ;\n" % idx) 
    f_rtl.write("  wire                    apb_m%02d_penable_mstr_o;\n" % idx) 
    f_rtl.write("  wire                    apb_m%02d_pready_mstr_i ;\n" % idx) 
    f_rtl.write("  wire                    apb_m%02d_pslverr_mstr_i;\n" % idx) 
    f_rtl.write("  wire [DATA_WIDTH-1:0]   apb_m%02d_prdata_mstr_i ;\n" % idx)
    f_rtl.write("\n")
    

def instantiate_dummy_slave(idx):
    f_rtl.write("  lscc_apb_slave_dummy #(\n")
    f_rtl.write("    .DATA_WIDTH(DATA_WIDTH  ),\n")
    f_rtl.write("    .ADDR_WIDTH(M_ADDR_WIDTH))\n")
    f_rtl.write("  apb_slv_%02d (\n" % idx)
    f_rtl.write("    .apb_pclk_i       (apb_pclk_i              ),\n")
    f_rtl.write("    .apb_presetn_i    (apb_presetn_i           ),\n")
    f_rtl.write("    .apb_psel_i       (apb_m%02d_psel_mstr_o   ),\n" % idx)
    f_rtl.write("    .apb_paddr_i      (apb_m%02d_paddr_mstr_o  ),\n" % idx)
    f_rtl.write("    .apb_pwdata_i     (apb_m%02d_pwdata_mstr_o ),\n" % idx)
    f_rtl.write("    .apb_pwrite_i     (apb_m%02d_pwrite_mstr_o ),\n" % idx)
    f_rtl.write("    .apb_penable_i    (apb_m%02d_penable_mstr_o),\n" % idx)
    f_rtl.write("    .apb_pready_o     (apb_m%02d_pready_mstr_i ),\n" % idx)
    f_rtl.write("    .apb_pslverr_o    (apb_m%02d_pslverr_mstr_i),\n" % idx)
    f_rtl.write("    .apb_prdata_o     (apb_m%02d_prdata_mstr_i ),\n" % idx)
    f_rtl.write("    .apb_slv_dummy_in (apb_slv_dummy_in[%d]    ),\n" % idx)
    f_rtl.write("    .apb_slv_dummy_out(apb_slv_dummy_out[%d]   ));\n" % idx)
    f_rtl.write("\n")
    

# Main sequence
f_params = open('testbench/dut_params.v', 'r')
line = f_params.readline()
pos1 = line.index('=')
pos2 = line.index(';')
total_mst = int(line[(pos1 + 1):pos2])
line = f_params.readline()
pos1 = line.index('=')
pos2 = line.index(';')
total_slv = int(line[(pos1 + 1):pos2])
f_params.close()

f_rtl = open('testbench/apb_int_top.v', 'w')
write_top_codes(total_mst,total_slv)
f_rtl.write("// Instantiating Dummy Masters\n")
for mst_num in range(0, (total_mst-1) + 1):
    create_mst2int_wires(mst_num)
for slv_num in range(0, (total_slv-1) + 1):
    create_int2slv_wires(slv_num)
for mst_num in range(0, (total_mst-1) + 1):
    instantiate_dummy_master(mst_num)
f_rtl.write("\n// Instantiating Dummy Slaves\n")
for slv_num in range(0, (total_slv-1) + 1):
    instantiate_dummy_slave(slv_num)

f_rtl.write("\n`include \"dut_inst.v\"\n\n")
f_rtl.write("endmodule\n")
f_rtl.write("`endif\n")
f_rtl.close()