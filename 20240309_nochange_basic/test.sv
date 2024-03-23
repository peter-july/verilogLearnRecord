module test; 
    logic clk, d, cond;
    DUT dut(clk, d, cond);

    initial begin
        cond = 1;
    end
    initial begin
        #10;
        clk = 1;
        #10;
        clk = 0;
    end
    initial begin
        #15;
        d = 1;
    end
endmodule

module DUT(clk, d, cond);
    input clk, d, cond;
    reg notifier;
    specify 
        $nochange(posedge clk, posedge d,  2,  3, notifier); // 9!, 15!, 22!
        // $nochange(posedge clk, posedge d, -2,  3, notifier); // 13!, 22!
        // $nochange(posedge clk, posedge d,  0,  0, notifier); // 15
        // $nochange(posedge clk, posedge d,  2, -3, notifier); // 9!, 16!
        // $nochange(posedge clk, posedge d, -2, -3, notifier); // 15!
        // $nochange(posedge clk &&& cond, posedge d, 0, 0);
    endspecify
    always@(notifier) begin
        $display("current time: ", $realtime);
    end
endmodule 