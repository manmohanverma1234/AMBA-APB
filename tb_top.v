`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 20:17:43
// Design Name: 
// Module Name: tb_top
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

module tb_top;
    // Define testbench ports
    reg clk = 0;
    reg rstn;
    reg wr;
    reg newd;
    reg [3:0] ain;
    reg [7:0] din;
    wire [7:0] dout;

always #10 clk = ~clk;
    // Instantiate the top module
    top_m_s dut (
        .clk(clk),
        .rstn(rstn),
        .wr(wr),
        .newd(newd),
        .ain(ain),
        .din(din),
        .dout(dout)
    );
    integer i;
    initial
    begin
    rstn = 0;
    repeat(5) @(posedge clk);
    rstn = 1;
    newd = 1;
    for(i = 0; i < 10; i=i+1)
    begin
    ain = $urandom;
    din = $urandom;
    wr = 1;
    @(posedge dut.m1.pready);
    end
    
    
    for( i = 0; i < 10; i=i+1)
    begin
    ain = $urandom;
    din = 0;
    wr = 0;
    @(posedge dut.m1.pready);
    end
    
    
    end

    initial begin
    #900;
    $stop;
    end


endmodule