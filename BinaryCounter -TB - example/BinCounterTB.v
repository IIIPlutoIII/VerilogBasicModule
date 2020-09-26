module counterTB;
      reg reset, clk;
      wire [7:0] out;
      
      BINcounter BC (reset, clk, out);
      
      initial clk = 1'b0;
      always #5 clk = ~clk;
      initial
        begin
          reset = 1'b1;
          #15 reset = 1'b0;
          #1000 reset = 1'b1;
          #10 $finish;
          $monitor ($time,"count: %h", reset, clk, out);
       end
endmodule       