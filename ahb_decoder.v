`timescale 1ns / 1ps

module ahb_decoder(

    input  [7:0] addr,
 
     output reg hsel0,
    output reg hsel1

);

   always @(*)
      begin

        hsel0 = 1'b0;
        hsel1 = 1'b0;

      case(addr)
        // Addr : 0x20=7-Segment Slave
        8'h20:
        begin
            hsel0 = 1'b1;
            hsel1 = 1'b0;
        end
    
        // Addr: 0x30=PWM Slave
        8'h30:
        begin
            hsel0 = 1'b0;
            hsel1 = 1'b1;
        end


         default:
           begin
             hsel0 = 1'b0;
              hsel1 = 1'b0;
         end

       endcase

   end
endmodule


