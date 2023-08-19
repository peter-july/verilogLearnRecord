`timescale 1ps/1fs
module test(A, AEN, rd_en);
    input A, AEN, rd_en;
    `define TSUR_A 20
    reg notifier;
    specify 
        specparam Tsur_a = `TSUR_A;
        $setup(negedge A,  negedge AEN &&& (rd_en == 1), Tsur_a, notifier);
        $hold(negedge AEN &&& (rd_en == 1), negedge A, Tsur_a, notifier);
    endspecify 
endmodule

module tb;
    reg A, AEN, rd_en;
    test u_test(.A(A), .AEN(AEN), .rd_en(rd_en));
    initial begin 
        A = 1'bx;
        AEN = 1'bx;
        rd_en = 1'bx;
        #2000;
        AEN = 0;
        #10;
        A = 0;
        #45;
        rd_en = 0;
        #1000;
        $finish;
    end 
endmodule