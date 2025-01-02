`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 08:46:20 PM
// Design Name: 
// Module Name: mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux(A,B,C,D,S,Y);
input [3:0]A,B,C,D;
input [1:0]S;
output reg [3:0]Y;

always @(*)
 begin
    case(S)
    2'b00 : Y=A;
    2'b01 : Y=B;
    2'b10 : Y=C;
    2'b11 : Y=D;
    default : Y='bx; 
    endcase
 end
endmodule
