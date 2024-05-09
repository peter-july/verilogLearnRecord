`timescale 1ps/1ps
module test;
    wire o;
    reg [1:0] d, clk;
    dut inst(o, clk, d);
    initial begin
        clk = 2'b00;
        d = 2'b00;
        #10;
        d = 2'b11;
        #5;
        clk = 2'b11;
    end
endmodule

module dut(o, clk, d);
    output o;
    input [1:0] clk, d;
    reg notifier;
    specify 
        $setup(posedge d, posedge clk, 10, notifier);
    endspecify
endmodule