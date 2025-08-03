`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2025 08:25:51 AM
// Design Name: 
// Module Name: SwitchDebouncer
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


module SwitchDebouncer #(parameter DEBOUNCE_LIMIT = 10)(
    input 	iClk,
    input 	[3:0]	iBounce,
    output 	[3:0]	oDebounced
    );
    
    reg [DEBOUNCE_LIMIT:0] rCount = 0;		//size and initialize the register
    reg [3:0] rState = 4'd0;				//initialize the register
    
    always @(posedge iClk)
    begin
    	if (iBounce !== rState && rCount < DEBOUNCE_LIMIT-1)	//if the signals has not been debounced
    		rCount <= rCount + 1;								//increment the counter
    	else if (rCount == DEBOUNCE_LIMIT-1)					//if the signal has been stable long enough
    	begin
    		rState <= iBounce;									//set the state register to the value of the input signal
    		rCount <= 0;										//reset the counter
    	end
    	else rCount <= 0;										//preventing a latch
    end
    
    assign oDebounced = rState;									//return the conditioned signal
    
endmodule
