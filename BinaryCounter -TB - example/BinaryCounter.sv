module BINcounter (reset, clk, count);

       parameter N = 8;
       input reset, clk;
       output [0:N-1] count;
       
       reg [0:N-1] count; 
       
       always @(negedge clk)
              if (reset)
                 count <=0;
              else
                  count <= count +1 ;
endmodule