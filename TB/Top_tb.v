`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 09:20:17 PM
// Design Name: 
// Module Name: Top_tb
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


module Top_tb();
reg a,b,c,d,clk,master_enable,reset;
reg [1:0]s;
wire [3:0]mux_out;
Top dut(a,b,c,d,clk,master_enable,reset,s,mux_out);



task initialization;
 begin
   clk = 0;
   a=0;
   b=0;
   c=0;
   d=0;
   master_enable=0;
   s=0;   
   reset=0;
   #10; 
 end
endtask

task reset_control;
 begin
    reset = 1;
    #20 reset =0;
    #10;
 end
endtask
always #2 clk = ~clk;



task monitoring;
 begin
    $monitor("Time = %0t , a=%0b ,b=%0b ,c=%0b ,d=%0b, master_enable=%0b , reset=%0b ,s=%0b,",$time,a,b,c,d,master_enable,reset,s);
 end
endtask

//task partyvote;
// begin
//  for(i = 0 ; i<=3;i=i+1)
//   begin
//     s = i;
//     #10;
//   end
// end
//endtask

initial begin
 monitoring;
 initialization;
 reset_control;
 #10;
 
 {a,b,c,d,master_enable} = 5'b10001;  //1 a=1
 #5 master_enable= 0;
 #10;
 {a,b,c,d,master_enable} = 5'b10001;  //2 a=1
 #5 master_enable= 0;
 #20;
 {a,b,c,d,master_enable} = 5'b10001;  //3 a=1
 #5 master_enable= 0;
 #30; 
 {a,b,c,d,master_enable} = 5'b10001;  //4 a=1
 #5 master_enable= 0;
 #10;
 {a,b,c,d,master_enable} = 5'b10001;  //5 a=1
 #5 master_enable= 0;
 #20;
 {a,b,c,d,master_enable} = 5'b00101;  //6 c=1
 #5 master_enable= 0;
 #30;
 {a,b,c,d,master_enable} = 5'b00011;  //7 d=1
 #5 master_enable= 0;
 #10;
 {a,b,c,d,master_enable} = 5'b10001;  //8  a=1
 #5 master_enable= 0;
 #20;
 {a,b,c,d,master_enable} = 5'b01001;  //9  b=1
 #5 master_enable= 0;
 #30;
 {a,b,c,d,master_enable} = 5'b00011; //10 d=1
 #5 master_enable= 0;
 #10;
 {a,b,c,d,master_enable} = 5'b10001; //11 a=1
 #5 master_enable= 0;
 #20;
 {a,b,c,d,master_enable} = 5'b01001; //12 b=1
 #5 master_enable= 0;
 #30;
 {a,b,c,d,master_enable} = 5'b00101; //13 c=1
 #5 master_enable= 0;
 #10;
 {a,b,c,d,master_enable} = 5'b00011; //14 d=1
 #5 master_enable= 0;
 #30;
 {a,b,c,d,master_enable} = 5'b00101; //15  c=1
 #5 master_enable= 0;
 #40;
 s=0;
 #10 s=1;
 #20 s=2;
 #30 s=3;
 #50 $finish;
end

endmodule
