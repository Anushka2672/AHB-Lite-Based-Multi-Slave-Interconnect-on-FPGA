`timescale 1ns / 1ps

module ahb_7seg_slave(

    input         HCLK,
    input         HRESETn,

   
    input         HSEL,
    input  [7:0]  HADDR,
    input  [31:0] HWDATA,
    input         HWRITE,
    input  [1:0]  HTRANS,
    input         HREADY,

    output reg [31:0] HRDATA,
    output reg        HREADYOUT,
    output reg        HRESP,

    output reg [31:0] display_data   );


    reg [3:0] display_reg;   //internal reg


     always @(posedge HCLK or negedge HRESETn)
      begin

          if(!HRESETn)
               begin
                  display_reg  <= 4'd0;
                   display_data <= 32'd0;
                   HRDATA       <= 32'd0;
                   HREADYOUT    <= 1'b1;
                    HRESP        <= 1'b0;
               end
    
       else
               begin
                  HREADYOUT <= 1'b1;
                    HRESP     <= 1'b0;

                  if(HSEL && HREADY && HTRANS[1])    //write
                      begin

                     if(HWRITE)
                         begin
                         if(HADDR == 8'h20)
                             begin
                                 display_reg  <= HWDATA[3:0];
                                 display_data <= {28'd0,HWDATA[3:0]};
                           end

                      end

                 else    //read
                    begin
                        if(HADDR == 8'h20)
                            HRDATA <= {28'd0,display_reg};
                       else
                            HRDATA <= 32'd0;
                   end
           end
     end
  end
endmodule
