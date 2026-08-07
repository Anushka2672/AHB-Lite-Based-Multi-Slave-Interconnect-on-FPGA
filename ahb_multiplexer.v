`timescale 1ns / 1ps

module ahb_multiplexer(
    input         hsel0,
    input         hsel1,

    input  [31:0] hrdata1,
    input         hreadyout1,
    input         hresp1,

    input  [31:0] hrdata2,
    input         hreadyout2,
    input         hresp2,

    output reg [31:0] hrdata,
    output reg        hreadyout,
    output reg        hresp   );


   always @(*)
      begin
 
        hrdata    = 32'd0;
        hreadyout = 1'b1;
         hresp     = 1'b0;

       if(hsel0)
            begin
                hrdata    = hrdata1;
               hreadyout = hreadyout1;
                hresp     = hresp1;
         end

      else if(hsel1)
           begin
             hrdata    = hrdata2;
              hreadyout = hreadyout2;
             hresp     = hresp2;
          end
   end
endmodule


