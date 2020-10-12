//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2020/10/11 21:38:24
//// Design Name: 
//// Module Name: lab3_2
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
////module clock_divider(clk, clk_div);
////parameter n=25;
////input clk;
////output clk_div;

////reg [n-1:0] num;
////wire [n-1:0] next_num;

////always @(posedge clk) begin
////    num = next_num;
////    end

////assign next_num = num+1;
////assign clk_div = num[n-1];

////endmodule

//module lab3_2(clk, rst, en, speed ,led);
//input clk;
//input rst;
//input en;
//input speed;
//output [15:0] led;

//reg [15:0] ledM1;
//reg [15:0] ledM3 ;
//reg [15:0] led_nextM1;
//reg [15:0] led_nextM3 ;
//wire clk_div23;                     
//wire clk_div25;
//wire tmp_clock1, tmp_clock2;

//clock_divider #(25) clkdiv1(.clk(clk), .clk_div(clk_div25));
//clock_divider #(23) clkdiv2(.clk(clk), .clk_div(clk_div23));

//assign tmp_clock1 = (speed == 0)? clk_div25: clk_div23;
//assign tmp_clock2 = (speed == 0)? clk_div23: clk_div25;


//initial begin
//    led_nextM1 = 16'b1000000000000000;
//    led_nextM3 = 16'b0000000000000111;
    
//end

//always@(posedge tmp_clock1) begin
//    ledM3 = led_nextM3;
    
//end

//always@(posedge tmp_clock2) begin
//    ledM1 = led_nextM1;
//end

//always@(*) begin
//    if (rst == 1) begin
//           led_nextM1 = 16'b1000000000000000;
//           led_nextM3 = 16'b0000000000000111;
          
//    end
//    else if(rst == 0) begin 
//        if (en == 0) begin
//            led_nextM1 = led_nextM1;
//            led_nextM3 = led_nextM3;
            
//        end
//        else if (en == 1) begin
//            if(speed == 0 ) begin
//                // code here
//                if(ledM3 ==  16'b1110000000000000  ) begin
//                    led_nextM3 = 16'b1100000000000001;
//                    end
//                else if(ledM3 ==  16'b1100000000000001)begin
//                    led_nextM3 = 16'b1000000000000011;
//                    end
//                else if(  ledM3 == 16'b1000000000000011)begin
//                    led_nextM3 = 16'b0000000000000111;
//                end
//                else if(ledM1 == 16'b0000000000000001) begin
//                    led_nextM1 = 16'b1000000000000000;
//                end 
//                else begin
//                    led_nextM1 = led_nextM1 >> 1;
//                    led_nextM3 =  led_nextM3 << 3;
                                    
//                end         
//            end
//         if(speed == 1 ) begin
//                // code here
//                if(ledM3 ==  16'b1110000000000000  ) begin
//                    led_nextM3 = 16'b1100000000000001;
//                    end
//                else if(ledM3 ==  16'b1100000000000001)begin
//                    led_nextM3 = 16'b1000000000000011;
//                    end
//                else if(  ledM3 == 16'b1000000000000011)begin
//                    led_nextM3 = 16'b0000000000000111;
//                   end
//                else if(ledM1 == 16'b0000000000000001) begin
//                    led_nextM1 = 16'b1000000000000000;
//                end 
//                else begin
//                    led_nextM1 = led_nextM1 >> 1;
//                    led_nextM3 =  led_nextM3 << 3;
                                       
//                end         
//            end
//        end
//    end
//end 

//assign led = ledM1 | ledM3;


//endmodule
