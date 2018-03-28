`timescale 1ns / 1ps


module Test(
    input logic clk,
    output logic shcp,
    output logic stcp,
    output logic mr,
    output logic oe,
    output logic [7:0] rowsOut,
    output logic ds
    );
    logic [7:0] red, green, blue;
    logic [23:0] matris;
    assign matris[23:16] = red;
    assign matris[15:8] = green;
    assign matris[7:0] = blue;
    
    
                              //red     //green  //blue
   logic [7:0][23:0] aa = {24'b11111111_00000000_00000000,
                           24'b11111111_00000000_00000000,
                           24'b11111111_11111111_00000000,
                           24'b00000000_11111111_00000000,
                           24'b11111111_11111111_11111111,
                           24'b00000000_11111111_11111111,
                           24'b00000000_00000000_11111111,
                           24'b10000000_00000000_11111111};
   
   led(clk, aa,rowsOut, shcp, stcp, mr, oe, ds);
   

endmodule


module ClockDivider(
    input clk_in,
    input logic bitt,
    output clk_out
    );
    
logic [27:0] count = {28{1'b0}}; 
logic [27:0] D = {28{1'b0}}; 
logic clk_NoBuf;

always@ (posedge clk_in) begin
	count <= count + 1;    
end//always
always_comb
    case(bitt)
    1: clk_NoBuf = count[15];
    0: clk_NoBuf = count[9];
    endcase
BUFG BUFG_inst (
  .I(clk_NoBuf),  // 1-bit input: Clock input
  .O(clk_out) // 1-bit output: Clock output
  
);

endmodule

module led( input clk, input logic [7:0][23:0] inp, output logic [7:0] rowsOut, output logic shcp, stcp, mr, oe, ds);
    
    logic f;
    logic [23:0] dstotal; 
    logic greenDivider=0;
    assign dstotal = greenDivider ? {inp[a][23:16],8'b0,inp[a][7:0]} : {8'b0,inp[a][15:8],8'b0};
    int i; logic [2:0] a = 0;
    SignalDivider davudo(clk, shcp, stcp , oe, i,f);
    
    always_ff@(negedge f)
    begin
    if(i<3)
    mr<=0;
    else
    mr<=1;
    if(i>2&&i<27)
    ds <= dstotal[i-3];
    else
    ds <=0;
    end
    
    always_ff@(negedge f)
        if(i==410) begin 
            if(greenDivider)
            a <= a+1;
            else a<=a;
            greenDivider++;
        end
        else begin
        a <= a;
        greenDivider<=greenDivider;
        end
    
    
    
    always_comb
    case(a)
    0: rowsOut = 1;
    1: rowsOut = 2;
    2: rowsOut = 4;
    3: rowsOut = 8;
    4: rowsOut = 16;
    5: rowsOut = 32;
    6: rowsOut = 64;
    7: rowsOut = 128;
    default: rowsOut = 0;
    endcase
    
endmodule

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


