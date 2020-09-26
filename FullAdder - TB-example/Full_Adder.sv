`timescale 1ns / 1ps
//----------------------------------------//
module Full_Adder(s, co, a, b, c);

       input a,b,c;   //  a,b input and carry in
       output s,co;   //  sum, carry out outputs
       
       assign s = a ^ b ^ c;
       assign co = (a & b) | (b & c) | (c & a);
endmodule
//-----------------------------------------//
//---Full Adder, behavioral description----//