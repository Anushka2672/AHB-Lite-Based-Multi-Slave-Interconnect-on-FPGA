`timescale 1ns / 1ps

module ahb_pwm_slave(

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

    output reg [31:0] pwm_data  );


    reg [31:0] pwm_reg;


// Slave Logic
    always @(posedge HCLK or negedge HRESETn)
     begin
        if(!HRESETn)
         begin
            pwm_reg   <= 32'd0;
            pwm_data  <= 32'd0;
            HRDATA    <= 32'd0;
            HREADYOUT <= 1'b1;
            HRESP     <= 1'b0;
        end

    else
       begin
        HREADYOUT <= 1'b1;
        HRESP     <= 1'b0;

        if(HSEL && HREADY && HTRANS[1])
           begin

            if(HWRITE)    //write
            begin
                case(HADDR)
                    8'h30:
                      begin
                        pwm_reg  <= HWDATA;
                        pwm_data <= HWDATA;
                      end

                    default:
                      begin
                        pwm_reg  <= pwm_reg;
                        pwm_data <= pwm_reg;
                      end
                 endcase
              end

            else      //read
            begin
                case(HADDR)
                    8'h30:
                      HRDATA <= pwm_reg;
                   
                  default:
                      HRDATA <= 32'd0;

                 endcase
               end
           end
      end
    end
endmodule
