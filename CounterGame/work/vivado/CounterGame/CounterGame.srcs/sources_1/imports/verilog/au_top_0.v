/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    input main_button,
    input reset_button,
    output reg outled,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_1 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [1-1:0] M_gameMachine_decimal_counter_increase;
  wire [1-1:0] M_gameMachine_decimal_counter_rst;
  wire [1-1:0] M_gameMachine_led_data;
  reg [1-1:0] M_gameMachine_main_button;
  reg [1-1:0] M_gameMachine_reset_button;
  game_miniBeta_2 gameMachine (
    .clk(clk),
    .rst(rst),
    .main_button(M_gameMachine_main_button),
    .reset_button(M_gameMachine_reset_button),
    .decimal_counter_increase(M_gameMachine_decimal_counter_increase),
    .decimal_counter_rst(M_gameMachine_decimal_counter_rst),
    .led_data(M_gameMachine_led_data)
  );
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_3 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_main_edge_out;
  reg [1-1:0] M_main_edge_in;
  edge_detector_4 main_edge (
    .clk(clk),
    .in(M_main_edge_in),
    .out(M_main_edge_out)
  );
  wire [1-1:0] M_reset_edge_out;
  reg [1-1:0] M_reset_edge_in;
  edge_detector_4 reset_edge (
    .clk(clk),
    .in(M_reset_edge_in),
    .out(M_reset_edge_out)
  );
  wire [1-1:0] M_main_btn_cond_out;
  reg [1-1:0] M_main_btn_cond_in;
  button_conditioner_5 main_btn_cond (
    .clk(clk),
    .in(M_main_btn_cond_in),
    .out(M_main_btn_cond_out)
  );
  wire [1-1:0] M_reset_btn_cond_out;
  reg [1-1:0] M_reset_btn_cond_in;
  button_conditioner_5 reset_btn_cond (
    .clk(clk),
    .in(M_reset_btn_cond_in),
    .out(M_reset_btn_cond_out)
  );
  wire [16-1:0] M_dec_ctr_digits;
  reg [1-1:0] M_dec_ctr_rst;
  reg [1-1:0] M_dec_ctr_inc;
  multi_dec_ctr_6 dec_ctr (
    .clk(clk),
    .rst(M_dec_ctr_rst),
    .inc(M_dec_ctr_inc),
    .digits(M_dec_ctr_digits)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_main_btn_cond_in = main_button;
    M_reset_btn_cond_in = reset_button;
    M_main_edge_in = M_main_btn_cond_out;
    M_reset_edge_in = M_reset_btn_cond_out;
    M_gameMachine_main_button = M_main_edge_out;
    M_gameMachine_reset_button = M_reset_edge_out;
    M_dec_ctr_inc = M_gameMachine_decimal_counter_increase;
    M_dec_ctr_rst = M_gameMachine_decimal_counter_rst;
    M_seg_values = M_dec_ctr_digits;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    outled = M_gameMachine_led_data;
  end
endmodule
