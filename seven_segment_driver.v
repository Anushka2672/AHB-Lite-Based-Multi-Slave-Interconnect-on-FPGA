`timescale 1ns / 1ps

module seven_segment_driver(

    input         clk,
    input         reset,
    input  [31:0] display_data,

    output [6:0]  seg,
    output        dp,
    output reg [7:0] an  );


    wire [3:0] digit;
    assign digit = display_data[3:0];


     always @(*)
        begin
            an = 8'b11111110;
        end

         assign dp = 1'b1;

         seven_segment_decoder DECODER(.digit(digit), .seg(seg));
endmodule
