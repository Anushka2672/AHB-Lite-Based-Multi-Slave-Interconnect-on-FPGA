`timescale 1ns / 1ps

module pwm_generator(
    input         clk,
    input         reset,
    input  [31:0] pwm_data,

    output reg    pwm_out  );

    reg [12:0] counter;
    reg [12:0] duty_cycle;

   always @(posedge clk or negedge reset)
     begin
       if(!reset)
          counter <= 13'd0;

       else if(counter == 13'd4999)
          counter <= 13'd0;

      else
        counter <= counter + 1'b1;
    end


   always @(*)
     begin
       case(pwm_data[1:0])

        2'b00: duty_cycle = 13'd1250;   // 25%
        2'b01: duty_cycle = 13'd2500;   // 50%
        2'b10: duty_cycle = 13'd3750;   // 75%
        2'b11: duty_cycle = 13'd5000;   //100%
        default: duty_cycle = 13'd1250;
     endcase
   end


    always @(posedge clk or negedge reset)
      begin
       if(!reset)
            pwm_out <= 1'b0;
       else if(counter < duty_cycle)
            pwm_out <= 1'b1;
        else
             pwm_out <= 1'b0;
       end
endmodule
