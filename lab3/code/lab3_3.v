`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/12 22:04:58
// Design Name: 
// Module Name: Lab3_3
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

//reg [n-1:0] num;
//wire [n-1:0] next_num;

//always @(posedge clk) begin
//    num = next_num;
//    end

//assign next_num = num+1;
//assign clk_div = num[n-1];

//endmodule

module lab3_3(clk, rst, en, speed ,led);
input clk;
input rst;
input en;
input speed;
output [15:0] led;

reg [15:0] ledM1A;
reg [15:0] ledM1B;
reg [15:0] ledM3;
reg [15:0] led_nextM1A;
reg [15:0] led_nextM1B;
reg [15:0] led_nextM3 ;
reg flag, n_flag;
reg dirA,n_dirA, n_dirB, dirB, dirC, n_dirC;

wire clk_div23;                     
wire clk_div25;
wire tmp_clock1, tmp_clock2;





clock_divider #(25) clkdiv1(.clk(clk), .clk_div(clk_div25));
clock_divider #(23) clkdiv2(.clk(clk), .clk_div(clk_div23));

assign tmp_clock1 = (speed == 0)? clk_div25: clk_div23;
assign tmp_clock2 = (speed == 0)? clk_div23: clk_div25;



always @(posedge tmp_clock1, posedge rst) begin
            //Mr3
            if(rst) begin
                ledM3 <= 16'b0000111000000000;
                dirC <= 0;
            end
            else begin
                ledM3 <= led_nextM3;
                dirC <= n_dirC;
                
                
            end
end

always @(posedge tmp_clock2, posedge rst) begin
            //Mr1A
            if(rst) begin
                ledM1A <= 16'b1000000000000000;
                dirA <=1;
            end
            else begin
                ledM1A <= led_nextM1A;
                dirA <= n_dirA;
            end
            
end

always @(posedge tmp_clock2, posedge rst) begin
            //Mr1B
             if(rst) begin
                ledM1B <= 16'b0000000000000001;
                dirB <=0;
            end
            else begin
                ledM1B <= led_nextM1B;
                  dirB <= n_dirB;
            end
end

always@(*) begin
       
        led_nextM3 = ledM3;
        led_nextM1A = ledM1A;
        led_nextM1B = ledM1B;
        n_dirC = dirC;
        n_dirB = dirB;
        n_dirA = dirA;
    if(en ==1 ) begin
      if(dirA == 0)begin
         if(ledM1A == 16'b1000_0000_0000_0000) begin
                led_nextM1A =  ledM1A>> 1;
                n_dirA = 1;
            end
        else if(ledM1A != 16'b1000000000000000 ) begin
                 led_nextM1A =  ledM1A << 1;
                 n_dirA = dirA;
           end
     end
    else if(dirA == 1) begin
      if(ledM1A + ledM3 == 16'b0001111000000000 ||( ledM1A & ledM3 != 0) || ledM1A + ledM3 == 16'b0000111100000000 ||  ledM1A + ledM3 == 16'b00000111100000000 || ledM1A + ledM3 == 16'b0000001111000000  || ledM1A + ledM3 == 16'b0000000111100000 || ledM1A + ledM3 == 16'b0000000011110000) begin
               led_nextM1A =    ledM1A << 1;
               n_dirA = 0;
               end
      else begin
                 led_nextM1A =   ledM1A >> 1;  
                  n_dirA = dirA;
                 end
       end
      if(dirB == 1)begin
        if(ledM1B == 16'b0000000000000001) begin
            led_nextM1B =  ledM1B<< 1;
            n_dirB = 0;
            end
        else if(ledM1B != 16'b0000000000000001 ) begin
              led_nextM1B = ledM1B >> 1;
               n_dirB = dirB;
              end
      end
     else if(dirB == 0) begin
      if(ledM1B + ledM3 == 16'b0000000001111000 || (ledM1B & ledM3 !=0) || ledM1B + ledM3 == 16'b0000111100000000 ||  ledM1B + ledM3 == 16'b0000011110000000 || ledM1B + ledM3 == 16'b0000001111000000  || ledM1B + ledM3 == 16'b0000000111100000 || ledM1B + ledM3 == 16'b0000000011110000) begin
               led_nextM1B =    ledM1B >> 1;
               n_dirB = 1;
               end
      else begin
                 led_nextM1B =   ledM1B << 1;  
                 n_dirB = dirB;
                 end
            end
           if(dirC == 0)begin
            if(ledM3 == 16'b0000111000000000) begin
                 led_nextM3 =  ledM3 >> 1;
                 n_dirC =1;
            end
            else if(ledM3 != 16'b0000111000000000) begin
                 led_nextM3 =  ledM3 << 1;
                 n_dirC = dirC;
                 
                
            end
        end
       else if(dirC == 1)begin
            if(ledM3 == 16'b0000000001110000) begin
                 led_nextM3 =  ledM3 << 1;
                n_dirC = 0;
            end
        else if(ledM3 != 16'b0000000001110000) begin
              led_nextM3 =  ledM3 >> 1;
              n_dirC = dirC;
              
         end
        end

        end
       
        
        
    
end



assign led = ledM1A | ledM1B | ledM3;




endmodule


