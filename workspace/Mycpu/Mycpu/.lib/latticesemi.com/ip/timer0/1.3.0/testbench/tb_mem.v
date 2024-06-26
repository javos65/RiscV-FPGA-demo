// =============================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// -----------------------------------------------------------------------------
//   Copyright (c) 2017 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED
// -----------------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement.
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
// -----------------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
// -----------------------------------------------------------------------------
//
// =============================================================================
//                         FILE DETAILS
// Project               : 
// File                  : tb_mem.v
// Title                 :
// Dependencies          :
// Description           : 
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0.0.
// Author(s)             :
// Mod. Date             :
// Changes Made          : Initial release.
// =============================================================================

`ifndef TB_MEM
`define TB_MEM
module tb_mem #
(
parameter                     ADDR_DEPTH      = 512,
parameter                     ADDR_WIDTH      = clog2(ADDR_DEPTH),
parameter                     DATA_WIDTH      = 32
)
// -----------------------------------------------------------------------------
// Input/Output Ports
// -----------------------------------------------------------------------------
(
input                         clk_i,
input                         rst_n_i,

input                         wr_en_i,
input [DATA_WIDTH-1:0]        wr_data_i,
input [ADDR_WIDTH-1:0]        wr_addr_i,
input 			      rd_en_i,
input [ADDR_WIDTH-1:0]        rd_addr_i,

output reg [DATA_WIDTH-1:0]   rd_data_o
 
);

// -----------------------------------------------------------------------------
// Local Parameters
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register Declarations
// -----------------------------------------------------------------------------
reg [DATA_WIDTH*ADDR_DEPTH-1:0]        mem;

// -----------------------------------------------------------------------------
// Assign Statements
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Generate Sequential Blocks
// -----------------------------------------------------------------------------
always @(posedge clk_i or negedge rst_n_i) begin
  if (!rst_n_i) begin
    mem <= 0;
  end
  else begin
    if (wr_en_i) begin
      mem[DATA_WIDTH*wr_addr_i+:DATA_WIDTH] <= wr_data_i;
    end
    rd_data_o <= rd_en_i ? mem[DATA_WIDTH*rd_addr_i+:DATA_WIDTH] : rd_data_o;
  end
end

//------------------------------------------------------------------------------
// Function Definition
//------------------------------------------------------------------------------
function [31:0] clog2;
  input [31:0] value;
  reg   [31:0] num;
  begin
    num = value - 1;
    for (clog2=0; num>0; clog2=clog2+1) num = num>>1;
  end
endfunction

endmodule
//=============================================================================
// lscc_ram_dp.v
// Local Variables:
// verilog-library-directories: ("../../common")
// End:
//=============================================================================
`endif
