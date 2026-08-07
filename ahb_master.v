`timescale 1ns / 1ps

module ahb_master(

    input         hclk,
    input         hreset,

     input         enable,
    input         write,
    input  [7:0]  addr,
     input  [3:0]  data,

    input         hreadyout,
    input         hresp,
    input  [31:0] hrdata,

     output reg [7:0]  haddr,
    output reg        hwrite,
    output reg [2:0]  hsize,
    output reg [2:0]  hburst,
    output reg [3:0]  hprot,
     output reg [1:0]  htrans,
    output reg        hready,
    output reg [31:0] hwrite_data,

    output reg [31:0] data_out

);


   reg [1:0] present_state;
   reg [1:0] next_state;

   parameter IDLE  = 2'b00;
   parameter ADDR  = 2'b01;
   parameter WRITE = 2'b10;
   parameter READ  = 2'b11;

//ps
    always @(posedge hclk)
      begin
        if(!hreset)
          present_state <= IDLE;
       else
         present_state <= next_state;
     end

//ns
     always @(*)
       begin

       case(present_state)

      IDLE:
           next_state = (enable) ? ADDR : IDLE;

       ADDR:
          next_state = (write) ? WRITE : READ;
  
      WRITE:
          next_state = (enable) ? ADDR : IDLE;

      READ:
          next_state = (enable) ? ADDR : IDLE;

      default:
        next_state = IDLE;

     endcase

  end

//o/p logic
   always @(*)
       begin

      haddr       = 8'h00;
      hwrite      = 1'b0;
      hsize       = 3'b010;      
      hburst      = 3'b000;      
     hprot       = 4'b0000;
      htrans      = 2'b00;
     hready      = 1'b0;
      hwrite_data = 32'd0;

     case(present_state)

     IDLE:
        htrans = 2'b00;


    ADDR:
       begin
          haddr       = addr;
         hwrite      = write;
         htrans      = 2'b10;          
          hready      = 1'b1;
         hwrite_data = {28'd0,data};
      end


    WRITE:
       begin
          haddr       = addr;
          hwrite      = 1'b1;
        htrans      = 2'b11;          
         hready      = 1'b1;
          hwrite_data = {28'd0,data};
     end


    READ:
       begin
          haddr       = addr;
         hwrite      = 1'b0;
          htrans      = 2'b11;          
         hready      = 1'b1;
    end

    endcase

  end

//read data
   always @(posedge hclk)
      begin

       if(!hreset)
         data_out <= 32'd0;

      else if((present_state==READ) && hreadyout)
         data_out <= hrdata;

  end

endmodule
