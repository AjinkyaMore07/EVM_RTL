`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 08:46:20 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(in,clk,reset,reg_enable);
input in,clk,reset;
output reg reg_enable;
reg temp;

always @(posedge clk,posedge reset)
 begin
    if(reset)
      begin
        reg_enable<=0;
        temp<=0;
      end
    else
       begin
        temp<=in;
        reg_enable <=( ~temp & in); 
       end
 end
endmodule
