`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 20:16:35
// Design Name: 
// Module Name: top_m_s
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


module top_m_s(

input clk,rstn,wr,newd,
input [3:0] ain,
input [7:0] din,
output [7:0] dout

    );
    
    
wire psel, penable, pready, pwrite;
wire [7:0] prdata, pwdata;
wire [3:0] paddr;
 

apb_m m1 (
        .pclk(clk),
        .presetn(rstn),
        .addrin(ain),
        .datain(din),
        .wr(wr),
        .newd(newd),
        .prdata(prdata),
        .pready(pready),
        .psel(psel),
        .penable(penable),
        .paddr(paddr),
        .pwdata(pwdata),
        .pwrite(pwrite),
        .dataout(dout)
    );



    apb_s s1 (
        .pclk(clk),
        .presetn(rstn),
        .paddr(paddr),
        .psel(psel),
        .penable(penable),
        .pwdata(pwdata),
        .pwrite(pwrite),
        .prdata(prdata),
        .pready(pready)
    );
    
    
endmodule
