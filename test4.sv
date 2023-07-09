`timescale 1ns/1ns
module test();
    logic clk;
    reg[7:0] in;
    dut inst1(.in(in), .clk(clk));

    initial begin 
        in = 8'b00000001;
        #11 in = 8'b00000011;  //11ns
        #11 in = 8'b00000111;  //22ns
        #5 $finish;
    end
    initial begin 
        clk = 1'b0;
        forever begin 
            #5 clk = ~clk;
        end
    end
endmodule

module dut(in, clk);
    input[7:0] in;
    input clk;
    specify 
        $setup(clk, in, 6);
    endspecify
endmodule 