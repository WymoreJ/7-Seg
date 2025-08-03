`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2025 09:27:41 AM
// Design Name: 
// Module Name: SwitchesTo7Seg
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


module SwitchesTo7Seg(
    input 	iClk,
    input 	[3:0] Switch,
    output 	[6:0] PMOD_7Seg,
    output 	[3:0] DebouncedSwitch
    );
    
    parameter 	DEBOUNCE_LIMIT = 5;	//number of clock cycles to debounce the signal
	reg	[3:0]	StableValue		= 4'd0;
	reg [3:0]	DebouncePrev	= 4'd0;

	always @(posedge iClk) begin
		DebouncePrev <= DebouncedSwitch;
		
		if (DebouncedSwitch == DebouncePrev)
			StableValue <= DebouncedSwitch;
	end
	    
    SwitchDebouncer #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_Inst
		(.iClk(iClk),					//pass in the clock signal
		 .iBounce(Switch),				//pass in the unconditioned signal
		 .oDebounced(DebouncedSwitch));	//return the conditioned signal
		 
	
    
    SevenSegDisplay Single7Seg(
    	.iBCD(StableValue),
    	.oLED(PMOD_7Seg)
    );
    
endmodule
