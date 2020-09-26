`timescale 1ns / 1ps
//---------------------------------------------------// 
module Register_File(clk, Write_Enable, Data_Destination, Write_Destination, Source_A, Source_B,
                        Data_A, Data_B);
//---------------------------------------------------// 
    parameter Bit_Width = 16;
    parameter Number_Registers = 8;
    parameter Register_Select = 3;
//---------------------------------------------------//       
    input  clk; // System clock
    input  Write_Enable; // Write enable active 1
    input  [Register_Select-1:0] Write_Destination; //write Address
    input  [Register_Select-1:0] Source_A; // read address
    input  [Register_Select-1:0] Source_B; // read address
    input  [Bit_Width-1:0] Data_Destination;
    output reg [Bit_Width-1:0] Data_A; //  data A
    output reg [Bit_Width-1:0] Data_B; //  data B
//---------------------------------------------------//     
        reg [Bit_Width-1:0] RegFile [0:Number_Registers-1];
        assign    Data_A = RegFile [Source_A];
        assign    Data_B = RegFile [Source_B];
//---------------------------------------------------// 
                always @(posedge clk)
                  if (Write_Enable)begin
                  RegFile [Write_Destination] <= Data_Destination;
                  end
endmodule