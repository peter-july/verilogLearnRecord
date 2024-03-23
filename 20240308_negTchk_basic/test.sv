module test; 
    logic o, clk, d, cond;
    DUT dut(o, clk, d, cond);

    initial begin
        cond = 1;
    end
    initial begin
        clk = 0;
        #10;
        clk = 1;
    end
    initial begin
        d = 0;
        #25;
        d = 1;
    end
endmodule

module DUT(o, clk, d, cond);
    input clk, d, cond;
    output o;
    reg notifier;
    assign o = clk;
    specify 
        (clk => o) = 6;
        $setuphold(posedge clk, d, -3, 8, notifier, , , d_clk, d_d);
        $setuphold(posedge clk, d, -7, 13, notifier, , , d_clk, d_d);
        // $setuphold(posedge clk, d, -10, 20, notifier, , , d_clk, d_d);
    endspecify
    initial begin
        $monitor($realtime, " o=%b,clk=%b, d=%b, d_clk=%b, d_d=%b, ", o, clk,d,d_clk,d_d);
    end
endmodule 

