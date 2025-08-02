`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 08:58:47 PM
// Design Name: 
// Module Name: SevenSegDisplay_TB
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


module SevenSegDisplay_TB();

	//input declarations
	reg 	[3:0]	iBCD;
	
	//output declaration
	wire 	[6:0]	oLED;
	
	//DUT instantiation
	SevenSegDisplay DUT(
	.iBCD	(iBCD),
	.oLED	(oLED)
	);
	
	initial begin
		//clock generation
		//iClk = 1'b0;
		//forever #2 iClk = ~iClk;
	end
	
	initial begin
	//initialization
	iBCD	=	4'd0;
	end
	
	initial begin
		//variation (fixed values/loops)
		iBCD	=	4'd0;	#10
		iBCD	=	4'd1;	#10
		iBCD	=	4'd2;	#10
		iBCD	=	4'd3;	#10
		iBCD	=	4'd4;	#10
		iBCD	=	4'd5;	#10
		iBCD	=	4'd6;	#10
		iBCD	=	4'd7;	#10
		iBCD	=	4'd8;	#10
		iBCD	=	4'd9;	#10
		iBCD	=	4'd0;

	end
	
	initial begin
	
		$monitor("Time: %0d, Binary Coded Decimal: %d, 7 Segment: %b ",$time, iBCD, oLED);
		$finish;
	end
	

endmodule
