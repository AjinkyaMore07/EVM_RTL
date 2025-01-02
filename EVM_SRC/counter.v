`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 08:46:20 PM
// Design Name: 
// Module Name: counter
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


module counter(enable,clk,reset,q);
input clk,reset,enable;
output reg [3:0]q;

always @(posedge clk,posedge reset)
 begin
    if(reset)
        q<=0;
    else if(enable)
        q<=q+1;
    else
        q<=q;
 end
endmodule
