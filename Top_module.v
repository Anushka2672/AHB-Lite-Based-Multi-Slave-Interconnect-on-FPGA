`timescale 1ns / 1ps

module top_module(
    input         hclk,
    input         hreset,
    input         enable,
    input         write,
    input  [7:0]  addr,
    input  [3:0]  data,

     output [6:0]  seg,
     output [7:0]  an,
     output        dp,
    output  pwm_out  );


   wire [7:0]  haddr;
   wire [31:0] hwrite_data;
   wire        hwrite;
   wire [2:0]  hsize;
    wire [2:0]  hburst;
   wire [3:0]  hprot;
    wire [1:0]  htrans;
   wire        hready;

   wire [31:0] data_out;


    wire hsel0;
    wire hsel1;


    wire [31:0] hrdata1;
    wire        hreadyout1;
     wire        hresp1;

     wire [31:0] display_data;

    wire [31:0] hrdata2;
    wire        hreadyout2;
     wire        hresp2;

     wire [31:0] pwm_data;

     wire [31:0] hrdata;
     wire        hreadyout;
     wire        hresp;



ahb_master MASTER(

    .hclk(hclk),
    .hreset(hreset),

    .enable(enable),
    .write(write),
    .addr(addr),
    .data(data),

    .hreadyout(hreadyout),
    .hresp(hresp),
    .hrdata(hrdata),

    .haddr(haddr),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hprot(hprot),
    .htrans(htrans),
    .hready(hready),
    .hwrite_data(hwrite_data),

    .data_out(data_out)

);


ahb_decoder DECODER(

    .addr(haddr),

    .hsel0(hsel0),
    .hsel1(hsel1)

);



ahb_7seg_slave SEG_SLAVE(

    .HCLK(hclk),
    .HRESETn(hreset),

    .HSEL(hsel0),

    .HADDR(haddr),
    .HWDATA(hwrite_data),
    .HWRITE(hwrite),
    .HTRANS(htrans),
    .HREADY(hready),

    .HRDATA(hrdata1),
    .HREADYOUT(hreadyout1),
    .HRESP(hresp1),

    .display_data(display_data)

);



ahb_multiplexer MUX(

    .hsel0(hsel0),
    .hsel1(hsel1),

    .hrdata1(hrdata1),
    .hreadyout1(hreadyout1),
    .hresp1(hresp1),

    // PWM Slave 
    .hrdata2(hrdata2),
    .hreadyout2(hreadyout2),
     .hresp2(hresp2),

    .hrdata(hrdata),
    .hreadyout(hreadyout),
    .hresp(hresp)

);



seven_segment_driver DRIVER(

    .clk(hclk),
    .reset(hreset),

     .display_data(display_data),
    .seg(seg),
    .an(an),
    .dp(dp)

);



ahb_pwm_slave PWM_SLAVE(

    .HCLK(hclk),
    .HRESETn(hreset),

    .HSEL(hsel1),

    .HADDR(haddr),
    .HWDATA(hwrite_data),
    .HWRITE(hwrite),
    .HTRANS(htrans),
    .HREADY(hready),

    .HRDATA(hrdata2),
    .HREADYOUT(hreadyout2),
    .HRESP(hresp2),

    .pwm_data(pwm_data)

);

pwm_generator PWM_GEN(

    .clk(hclk),
    .reset(hreset),

    .pwm_data(pwm_data),

    .pwm_out(pwm_out)

);
endmodule



