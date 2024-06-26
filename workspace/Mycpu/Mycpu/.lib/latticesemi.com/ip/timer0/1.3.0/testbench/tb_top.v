//==========================================================================
// Module : tb_top
//==========================================================================
`timescale 1ns/1ps

`include "tb_defines.v"
`include "tb_mem.v"
`include "tb_data_checker.v"
`include "tb_apb_mst.v"
`include "tb_ahbl_mst.v"

module tb_top();
//--------------------------------------------------------------------------
//--- Local Parameters/Defines ---
//--------------------------------------------------------------------------
`include "dut_params.v"
// This period is in nanoseconds. Please update this value to the system 
// clock used.
localparam CLKPERIOD         = 20;
localparam CLKFREQ           = 1000/CLKPERIOD ; //ns to mhz
localparam WADDR_DEPTH       = 512;
localparam RADDR_DEPTH       = 512;

//--------------------------------------------------------------------------
//--- Combinational Wire/Reg ---
//--------------------------------------------------------------------------
wire                         int_o;
wire [31:0]                  apb_paddr_i;      
wire                         clk_i;       
wire                         apb_penable_i;    
wire [31:0]                  apb_prdata_o;     
wire                         apb_pready_o;     
wire                         rst_n_i;   
wire                         apb_psel_i;       
wire                         apb_pslverr_o;    
wire [31:0]                  apb_pwdata_i;     
wire                         apb_pwrite_i; 

wire                         ahbl_hsel_i;
wire                         ahbl_hready_i = 1'b1;
wire [31:0]                  ahbl_haddr_i;
wire [2:0]                   ahbl_hburst_i;    // n/a - fixed size
wire [2:0]                   ahbl_hsize_i;     // n/a - fixed size
wire                         ahbl_hmastlock_i; // n/a
wire [3:0]                   ahbl_hprot_i;     // n/a
wire [1:0]                   ahbl_htrans_i;
wire                         ahbl_hwrite_i;
wire [31:0]                  ahbl_hwdata_i;
wire                         ahbl_hreadyout_o;
wire                         ahbl_hresp_o;
wire [31:0]                  ahbl_hrdata_o;
wire [NUM_OF_TIMERS_BUS-1:0] timeout_o;
wire                         exp_mstr;
wire                         exp_slv;
wire                         exp_valid;
wire [31:0]                  exp_data;
wire                         obs_mstr;
wire                         obs_slv;
wire                         obs_valid;
wire [31:0]                  obs_data;
wire                         tb_done_w;
wire                         tb_error_w;

// ----------------------------
// GSR instance
// ----------------------------
`ifndef iCE40UP
GSR GSR_INST ( .GSR_N(1'b1), .CLK(1'b0));
`endif

// -----------------------------------------------------------------------------
// DUT
// -----------------------------------------------------------------------------
`include "dut_inst.v"

initial begin
  //$shm_open("tb_top_ps.shm");
  //$shm_probe(tb_top,("AC"));
  
  `N_MSG(          ("************************************************"))
  `N_MSG(          ("Start of Simulation                             "))
  `N_MSG(          ("+-----------------------------------------------"))
  `N_MSG(          ("Testbench Parameters                            "))
  `N_MSG(          ("+-----------------------------------------------"))
  `N_MSG(($sformatf("Host Interface         :   %s%0s",CSR_IF         ,{1{" "}} )))
  `N_MSG(($sformatf("System Clock (MHz)     :   %f%0s",CLKFREQ         ,{1{" "}})))
  `N_MSG(          ("+-----------------------------------------------"))
  `N_MSG(          ("+-----------------------------------------------"))
  `N_MSG(($sformatf("Driving Random %s%0s Transaction         ",CSR_IF,{1{" "}})))
  `N_MSG(          ("+-----------------------------------------------"))
  @(&tb_done_w)
  `TIME_DELAY(1000,clk_i)
  `N_MSG(          ("+-----------------------------------------------"))
  `N_MSG(          ("Transaction Done                                "))
  `N_MSG(          ("+-----------------------------------------------"))
  if (tb_error_w) begin
    `E_MSG(        ("              SIMULATION FAILED                 "))
  end
  else begin
    `N_MSG(        ("              SIMULATION PASSED                 "))
  end
  `ENDSIM(100,clk_i)

end


generate 
if (CSR_IF == "APB") begin
  //--------------------------------------------------------------------------
  // Assign Statements
  //--------------------------------------------------------------------------
  assign exp_mstr         = apb_psel_i && apb_penable_i && apb_pwrite_i && apb_pready_o;
  assign exp_valid        = exp_mstr ;
  assign exp_data         = exp_mstr ? apb_pwdata_i : 32'h0;
  assign obs_slv          = apb_psel_i && apb_penable_i && ~apb_pwrite_i && apb_pready_o;
  assign obs_valid        = obs_slv;
  assign obs_data         = obs_slv ? apb_prdata_o : 32'h0;

  // -----------------------------------------------------------------------------
  // APB Master
  // -----------------------------------------------------------------------------
  tb_apb_mst #(
    .CLKPERIOD      (CLKPERIOD      )
  ) u_tb_apb_mst (
    // Inputs
    .apb_prdata     (apb_prdata_o   ),
    .apb_pready     (apb_pready_o   ),
    .apb_pslverr    (apb_pslverr_o  ),
    .int_i          (int_o          ),
  
    // Outputs
    .apb_pclk       (clk_i          ),
    .apb_preset_n   (rst_n_i        ),
    .apb_paddr      (apb_paddr_i    ),
    .apb_penable    (apb_penable_i  ),
    .apb_psel       (apb_psel_i     ),
    .apb_pwdata     (apb_pwdata_i   ),
    .apb_pwrite     (apb_pwrite_i   ),
	.done_o         (tb_done_w      )
  );
end
else begin
  //--------------------------------------------------------------------------
  // Reg Declarations
  //--------------------------------------------------------------------------
  reg                     ahbl_hsel_r;
  reg                     ahbl_hwrite_r;
  reg [1:0]               ahbl_htrans_r;
  reg                     ahbl_hreadyout_r;
  reg                     obs_read_access;
  //--------------------------------------------------------------------------
  // Assign Statements
  //--------------------------------------------------------------------------
  assign exp_mstr         = ahbl_hsel_r && ahbl_hwrite_r && (ahbl_htrans_r==2'h2) && ahbl_hreadyout_r;
  assign exp_valid        = exp_mstr ;
  assign exp_data         = exp_mstr ? ahbl_hwdata_i : 32'h0;
  assign obs_slv          = obs_read_access && (ahbl_hreadyout_o && !ahbl_hreadyout_r);
  assign obs_valid        = obs_slv;
  assign obs_data         = obs_slv ? ahbl_hrdata_o : 32'h0;
  
    always @(posedge clk_i or negedge rst_n_i) begin
    if (!rst_n_i) begin
      obs_read_access        <= 1'b0;
    end
	else begin
      if (ahbl_hsel_i && !ahbl_hwrite_i && (ahbl_htrans_i==2'h2)) begin
	    obs_read_access <= 1'b1;
	  end
	  else if (obs_slv) begin
	    obs_read_access <= 1'b0;
	  end
    end
  end
  // -----------------------------------------------------------------------------
  // AHB-lite Master
  // -----------------------------------------------------------------------------
  tb_ahbl_mst #(
    .CLKPERIOD      (CLKPERIOD      )
  ) u_tb_ahbl_mst (
    .o_clk            (clk_i           ),
    .int_i            (int_o           ),
    .o_ahbl_resetn    (rst_n_i         ),
    .i_ahbl_hreadyout (ahbl_hreadyout_o),
    .i_ahbl_hrdata    (ahbl_hrdata_o   ),
    .o_ahbl_haddr     (ahbl_haddr_i    ),
    .o_ahbl_hwdata    (ahbl_hwdata_i   ),
    .o_ahbl_htrans    (ahbl_htrans_i   ),
    .o_ahbl_hwrite    (ahbl_hwrite_i   ),
    .o_ahbl_hburst    (ahbl_hburst_i   ),
    .o_ahbl_hsel      (ahbl_hsel_i     ),
    .o_ahbl_hsize     (ahbl_hsize_i    ),
    .o_ahbl_hmastlock (ahbl_hmastlock_i),
    .o_ahbl_hprot     (ahbl_hprot_i    ),
	.done_o           (tb_done_w       )
  );  
  
  always @(posedge clk_i or negedge rst_n_i) begin
    if (!rst_n_i) begin
      ahbl_hsel_r        <= 1'b0;
	  ahbl_hwrite_r      <= 1'b0;
	  ahbl_hreadyout_r   <= 1'b0;
	  ahbl_htrans_r      <= 2'b00;
    end
	else begin
      ahbl_hsel_r        <= ahbl_hsel_i;
	  ahbl_hwrite_r      <= ahbl_hwrite_i;
	  ahbl_hreadyout_r   <= ahbl_hreadyout_o;
	  ahbl_htrans_r      <= ahbl_htrans_i;
    end
  end

end
endgenerate

//--------------------------------------------------------------------------
// Data Checker
//--------------------------------------------------------------------------
tb_data_checker #(
  .WADDR_DEPTH       (WADDR_DEPTH       ),
  .WADDR_WIDTH       (clog2(WADDR_DEPTH)),
  .WDATA_WIDTH       (32                ),
  .RADDR_DEPTH       (RADDR_DEPTH       ),
  .RADDR_WIDTH       (clog2(RADDR_DEPTH)),
  .RDATA_WIDTH       (32                )
) u_tb_data_checker (
  // Outputs
  .error_o           (tb_error_w        ),
  // Inputs                             
  .clk_i             (clk_i             ),
  .rst_n_i           (rst_n_i           ),
  .exp_valid_i       (exp_valid         ),
  .exp_data_i        (exp_data          ),
  .obs_valid_i       (obs_valid         ),
  .obs_data_i        (obs_data          )
);

//------------------------------------------------------------------------------
// Function Definition
//------------------------------------------------------------------------------
// synopsys translate_off
function [31:0] clog2;
  input [31:0] value;
  reg   [31:0] num;
  begin
    num = value - 1;
    for (clog2 = 0; num > 0; clog2 = clog2 + 1) num = num >> 1;
  end
endfunction
// synopsys translate_on

//initial begin
//    $shm_open("./dump.shm");
//    $shm_probe(tb_top, ("AC"));
//end

endmodule
