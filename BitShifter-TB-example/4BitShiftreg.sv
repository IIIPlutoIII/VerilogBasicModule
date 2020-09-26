`timescale 1ns / 1ps
/////////////////////////////////
module BitShiftreg(clk, reset, A, E);

       input clk, reset, A;
       output reg E;
       reg B, C, D;
       
       
//-------------------------------------//
//------non-blocking-------------------//
       always @(posedge clk , negedge reset)
          begin
              if (!reset)
               begin
               B <=0;
               C <=0;
               D <=0;
               E <=0;
               end
              else
               begin
               E <= D;
               D <= C;
               C <= B;
               B <= A;
               end
           end
endmodule
