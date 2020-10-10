`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/10 18:20:52
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(clk, clk_div);
parameter n=25;
input clk;
output clk_div;

reg [24:0] num =0;
wire [24:0] next_num;

always @(posedge clk) begin
    num = next_num;
    end

assign next_num = num+1;
assign clk_div = num[24];

endmodule
