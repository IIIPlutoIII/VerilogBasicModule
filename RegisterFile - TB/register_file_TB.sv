`timescale 1ns / 1ps
//---------------------------------------------------// 
module Register_File_TB;
//---------------------------------------------------// 
    parameter Bit_Width = 16;
    parameter Number_Registers = 8;
    parameter Register_Select = 3;
//---------------------------------------------------//       
    reg  clk; // System clock
    reg  Write_Enable; // Write enable active 1
    reg  [Register_Select-1:0] Write_Destination; //write Address
    reg  [Register_Select-1:0] Source_A; // read address
    reg  [Register_Select-1:0] Source_B; // read address
    reg  [Bit_Width-1:0] Data_Destination;
    reg [Bit_Width-1:0] Data_A; //  data A
    reg [Bit_Width-1:0] Data_B; //  data B
//---------------------------------------------------//     
        reg [Bit_Width-1:0] RegFile [0:Number_Registers-1];
        assign    Data_A = RegFile [Source_A];
        assign    Data_B = RegFile [Source_B];
//---------------------------------------------------// 
                always @(posedge clk)
                  if (Write_Enable)begin
                  RegFile [Write_Destination] <= Data_Destination;
                  end
                  
     initial
       begin clk = 1'b0;
          #2 Write_Enable = 0;
          #5 Write_Enable = 1;
       end
      always #5
      clk = ~clk; 
      initial begin #2;
          repeat (2)
            begin #10 Write_Destination = 2'b01;
                  #10 Source_B = 2'b01;
                      Source_A = 2'b01; 

            end
          end 
           

      initial begin;
          repeat (2)
            begin #10 Data_Destination = 5'b10101;
                   

            end  
          #200 $finish;
      end
endmodule