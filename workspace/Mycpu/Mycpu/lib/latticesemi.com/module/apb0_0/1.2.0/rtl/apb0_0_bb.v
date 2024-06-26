/*******************************************************************************
    Verilog netlist generated by IPGEN Lattice Propel (64-bit)
    2023.2.2311232310
    Soft IP Version: 1.2.0
    2024 06 21 20:32:01
*******************************************************************************/
/*******************************************************************************
    Wrapper Module generated per user settings.
*******************************************************************************/
module apb0_0 (apb_pclk_i, apb_presetn_i, apb_m01_pready_mstr_i,
    apb_m01_pslverr_mstr_i, apb_m01_prdata_mstr_i, apb_m01_psel_mstr_o,
    apb_m01_paddr_mstr_o, apb_m01_pwrite_mstr_o, apb_m01_pwdata_mstr_o,
    apb_m01_penable_mstr_o, apb_s00_psel_slv_i, apb_s00_paddr_slv_i,
    apb_s00_pwrite_slv_i, apb_s00_pwdata_slv_i, apb_s00_penable_slv_i,
    apb_s00_pready_slv_o, apb_s00_pslverr_slv_o, apb_s00_prdata_slv_o,
    apb_m00_pready_mstr_i, apb_m00_pslverr_mstr_i, apb_m00_prdata_mstr_i,
    apb_m00_psel_mstr_o, apb_m00_paddr_mstr_o, apb_m00_pwrite_mstr_o,
    apb_m00_pwdata_mstr_o, apb_m00_penable_mstr_o)/* synthesis syn_black_box syn_declare_black_box=1 */;
    input  apb_pclk_i;
    input  apb_presetn_i;
    input  [0:0]  apb_m01_pready_mstr_i;
    input  [0:0]  apb_m01_pslverr_mstr_i;
    input  [31:0]  apb_m01_prdata_mstr_i;
    output  [0:0]  apb_m01_psel_mstr_o;
    output  [31:0]  apb_m01_paddr_mstr_o;
    output  [0:0]  apb_m01_pwrite_mstr_o;
    output  [31:0]  apb_m01_pwdata_mstr_o;
    output  [0:0]  apb_m01_penable_mstr_o;
    input  [0:0]  apb_s00_psel_slv_i;
    input  [31:0]  apb_s00_paddr_slv_i;
    input  [0:0]  apb_s00_pwrite_slv_i;
    input  [31:0]  apb_s00_pwdata_slv_i;
    input  [0:0]  apb_s00_penable_slv_i;
    output  [0:0]  apb_s00_pready_slv_o;
    output  [0:0]  apb_s00_pslverr_slv_o;
    output  [31:0]  apb_s00_prdata_slv_o;
    input  [0:0]  apb_m00_pready_mstr_i;
    input  [0:0]  apb_m00_pslverr_mstr_i;
    input  [31:0]  apb_m00_prdata_mstr_i;
    output  [0:0]  apb_m00_psel_mstr_o;
    output  [31:0]  apb_m00_paddr_mstr_o;
    output  [0:0]  apb_m00_pwrite_mstr_o;
    output  [31:0]  apb_m00_pwdata_mstr_o;
    output  [0:0]  apb_m00_penable_mstr_o;
endmodule