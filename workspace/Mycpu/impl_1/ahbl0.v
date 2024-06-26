// Verilog netlist produced by program LSE 
// Netlist written on Wed Jun 26 14:45:33 2024
// Source file index table: 
// Object locations will have the form @<file_index>(<first_ line>[<left_column>],<last_line>[<right_column>])
// file 0 "c:/lscc/radiant/2023.2/ip/avant/fifo/rtl/lscc_fifo.v"
// file 1 "c:/lscc/radiant/2023.2/ip/avant/fifo_dc/rtl/lscc_fifo_dc.v"
// file 2 "c:/lscc/radiant/2023.2/ip/avant/ram_dp/rtl/lscc_ram_dp.v"
// file 3 "c:/lscc/radiant/2023.2/ip/avant/ram_dp_true/rtl/lscc_ram_dp_true.v"
// file 4 "c:/lscc/radiant/2023.2/ip/avant/ram_dq/rtl/lscc_ram_dq.v"
// file 5 "c:/lscc/radiant/2023.2/ip/avant/rom/rtl/lscc_rom.v"
// file 6 "c:/lscc/radiant/2023.2/ip/common/adder/rtl/lscc_adder.v"
// file 7 "c:/lscc/radiant/2023.2/ip/common/adder_subtractor/rtl/lscc_add_sub.v"
// file 8 "c:/lscc/radiant/2023.2/ip/common/complex_mult/rtl/lscc_complex_mult.v"
// file 9 "c:/lscc/radiant/2023.2/ip/common/counter/rtl/lscc_cntr.v"
// file 10 "c:/lscc/radiant/2023.2/ip/common/distributed_dpram/rtl/lscc_distributed_dpram.v"
// file 11 "c:/lscc/radiant/2023.2/ip/common/distributed_rom/rtl/lscc_distributed_rom.v"
// file 12 "c:/lscc/radiant/2023.2/ip/common/distributed_spram/rtl/lscc_distributed_spram.v"
// file 13 "c:/lscc/radiant/2023.2/ip/common/mult_accumulate/rtl/lscc_mult_accumulate.v"
// file 14 "c:/lscc/radiant/2023.2/ip/common/mult_add_sub/rtl/lscc_mult_add_sub.v"
// file 15 "c:/lscc/radiant/2023.2/ip/common/mult_add_sub_sum/rtl/lscc_mult_add_sub_sum.v"
// file 16 "c:/lscc/radiant/2023.2/ip/common/multiplier/rtl/lscc_multiplier.v"
// file 17 "c:/lscc/radiant/2023.2/ip/common/ram_shift_reg/rtl/lscc_shift_register.v"
// file 18 "c:/lscc/radiant/2023.2/ip/common/subtractor/rtl/lscc_subtractor.v"
// file 19 "c:/lscc/radiant/2023.2/ip/pmi/pmi_add.v"
// file 20 "c:/lscc/radiant/2023.2/ip/pmi/pmi_addsub.v"
// file 21 "c:/lscc/radiant/2023.2/ip/pmi/pmi_complex_mult.v"
// file 22 "c:/lscc/radiant/2023.2/ip/pmi/pmi_counter.v"
// file 23 "c:/lscc/radiant/2023.2/ip/pmi/pmi_distributed_dpram.v"
// file 24 "c:/lscc/radiant/2023.2/ip/pmi/pmi_distributed_rom.v"
// file 25 "c:/lscc/radiant/2023.2/ip/pmi/pmi_distributed_shift_reg.v"
// file 26 "c:/lscc/radiant/2023.2/ip/pmi/pmi_distributed_spram.v"
// file 27 "c:/lscc/radiant/2023.2/ip/pmi/pmi_fifo.v"
// file 28 "c:/lscc/radiant/2023.2/ip/pmi/pmi_fifo_dc.v"
// file 29 "c:/lscc/radiant/2023.2/ip/pmi/pmi_mac.v"
// file 30 "c:/lscc/radiant/2023.2/ip/pmi/pmi_mult.v"
// file 31 "c:/lscc/radiant/2023.2/ip/pmi/pmi_multaddsub.v"
// file 32 "c:/lscc/radiant/2023.2/ip/pmi/pmi_multaddsubsum.v"
// file 33 "c:/lscc/radiant/2023.2/ip/pmi/pmi_ram_dp.v"
// file 34 "c:/lscc/radiant/2023.2/ip/pmi/pmi_ram_dp_be.v"
// file 35 "c:/lscc/radiant/2023.2/ip/pmi/pmi_ram_dp_true.v"
// file 36 "c:/lscc/radiant/2023.2/ip/pmi/pmi_ram_dq.v"
// file 37 "c:/lscc/radiant/2023.2/ip/pmi/pmi_ram_dq_be.v"
// file 38 "c:/lscc/radiant/2023.2/ip/pmi/pmi_rom.v"
// file 39 "c:/lscc/radiant/2023.2/ip/pmi/pmi_sub.v"
// file 40 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/acc54.v"
// file 41 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/adc.v"
// file 42 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/alureg.v"
// file 43 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/bb_adc.v"
// file 44 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/bb_cdr.v"
// file 45 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/bb_i3c_a.v"
// file 46 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/bfd1p3kx.v"
// file 47 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/bfd1p3lx.v"
// file 48 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/bnkref18.v"
// file 49 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/config_ip.v"
// file 50 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/config_lmmi.v"
// file 51 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ddrdll.v"
// file 52 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/diffio18.v"
// file 53 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/dlldel.v"
// file 54 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/dp16k.v"
// file 55 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/dpsc512k.v"
// file 56 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/dqsbuf.v"
// file 57 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ebr.v"
// file 58 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/eclkdiv.v"
// file 59 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/eclksync.v"
// file 60 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/fbmux.v"
// file 61 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/fifo16k.v"
// file 62 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/i2cfifo.v"
// file 63 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ifd1p3bx.v"
// file 64 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ifd1p3dx.v"
// file 65 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ifd1p3ix.v"
// file 66 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ifd1p3jx.v"
// file 67 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/iologic.v"
// file 68 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/jtag.v"
// file 69 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/lram.v"
// file 70 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/m18x36.v"
// file 71 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mipi.v"
// file 72 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mult18.v"
// file 73 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mult18x18.v"
// file 74 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mult18x36.v"
// file 75 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mult36.v"
// file 76 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mult36x36.v"
// file 77 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mult9.v"
// file 78 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/mult9x9.v"
// file 79 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multaddsub18x18.v"
// file 80 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multaddsub18x18wide.v"
// file 81 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multaddsub18x36.v"
// file 82 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multaddsub36x36.v"
// file 83 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multaddsub9x9wide.v"
// file 84 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multiboot.v"
// file 85 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multpreadd18x18.v"
// file 86 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/multpreadd9x9.v"
// file 87 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ofd1p3bx.v"
// file 88 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ofd1p3dx.v"
// file 89 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ofd1p3ix.v"
// file 90 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/ofd1p3jx.v"
// file 91 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/osc.v"
// file 92 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/osca.v"
// file 93 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/pcie.v"
// file 94 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/pdp16k.v"
// file 95 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/pdpsc16k.v"
// file 96 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/pdpsc512k.v"
// file 97 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/pll.v"
// file 98 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/plla.v"
// file 99 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/pllrefcs.v"
// file 100 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/pmu.v"
// file 101 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/preadd9.v"
// file 102 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/refmux.v"
// file 103 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/reg18.v"
// file 104 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/sedc.v"
// file 105 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/seio18.v"
// file 106 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/seio33.v"
// file 107 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/sgmiicdr.v"
// file 108 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/siologic.v"
// file 109 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/sp16k.v"
// file 110 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/sp512k.v"
// file 111 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/tsalla.v"
// file 112 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/lfd2nx/wdt.v"
// file 113 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/dpr16x4.v"
// file 114 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/fd1p3bx.v"
// file 115 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/fd1p3dx.v"
// file 116 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/fd1p3ix.v"
// file 117 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/fd1p3jx.v"
// file 118 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/gsr.v"
// file 119 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/ib.v"
// file 120 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/ob.v"
// file 121 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/obz.v"
// file 122 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/pclkdivsp.v"
// file 123 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/spr16x4.v"
// file 124 "c:/lscc/radiant/2023.2/cae_library/simulation/verilog/uaplatform/widefn9.v"

//
// Verilog Description of module ahbl0
// module wrapper written out since it is a black-box. 
//

//

module ahbl0 (ahbl_hclk_i, ahbl_hresetn_i, ahbl_m01_hready_mstr_i, ahbl_m01_hresp_mstr_i, 
            ahbl_m01_hrdata_mstr_i, ahbl_m01_hsel_mstr_o, ahbl_m01_haddr_mstr_o, 
            ahbl_m01_hburst_mstr_o, ahbl_m01_hsize_mstr_o, ahbl_m01_hmastlock_mstr_o, 
            ahbl_m01_hprot_mstr_o, ahbl_m01_htrans_mstr_o, ahbl_m01_hwdata_mstr_o, 
            ahbl_m01_hwrite_mstr_o, ahbl_m01_hready_mstr_o, ahbl_s00_hsel_slv_i, 
            ahbl_s00_haddr_slv_i, ahbl_s00_hburst_slv_i, ahbl_s00_hsize_slv_i, 
            ahbl_s00_hmastlock_slv_i, ahbl_s00_hprot_slv_i, ahbl_s00_htrans_slv_i, 
            ahbl_s00_hwdata_slv_i, ahbl_s00_hwrite_slv_i, ahbl_s00_hready_slv_i, 
            ahbl_s00_hreadyout_slv_o, ahbl_s00_hresp_slv_o, ahbl_s00_hrdata_slv_o, 
            ahbl_m00_hready_mstr_i, ahbl_m00_hresp_mstr_i, ahbl_m00_hrdata_mstr_i, 
            ahbl_m00_hsel_mstr_o, ahbl_m00_haddr_mstr_o, ahbl_m00_hburst_mstr_o, 
            ahbl_m00_hsize_mstr_o, ahbl_m00_hmastlock_mstr_o, ahbl_m00_hprot_mstr_o, 
            ahbl_m00_htrans_mstr_o, ahbl_m00_hwdata_mstr_o, ahbl_m00_hwrite_mstr_o, 
            ahbl_m00_hready_mstr_o) /* synthesis cpe_box=1 */ ;
    input ahbl_hclk_i;
    input ahbl_hresetn_i;
    input [0:0]ahbl_m01_hready_mstr_i;
    input [0:0]ahbl_m01_hresp_mstr_i;
    input [31:0]ahbl_m01_hrdata_mstr_i;
    output [0:0]ahbl_m01_hsel_mstr_o;
    output [31:0]ahbl_m01_haddr_mstr_o;
    output [2:0]ahbl_m01_hburst_mstr_o;
    output [2:0]ahbl_m01_hsize_mstr_o;
    output [0:0]ahbl_m01_hmastlock_mstr_o;
    output [3:0]ahbl_m01_hprot_mstr_o;
    output [1:0]ahbl_m01_htrans_mstr_o;
    output [31:0]ahbl_m01_hwdata_mstr_o;
    output [0:0]ahbl_m01_hwrite_mstr_o;
    output [0:0]ahbl_m01_hready_mstr_o;
    input [0:0]ahbl_s00_hsel_slv_i;
    input [31:0]ahbl_s00_haddr_slv_i;
    input [2:0]ahbl_s00_hburst_slv_i;
    input [2:0]ahbl_s00_hsize_slv_i;
    input [0:0]ahbl_s00_hmastlock_slv_i;
    input [3:0]ahbl_s00_hprot_slv_i;
    input [1:0]ahbl_s00_htrans_slv_i;
    input [31:0]ahbl_s00_hwdata_slv_i;
    input [0:0]ahbl_s00_hwrite_slv_i;
    input [0:0]ahbl_s00_hready_slv_i;
    output [0:0]ahbl_s00_hreadyout_slv_o;
    output [0:0]ahbl_s00_hresp_slv_o;
    output [31:0]ahbl_s00_hrdata_slv_o;
    input [0:0]ahbl_m00_hready_mstr_i;
    input [0:0]ahbl_m00_hresp_mstr_i;
    input [31:0]ahbl_m00_hrdata_mstr_i;
    output [0:0]ahbl_m00_hsel_mstr_o;
    output [31:0]ahbl_m00_haddr_mstr_o;
    output [2:0]ahbl_m00_hburst_mstr_o;
    output [2:0]ahbl_m00_hsize_mstr_o;
    output [0:0]ahbl_m00_hmastlock_mstr_o;
    output [3:0]ahbl_m00_hprot_mstr_o;
    output [1:0]ahbl_m00_htrans_mstr_o;
    output [31:0]ahbl_m00_hwdata_mstr_o;
    output [0:0]ahbl_m00_hwrite_mstr_o;
    output [0:0]ahbl_m00_hready_mstr_o;
    
    
    
endmodule
