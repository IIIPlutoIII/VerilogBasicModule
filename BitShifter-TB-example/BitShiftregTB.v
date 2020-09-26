module bitshiftregTB;

     reg clk, reset, inbit;
     wire outbit;
     integer i;
     
     BitShiftreg SHREG (clk, reset, inbit, outbit);
     
     initial
       begin clk = 1'b0;
          #2 reset = 0;
          #5 reset = 1;
       end
      always #5
      clk = ~clk; 
      initial begin #2;
          repeat (2)
            begin #10 inbit = 0;
                  #10 inbit = 0;
                  #10 inbit = 1;
                  #10 inbit = 1;
            end 
          #200 $finish;
      end
endmodule
            