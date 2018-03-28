/*`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2017 10:48:20 AM
// Design Name: 
// Module Name: signalDivider
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

module SignalDivider(input logic clk, output logic shcp, stcp,oe, int i, 
                output logic f );
    
    //8 bit register counter for the dot matrix
    logic [7:0] counter = 0;
    
    //counts at every clock positive edge
    always_ff@(posedge clk)
    counter <= counter+1;
    
    assign f = counter[7];
    
    
    always_ff@(negedge f)
    if(i==410)
    i<=1;
    else
    i <= i+1;
    
    //determines the values of the shifter clock and 
    always_ff@(negedge clk)
    if(i<28)
    begin
    shcp<=f;
    stcp<=~f;
    end
    else
    begin
    shcp<=0;
    stcp<=1;
    end
    
    
    always_ff@(posedge f)
        if(i>28 && i<409)
        oe <= 0;
        else
        oe<= 1;
endmodule
