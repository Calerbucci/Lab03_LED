`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/10 18:27:00
// Design Name: 
// Module Name: lab3_1
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
//module clock_divider(clk, clk_div);
//parameter n=25;
//input clk;
//output clk_div;

//reg [n-1:0] num ;
//wire [n-1:0] next_num;

//always @(posedge clk) begin
//    num = next_num;
//    end

//assign next_num = num+1;
//assign clk_div = num[n-1];

//endmodule


module lab3_1(clk, rst, en , dir, led);
input clk;
input rst;
input en;
input dir;
output [15:0] led;

reg[15:0] led=0;
reg[15:0] next_led=0;
wire clk_div;

clock_divider clkdiv (.clk(clk), .clk_div(clk_div));

always@(posedge clk_div) begin
    led = next_led;
end

always @ (*) begin 
    if(rst ==1) next_led = 16'b1000000000000000;
    else begin
        if(en ==1 && dir ==1) begin
         if(led == 16'b1000000000000000) next_led = 16'b000000000000001;
                else  next_led = led << 1;
        end
        else if(en == 1 && dir ==0) begin
           if(led == 16'b000000000000001) next_led =  16'b1000000000000000; 
            else next_led = led>>1;
        end
            else if(en ==0) next_led = next_led;
            
    end
end

endmodule 
