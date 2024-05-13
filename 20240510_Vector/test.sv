`timescale 1ps/1ps
module test;
    wire o;
    reg [2:0] d, clk;
    dut inst(o, clk, d);

    initial begin
        #10;
        d = 3'b001; // 10
        #1;
        d = 3'b000;
        #9;
        d = 3'b010; // 20
        #1;
        d = 3'b000;
        #9;
        d = 3'b100; // 30
        #1;
        d = 3'b000;
        #9;
        d = 3'b110; // 40
        #1;
        d = 3'b000;
        #9;
        d = 3'b101; // 50
        #1;
        d = 3'b000;
        #9;
        d = 3'b011; // 60
        #1;
        d = 3'b000;
        #9;
        d = 3'b111; // 70
    end
endmodule

module dut(o, clk, d);
    output o;
    input [2:0] clk, d;
    reg notifier = 0;

    always @(posedge d) begin
        notifier <= ~notifier;
        // $display($realtime, " posedge d occurs");
    end
    initial begin 
        $monitor($realtime, " notifier = %b", notifier);
    end
endmodule
