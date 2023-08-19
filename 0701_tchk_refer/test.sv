`timescale 1ns/1ns
module test();
    logic in, clk, cond;
  DUT inst(.in(in), .clk(clk), .cond(cond));
    initial begin 
        in = 1'bx;
        clk = 1'bx;
        cond = 1'bx;
        #5;
        clk = 0;
        #5;
        in = 0;
    end
endmodule

module DUT(in, clk, cond);
    input in, clk, cond;
    specify
        $hold(clk &&& (cond==1), in, 11);
    endspecify
endmodule