`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2025 11:01:09 AM
// Design Name: 
// Module Name: SwitchesTo7Seg_TB
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

`timescale 1ns / 1ps
module SwitchesTo7Seg_TB();

	//input declarations
	reg iClk;
	reg [3:0] Switch;	

	//output declaration
	wire [6:0] SevenSegDisplay;
	wire [3:0] DebouncedSwitch;
	
	//DUT instantiation
	SwitchesTo7Seg DUT(
		.iClk(iClk),
		.Switch(Switch),
		.PMOD_7Seg(SevenSegDisplay),
		.DebouncedSwitch(DebouncedSwitch)
		);
	
	initial begin
		//clock generation
		iClk = 1'b0;
		forever #5 iClk = ~iClk;
	end
	
	initial begin
	//initialization
		Switch = 4'd0;
	end
	
	initial begin
		//variation (fixed values/loops)
		#500 Switch = 4'd1;
		#500 Switch = 4'd2;
		#500 Switch = 4'd3;
		#500 Switch = 4'd4;
		#500 Switch = 4'd5;
		#500 Switch = 4'd6;
		#500 Switch = 4'd7;
		#500 Switch = 4'd8;
		#500 Switch = 4'd9;

	end
	
	initial begin
		$monitor("Time: %0d, Switch: %d, 7Seg: %b, DebouncedSwitch: %b",$time, Switch, SevenSegDisplay, DebouncedSwitch);
		#5000 $finish;
	end
endmodule
