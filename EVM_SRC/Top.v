`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 08:59:50 PM
// Design Name: 
// Module Name: Top
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


module Top(a,b,c,d,clk,master_enable,reset,s,mux_out);
input a,b,c,d,clk,reset,master_enable;
input [1:0]s;
output [3:0]mux_out;

reg master_enable_out;
wire [3:0]mux_A,mux_B,mux_C,mux_D,master_enable_count;
wire clr;
wire edge_detector_enable_A,
     edge_detector_enable_B,
     edge_detector_enable_C,
     edge_detector_enable_D;

wire reg_enable_A_counter,
     reg_enable_B_counter,
     reg_enable_C_counter,
     reg_enable_D_counter;
     
assign edge_detector_enable_A = a&master_enable_out;
assign edge_detector_enable_B = b&master_enable_out;
assign edge_detector_enable_C = c&master_enable_out;
assign edge_detector_enable_D = d&master_enable_out;

assign clr = (edge_detector_enable_A | edge_detector_enable_B | edge_detector_enable_C | edge_detector_enable_D);
   
always @(posedge clk, posedge reset)
    begin
        if(reset)
             master_enable_out <=0;
        else if(clr)
             master_enable_out <=0;
        else
            master_enable_out <= (master_enable | master_enable_out);           
    end    
    

edge_detector A(.in(edge_detector_enable_A),.clk(clk),.reset(reset),.reg_enable(reg_enable_A_counter));  
edge_detector B(.in(edge_detector_enable_B),.clk(clk),.reset(reset),.reg_enable(reg_enable_B_counter));  
edge_detector C(.in(edge_detector_enable_C),.clk(clk),.reset(reset),.reg_enable(reg_enable_C_counter));  
edge_detector D(.in(edge_detector_enable_D),.clk(clk),.reset(reset),.reg_enable(reg_enable_D_counter));  


counter counter_A(.enable(reg_enable_A_counter),.clk(clk),.reset(reset),.q(mux_A));
counter counter_B(.enable(reg_enable_B_counter),.clk(clk),.reset(reset),.q(mux_B));
counter counter_C(.enable(reg_enable_C_counter),.clk(clk),.reset(reset),.q(mux_C));
counter counter_D(.enable(reg_enable_D_counter),.clk(clk),.reset(reset),.q(mux_D));
counter counter_master(.enable(master_enable_out),.clk(clk),.reset(reset),.q(master_enable_count));

mux mux_output(.A(mux_A),.B(mux_B),.C(mux_C),.D(mux_D),.S(s),.Y(mux_out));
endmodule
