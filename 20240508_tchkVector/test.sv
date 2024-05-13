`timescale 1ps/1ps
module test;
    wire o;
    reg [2:0] d, clk;
    dut inst(o, clk, d);
    initial begin
        // clk = 3'b111;
        // d = 3'b111;
        #10;
        d = 3'b011;
        #5;
        clk = 3'b010;
    end
endmodule

module dut(o, clk, d);
    output o;
    input [2:0] clk, d;
    reg notifier;
    specify 
        $setup(d, clk, 10, notifier);
        $setup(posedge d, posedge clk, 10, notifier);        
        $setup(negedge d, negedge clk, 10, notifier);
    endspecify
endmodule
