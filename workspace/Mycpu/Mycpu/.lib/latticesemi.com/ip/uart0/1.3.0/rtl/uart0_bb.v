/*******************************************************************************
    Verilog netlist generated by IPGEN Lattice Propel (64-bit)
    2023.2.2311232310
    Soft IP Version: 1.3.0
    2024 06 21 15:47:03
*******************************************************************************/
/*******************************************************************************
    Wrapper Module generated per user settings.
*******************************************************************************/
module uart0 (rxd_i, txd_o, clk_i, rst_n_i, int_o, apb_penable_i, apb_psel_i,
    apb_pwrite_i, apb_paddr_i, apb_pwdata_i, apb_pready_o, apb_pslverr_o,
    apb_prdata_o)/* synthesis syn_black_box syn_declare_black_box=1 */;
    input  rxd_i;
    output  txd_o;
    input  clk_i;
    input  rst_n_i;
    output  int_o;
    input  apb_penable_i;
    input  apb_psel_i;
    input  apb_pwrite_i;
    input  [5:0]  apb_paddr_i;
    input  [31:0]  apb_pwdata_i;
    output  apb_pready_o;
    output  apb_pslverr_o;
    output  [31:0]  apb_prdata_o;
endmodule