//==========================================================================
// Module : tb_apb_mst
//==========================================================================
`timescale 1ns/1ps

`include "tb_defines.v"

module tb_apb_mst # (
  parameter CLKPERIOD = 20
) ( //--begin_ports--
  //----------------------------
  // Inputs
  //----------------------------
  input [31:0]       apb_prdata,
  input              apb_pready,
  input              apb_pslverr,
  input              int_i,
  //----------------------------
  // Outputs
  //----------------------------
  output reg         apb_pclk,
  output reg         apb_preset_n,
  output reg [31:0]  apb_paddr,
  output reg         apb_penable,
  output reg         apb_psel,
  output reg [31:0]  apb_pwdata,
  output reg         apb_pwrite,
  output reg         done_o
); //--end_ports--
`include "dut_params.v"
//--------------------------------------------------------------------------
//--- Combinational Wire/Reg ---
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
//--- Registers ---
//--------------------------------------------------------------------------
reg  [1:0] trans_idle_time;
reg        trans_type;
reg [31:0] addr;
reg [31:0] din;
reg [7:0] pscaler_ratio;
reg dir, cont, pscaler_dis;
//--------------------------------------------------------------------------
//--- Clock Generator ---
//--------------------------------------------------------------------------
always #(CLKPERIOD/2) apb_pclk = ~apb_pclk;

//--------------------------------------------------------------------------
// TESTCASES START HERE
//--------------------------------------------------------------------------
initial begin
  apb_pclk                     = 0;
  apb_paddr                    = 0;
  apb_penable                  = 0;
  apb_psel                     = 0;
  apb_pwdata                   = 0;
  apb_pwrite                   = 0;  
  apb_preset_n                 = 0;
  done_o                       = 0;
  #(10*CLKPERIOD) apb_preset_n = 1;
  
  repeat(5) @(posedge apb_pclk);
  
  //-------------------------------------------------------------------------
  `ifdef RESET_TEST
    //enable interrupt
    int_en('h0f);
    //clear interrupt
    int_stat('h0f);
    start('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
	start('h02, 1'b1, 1'b0, 1'b0, 8'b00000101);
	start('h03, 1'b1, 1'b0, 1'b0, 8'b00000100);
	start('h04, 1'b1, 1'b0, 1'b0, 8'b00000011);
	//repeat 50 clock cycles
    repeat(50) @(posedge apb_pclk);
    // Reset after APB transaction and before timeout
    apb_preset_n                 = 0;
    #(10*CLKPERIOD) apb_preset_n = 1;
    // Repeat APB transaction
    int_en('h0f);
    int_stat('h0f);
    start('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
	start('h02, 1'b1, 1'b0, 1'b0, 8'b00000101);
	start('h03, 1'b1, 1'b0, 1'b0, 8'b00000100);
	start('h04, 1'b1, 1'b0, 1'b0, 8'b00000011);
	// Wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    int_stat ('h01);   
    // Reset after timeout
    apb_preset_n                 = 0;
    #(10*CLKPERIOD) apb_preset_n = 1;   
    // Repeat APB transaction
    int_en('h0f);
    int_stat('h0f);
    start('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
	start('h02, 1'b1, 1'b0, 1'b0, 8'b00000101);
	start('h03, 1'b1, 1'b0, 1'b0, 8'b00000100);
	start('h04, 1'b1, 1'b0, 1'b0, 8'b00000011);
    
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    int_stat ('hF);	
  //-------------------------------------------------------------------------
  `elsif REGISTER_TEST
  
    if (NUM_OF_TIMERS == 1) begin
      int_en('h01);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	end
	else if (NUM_OF_TIMERS == 3) begin
	  int_en('b11);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      wr_control('h02);
      wr_period('h02);
	  
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	  rd_control('h02);   
      rd_period('h02);
	end
	else if (NUM_OF_TIMERS == 7) begin
	  int_en('b111);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      wr_control('h02);
      wr_period('h02);
	  wr_control('h03);
      wr_period('h03);
	  
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	  rd_control('h02);   
      rd_period('h02);
	  rd_control('h03);   
      rd_period('h03);
	end
	else if (NUM_OF_TIMERS == 15) begin
	  int_en('b1111);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      wr_control('h02);
      wr_period('h02);
	  wr_control('h03);
      wr_period('h03);
	  wr_control('h04);
      wr_period('h04);
	  
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	  rd_control('h02);   
      rd_period('h02);
	  rd_control('h03);   
      rd_period('h03);
	  rd_control('h04);   
      rd_period('h04);
	end
	else if (NUM_OF_TIMERS == 31) begin
	  int_en('b11111);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      wr_control('h02);
      wr_period('h02);
	  wr_control('h03);
      wr_period('h03);
	  wr_control('h04);
      wr_period('h04);
	  wr_control('h05);
      wr_period('h05);
	  
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	  rd_control('h02);   
      rd_period('h02);
	  rd_control('h03);   
      rd_period('h03);
	  rd_control('h04);   
      rd_period('h04);
	  rd_control('h05);   
      rd_period('h05);
	end
	else if (NUM_OF_TIMERS == 63) begin
	  int_en('b111111);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      wr_control('h02);
      wr_period('h02);
	  wr_control('h03);
      wr_period('h03);
	  wr_control('h04);
      wr_period('h04);
	  wr_control('h05);
      wr_period('h05);
	  wr_control('h06);
      wr_period('h06);
	  
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	  rd_control('h02);   
      rd_period('h02);
	  rd_control('h03);   
      rd_period('h03);
	  rd_control('h04);   
      rd_period('h04);
	  rd_control('h05);   
      rd_period('h05);
	  rd_control('h06);   
      rd_period('h06);
	end
	else if (NUM_OF_TIMERS == 127) begin
	  int_en('b1111111);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      wr_control('h02);
      wr_period('h02);
	  wr_control('h03);
      wr_period('h03);
	  wr_control('h04);
      wr_period('h04);
	  wr_control('h05);
      wr_period('h05);
	  wr_control('h06);
      wr_period('h06);
	  wr_control('h07);
      wr_period('h07);
	  
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	  rd_control('h02);   
      rd_period('h02);
	  rd_control('h03);   
      rd_period('h03);
	  rd_control('h04);   
      rd_period('h04);
	  rd_control('h05);   
      rd_period('h05);
	  rd_control('h06);   
      rd_period('h06);
	  rd_control('h07);   
      rd_period('h07);
	end
	else if (NUM_OF_TIMERS == 255) begin
	  int_en('b11111111);
	  wr_gbl_ctrl($random);
	  wr_control('h01);
      wr_period('h01);
      wr_control('h02);
      wr_period('h02);
	  wr_control('h03);
      wr_period('h03);
	  wr_control('h04);
      wr_period('h04);
	  wr_control('h05);
      wr_period('h05);
	  wr_control('h06);
      wr_period('h06);
	  wr_control('h07);
      wr_period('h07);
	  wr_control('h08);
      wr_period('h08);
	  
	  rd_int_en();   
	  rd_gbl_ctrl();
      rd_control('h01);   
      rd_period('h01);
	  rd_control('h02);   
      rd_period('h02);
	  rd_control('h03);   
      rd_period('h03);
	  rd_control('h04);   
      rd_period('h04);
	  rd_control('h05);   
      rd_period('h05);
	  rd_control('h06);   
      rd_period('h06);
	  rd_control('h07);   
      rd_period('h07);
	  rd_control('h08);   
      rd_period('h08);
	end
    //int_en('h0f);
    //rd_int_en();   
    //int_stat('h0f);
    //rd_int_stat();    
	//
	//wr_gbl_ctrl($random);
	//rd_gbl_ctrl();
	//
    //wr_control('h01);
    //rd_control('h01);   
    //wr_status('h01);
    //rd_status('h01);    
    //wr_period('h01);
    //rd_period('h01);   
    //wr_snap('h01);
    //rd_snap('h01);
	//
    //wr_control('h02);
    //rd_control('h02);   
    //wr_status('h02);
    //rd_status('h02);    
    //wr_period('h02);
    //rd_period('h02);   
    //wr_snap('h02);
    //rd_snap('h02);  
	//
    //wr_control('h03);
    //rd_control('h03);   
    //wr_status('h03);
    //rd_status('h03);    
    //wr_period('h03);
    //rd_period('h03);   
    //wr_snap('h03);
    //rd_snap('h03);  	
	//
	//wr_control('h04);
    //rd_control('h04);   
    //wr_status('h04);
    //rd_status('h04);    
    //wr_period('h04);
    //rd_period('h04);   
    //wr_snap('h04);
    //rd_snap('h04);  
	
  //-------------------------------------------------------------------------
 `elsif SWTRIG_EN_TEST_0
    //enable interrupt
    int_en('h0f);
    //clear interrupt
    int_stat('h0f);
	//start timer1 in continuous mode and count-down direction
    start('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
	start('h02, 1'b1, 1'b0, 1'b0, 8'b00000101);
	start('h03, 1'b1, 1'b0, 1'b0, 8'b00000010);
	start('h04, 1'b1, 1'b0, 1'b0, 8'b00000011);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	
    //stop timer1
    repeat(15) @(posedge apb_pclk);
    stop ('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
	
    //start timer1
    repeat(40) @(posedge apb_pclk);
    start ('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
    start('h02, 1'b1, 1'b0, 1'b0, 8'b00000101);
	start('h03, 1'b1, 1'b0, 1'b0, 8'b00000010);
	start('h04, 1'b1, 1'b0, 1'b0, 8'b00000011);
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat('h01);
	
	//reset timer
	apb_preset_n                 = 0;
    #(10*CLKPERIOD) apb_preset_n = 1;
	//enable interrupt
    int_en      ('h0f);
    //clear interrupt
    int_stat    ('h0f);
	
	//start timer1 in continuous mode and count-up direction
    start('h01, 1'b1, 1'b1, 1'b0, 8'b00000111);
    start('h02, 1'b1, 1'b0, 1'b0, 8'b00000101);
	start('h03, 1'b1, 1'b0, 1'b0, 8'b00000010);
	start('h04, 1'b1, 1'b0, 1'b0, 8'b00000011);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	
    //stop timer1
    repeat(40) @(posedge apb_pclk);
    stop('h01, 1'b1, 1'b1, 1'b0, 8'b00000111);
	
    //start timer1
    repeat(40) @(posedge apb_pclk);
    start('h01, 1'b1, 1'b1, 1'b0, 8'b00000111);
	start('h02, 1'b1, 1'b0, 1'b0, 8'b00000101);
	start('h03, 1'b1, 1'b0, 1'b0, 8'b00000010);
	start('h04, 1'b1, 1'b0, 1'b0, 8'b00000011);
    
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	
  //-------------------------------------------------------------------------
  `elsif SWTRIG_EN_TEST_1
    //enable interrupt
    int_en      ('h0f);
    //clear interrupt
    int_stat    ('h0f);
	//start timer1 in single-shot mode and count-down direction
    start       ('h01, 1'b0, 1'b0, 1'b0, 8'b00000111);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	
    //start timer1
    repeat(40) @(posedge apb_pclk);
    start ('h01, 1'b0, 1'b0, 1'b0, 8'b00000111);
	
	//stop timer1
    repeat(100) @(posedge apb_pclk);
    stop ('h01, 1'b0, 1'b0, 1'b0, 8'b00000111);
	   
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	
	//reset timer
	apb_preset_n                 = 0;
    #(10*CLKPERIOD) apb_preset_n = 1;
	//enable interrupt
    int_en      ('h0f);
    //clear interrupt
    int_stat    ('h0f);
	
	//start timer1 in single-shot mode and count-up direction
    start       ('h01, 1'b0, 1'b1, 1'b0, 8'b00000111);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	
	//start timer1
    repeat(40) @(posedge apb_pclk);
    start ('h01, 1'b0, 1'b1, 1'b0, 8'b00000111);
	
    //stop timer1
    repeat(40) @(posedge apb_pclk);
    stop ('h01, 1'b0, 1'b1, 1'b0, 8'b00000111);
	
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	
  //-------------------------------------------------------------------------
  `elsif SWTRIG_EN_TEST_2
    //enable interrupt
    int_en      ('h0f);
    //clear interrupt
    int_stat    ('h0f);
	//start timer1 in continuous mode and count-down direction
    start       ('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
    //update PERIOD
    repeat(20) @(posedge apb_pclk);
    upd_period('h01, 'd020);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h01);
	//reset timer
	apb_preset_n                 = 0;
    #(10*CLKPERIOD) apb_preset_n = 1;
	//enable interrupt
    int_en      ('h0f);
    //clear interrupt
    int_stat    ('h0f);
	//start timer1 in continuous mode and count-up direction
    start       ('h01, 1'b1, 1'b1, 1'b0, 8'b00000111);
	//update PERIOD
    repeat(20) @(posedge apb_pclk);
    upd_period('h01, 'd030);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h01);
	//reset timer
	apb_preset_n                 = 0;
    #(10*CLKPERIOD) apb_preset_n = 1;
	//enable interrupt
    int_en      ('h0f);
    //clear interrupt
    int_stat    ('h0f);
	//start timer1 in single-shot mode and count-down direction
    start       ('h01, 1'b0, 1'b0, 1'b0, 8'b00000111);
	//update PERIOD
    repeat(20) @(posedge apb_pclk);
    upd_period('h01, 'd040);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h01);
	
	//reset timer
	apb_preset_n                 = 0;
    #(10*CLKPERIOD) apb_preset_n = 1;
	//enable interrupt
    int_en      ('h0f);
    //clear interrupt
    int_stat    ('h0f);
	//start timer1 in single-shot mode and count-up direction
    start       ('h01, 1'b0, 1'b1, 1'b0, 8'b00000111);
    //update PERIOD
	repeat(20) @(posedge apb_pclk);
    upd_period('h01, 'd050);
    
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    
    int_stat('h01);
  //-------------------------------------------------------------------------
  `elsif SWTRIG_DIS_TEST_0
    //enable interrupt
    int_en('h0f);
    //clear interrupt
    int_stat('h0f);
	//stop timer1
    repeat(100) @(posedge apb_pclk);
    stop('h01, 1'b0, 1'b0, 1'b0, 8'b00000111);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	//update PERIOD
	repeat(600) @(posedge apb_pclk);
	upd_period('h01, 'h060);
    //wait for interrupt
	while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	//start timer1 in single-shot mode and count-up direction
    start('h01, 1'b0, 1'b1, 1'b0, 8'b00000111);
	//stop timer1
    repeat(20) @(posedge apb_pclk);
    stop('h01, 1'b0, 1'b1, 1'b0, 8'b00000111);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
	//update PERIOD
	repeat(600) @(posedge apb_pclk);
	upd_period('h01, 'h060);
    //wait for interrupt
	while (!int_i) begin
      @(posedge apb_pclk);
    end
	//clear interrupt
	int_stat ('h01);
  int_stat('h01);	
  //-------------------------------------------------------------------------
  `elsif MULT_TEST_0
    //enable interrupt
    int_en('h0f);
    //clear interrupt
    int_stat('h0f);
	//start timer1 in continuous mode and count-down direction
    start('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
	//start timer2 in continuous mode and count-down direction
	start('h02, 1'b1, 1'b0, 1'b0, 8'b00000110);
    //update PERIOD
    repeat(500) @(posedge apb_pclk);
    upd_period('h01, 'd08);
	//update PERIOD
    repeat(50) @(posedge apb_pclk);
    upd_period('h02, 'd20);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
	
	repeat(500) @(posedge apb_pclk);
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
	
  //-------------------------------------------------------------------------
  `elsif PRESCALER_SEL_TEST
    //enable interrupt
    int_en('h0f);
    //clear interrupt
    int_stat('h0f);
	//start timer1 in continuous mode and count-down direction
    start('h01, 1'b1, 1'b0, 1'b0, 8'b00000111);
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
	//update prescaler_ratio
	start('h01, 1'b1, 1'b0, 1'b0, 8'b00000000);
    //wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
	//update prescaler_ratio
	start('h01, 1'b1, 1'b0, 1'b0, 8'b00000110);
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
	//update prescaler_ratio
	start('h01, 1'b1, 1'b0, 1'b0, 8'b00000001);
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
	//update prescaler_ratio
	start('h01, 1'b1, 1'b0, 1'b0, 8'b00000101);
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
	//update prescaler_ratio
	start('h01, 1'b1, 1'b0, 1'b1, 8'b00000101);
	//wait for interrupt
    while (!int_i) begin
      @(posedge apb_pclk);
    end
    //clear interrupt
    int_stat('h0f);
  `endif
  
  repeat(10) @(posedge apb_pclk);
  
  done_o = 1'b1;
  //$finish;
end
//--------------------------------------------------------------------------
// END OF TESTCASES
//--------------------------------------------------------------------------


// ----------------------------------------------------------------------------- 
// LIST OF TASKS
// ----------------------------------------------------------------------------- 

// ----------------------------------------------------------------------------- 
// APB Write task
task m_write
(
  input  [31:0] addr,
  input  [31:0] data
);
  reg           done;
  begin
    apb_psel    <= 1'b1;
    apb_pwrite  <= 1'b1;
    apb_pwdata  <= data;
    apb_paddr   <= addr;
    @(posedge apb_pclk);
      apb_penable <= 1'b1;

    done = 0;
    while(!done) begin
      @(posedge apb_pclk);
        done = apb_pready;
    end
    apb_psel    <= 1'b0;
    apb_penable <= 1'b0;
    apb_pwrite  <= 1'b0;
	`N_MSG(("APB WRITE                             "))
	`N_MSG(("+------Address = %h, Data = %h --", apb_paddr, apb_pwdata))
	
  end
endtask // m_write
// ----------------------------------------------------------------------------- 
// APB Read task
task m_read
(
  input  [31:0] addr,
  output [31:0] data
);
  reg           done;
  begin
    apb_psel    <= 1'b1;
    apb_pwrite  <= 1'b0;
    apb_paddr   <= addr;
    @(posedge apb_pclk);
      apb_penable <= 1'b1;

    done = 0;
    data = {32{1'bx}};
    while(!done) begin
      @(posedge apb_pclk);
        done = apb_pready;
    end
    data = apb_prdata;
    apb_psel    <= 1'b0;
    apb_penable <= 1'b0;
  end
endtask // m_read
// ----------------------------------------------------------------------------- 
// Write to INT_ENABLE register
task int_en (
  input [31:0] data
);
  begin
    addr = 'h04;
    m_write(addr, data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Read to INT_ENABLE register
task rd_int_en ( );
  reg [31:0] data;
  begin
    addr = 'h04;
    m_read(addr, data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Write to INT_STATUS register
task int_stat (
  input [31:0] data
);
  begin
    addr = 'h00;
    m_write(addr, data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Read to INT_STATUS register
task rd_int_stat ( );
  reg [31:0] data;
  begin
    addr = 'h00;
    m_read(addr, data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Write to STATUS register
task wr_status (
  input [7:0] tmr_num
);
  reg [31:0] data;
  begin
    if (tmr_num==1) begin
      addr = 'h10;
	end
    else if (tmr_num==2) begin
      addr = 'h20;
    end
    else if (tmr_num==3) begin
      addr = 'h30;
    end
	else if (tmr_num==4) begin
      addr = 'h40;
    end
	else if (tmr_num==5) begin
      addr = 'h50;
    end
	else if (tmr_num==6) begin
      addr = 'h60;
    end
	else if (tmr_num==7) begin
      addr = 'h70;
    end
    else begin
      addr = 'h80;
    end
    data = $random;
    m_write(addr,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Read to STATUS register
task rd_status (
  input [7:0] tmr_num
);
  reg [31:0] data;
  begin
    if (tmr_num==1) begin
      addr = 'h10;
    end
    else if (tmr_num==2) begin
      addr = 'h20;
    end
    else if (tmr_num==3) begin
      addr = 'h30;
    end
	else if (tmr_num==4) begin
      addr = 'h40;
    end
	else if (tmr_num==5) begin
      addr = 'h50;
    end
	else if (tmr_num==6) begin
      addr = 'h60;
    end
	else if (tmr_num==7) begin
      addr = 'h70;
    end
    else begin
      addr = 'h80;
    end

    m_read(addr,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Write to START field in CONTROL register
task start (
  input [7:0] tmr_num,
  input cont,
  input dir,
  input pscaler_dis,
  input [7:0] pscaler_ratio
);
  begin //START
    if (tmr_num==1) begin
      addr = 'h14;
    end
    else if (tmr_num==2) begin
      addr = 'h24;
    end
    else if (tmr_num==3) begin
      addr = 'h34;
    end
	else if (tmr_num==4) begin
      addr = 'h44;
    end
	else if (tmr_num==5) begin
      addr = 'h54;
    end
	else if (tmr_num==6) begin
      addr = 'h64;
    end
	else if (tmr_num==7) begin
      addr = 'h74;
    end
    else begin
      addr = 'h84;
    end
	
    din = {16'h0, pscaler_ratio, 3'b000, pscaler_dis, 1'b0, 1'b1, dir, cont}; //enable start and cont mode
    m_write(addr, din);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Write to STOP/CONT field in CONTROL register
task stop (
  input [7:0] tmr_num,
  input cont,
  input dir,
  input pscaler_dis,
  input [7:0] pscaler_ratio
);
  begin //START
    if (tmr_num==1) begin
      addr = 'h14;
    end
    else if (tmr_num==2) begin
      addr = 'h24;
    end
    else if (tmr_num==3) begin
      addr = 'h34;
    end
    else begin
      addr = 'h44;
    end	
    din = {16'h0, pscaler_ratio, 3'b000, pscaler_dis, 1'b1, 1'b0, dir, cont}; //enable stop and cont mode
    m_write(addr, din);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask

// ----------------------------------------------------------------------------- 
// Write to CONTROL register
task wr_control (
  input [7:0] tmr_num
);
  reg [31:0] data1; //8-bit
  reg [31:0] data2; //5-bit
  begin
    if (tmr_num==1) begin
      addr = 'h14;
    end
    else if (tmr_num==2) begin
      addr = 'h24;
    end
    else if (tmr_num==3) begin
      addr = 'h34;
    end
	else if (tmr_num==4) begin
      addr = 'h44;
    end
	else if (tmr_num==5) begin
      addr = 'h54;
    end
	else if (tmr_num==6) begin
      addr = 'h64;
    end
	else if (tmr_num==7) begin
      addr = 'h74;
    end
    else begin
      addr = 'h84;
    end

    data1 = $random ;//% 5;
	data2 = $unsigned($random) % 2;
    m_write(addr,{16'h0,data1[15:8],3'b000,data2[4:0]});
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Read to CONTROL register
task rd_control (
  input [7:0] tmr_num
);
  reg [31:0] data;
  begin
    if (tmr_num==1) begin
      addr = 'h14;
    end
    else if (tmr_num==2) begin
      addr = 'h24;
    end
    else if (tmr_num==3) begin
      addr = 'h34;
    end
	else if (tmr_num==4) begin
      addr = 'h44;
    end
	else if (tmr_num==5) begin
      addr = 'h54;
    end
	else if (tmr_num==6) begin
      addr = 'h64;
    end
	else if (tmr_num==7) begin
      addr = 'h74;
    end
    else begin
      addr = 'h84;
    end
    m_read(addr,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask

// ----------------------------------------------------------------------------- 
// Write to PERIOD register
task upd_period (
  input [7:0] tmr_num,
  input [31:0] data
);
  begin //START
    if (tmr_num==1) begin
      addr = 'h18;
    end
    else if (tmr_num==2) begin
      addr = 'h28;
    end
    else if (tmr_num==3) begin
      addr = 'h38;
    end
	else if (tmr_num==4) begin
      addr = 'h48;
    end
	else if (tmr_num==5) begin
      addr = 'h58;
    end
	else if (tmr_num==6) begin
      addr = 'h68;
    end
	else if (tmr_num==7) begin
      addr = 'h78;
    end
    else begin
      addr = 'h88;
    end
    m_write(addr, data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Write to PERIOD register
task wr_period (
  input [7:0] tmr_num
);
  reg [31:0] data;
  begin
    if (tmr_num==1) begin
      addr = 'h18;
    end
    else if (tmr_num==2) begin
      addr = 'h28;
    end
    else if (tmr_num==3) begin
      addr = 'h38;
    end
	else if (tmr_num==4) begin
      addr = 'h48;
    end
	else if (tmr_num==5) begin
      addr = 'h58;
    end
	else if (tmr_num==6) begin
      addr = 'h68;
    end
	else if (tmr_num==7) begin
      addr = 'h78;
    end
    else begin
      addr = 'h88;
    end
    data = $random;
    m_write(addr,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Read to PERIOD register
task rd_period (
  input [7:0] tmr_num
);
  reg [31:0] data;
  begin
    if (tmr_num==1) begin
      addr = 'h18;
    end
    else if (tmr_num==2) begin
      addr = 'h28;
    end
    else if (tmr_num==3) begin
      addr = 'h38;
    end
	else if (tmr_num==4) begin
      addr = 'h48;
    end
	else if (tmr_num==5) begin
      addr = 'h58;
    end
	else if (tmr_num==6) begin
      addr = 'h68;
    end
	else if (tmr_num==7) begin
      addr = 'h78;
    end
    else begin
      addr = 'h88;
    end 
    m_read(addr,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Write to SNAP register
task wr_snap (
  input [7:0] tmr_num
);
  reg [31:0] data;
  begin
    if (tmr_num==1) begin
      addr = 'h1c;
    end
    else if (tmr_num==2) begin
      addr = 'h2c;
    end
    else if (tmr_num==3) begin
      addr = 'h3c;
    end
	else if (tmr_num==4) begin
      addr = 'h4c;
    end
	else if (tmr_num==5) begin
      addr = 'h5c;
    end
	else if (tmr_num==6) begin
      addr = 'h6c;
    end
	else if (tmr_num==7) begin
      addr = 'h7c;
    end
    else begin
      addr = 'h8c;
    end
    data = $random;
    m_write(addr,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask  
// ----------------------------------------------------------------------------- 
// Read to SNAP register
task rd_snap (
  input [7:0] tmr_num
);
  reg [31:0] data;
  begin
    if (tmr_num==1) begin
      addr = 'h1c;
    end
    else if (tmr_num==2) begin
      addr = 'h2c;
    end
    else if (tmr_num==3) begin
      addr = 'h3c;
    end
	else if (tmr_num==4) begin
      addr = 'h4c;
    end
	else if (tmr_num==5) begin
      addr = 'h5c;
    end
	else if (tmr_num==6) begin
      addr = 'h6c;
    end
	else if (tmr_num==7) begin
      addr = 'h7c;
    end
    else begin
      addr = 'h8c;
    end  
    m_read(addr,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Write to GBL_CTRL register
task wr_gbl_ctrl (
  input [7:0] data
);
  begin
    m_write('h0c,{24'h0,data});
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask
// ----------------------------------------------------------------------------- 
// Read to GBL_CTRL register
task rd_gbl_ctrl ();
  reg [31:0] data;
  begin
    data = $random;
    m_read('h0c,data);
    trans_idle_time = $random;
    repeat(trans_idle_time) @(posedge apb_pclk);
  end
endtask

endmodule //--tb_apb_mst--
