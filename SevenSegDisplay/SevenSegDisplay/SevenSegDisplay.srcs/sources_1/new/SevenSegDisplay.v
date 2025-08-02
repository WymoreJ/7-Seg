`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 08:21:15 PM
// Design Name: 
// Module Name: SevenSegDisplay
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


module SevenSegDisplay(
    input 	[3:0] iBCD,		//input Binary-Coded Decimal
    output 	[6:0] oLED		//7-Segment pinout
    );
    
    reg [6:0] rLED;				//LED data
    
    always @(*)
    begin
    	case(iBCD)
    	4'b0000: rLED = 7'b0000001; // "0"  
 		4'b0001: rLED = 7'b1001111; // "1" 
 		4'b0010: rLED = 7'b0010010; // "2" 
 		4'b0011: rLED = 7'b0000110; // "3" 
 		4'b0100: rLED = 7'b1001100; // "4" 
 		4'b0101: rLED = 7'b0100100; // "5" 
 		4'b0110: rLED = 7'b0100000; // "6" 
		4'b0111: rLED = 7'b0001111; // "7" 
 		4'b1000: rLED = 7'b0000000; // "8"  
 		4'b1001: rLED = 7'b0000100; // "9" 
 		default: rLED = 7'b0000001; // "0"
 		endcase
 	end
 	
 	assign oLED = rLED;		//return the LED output
    
endmodule
