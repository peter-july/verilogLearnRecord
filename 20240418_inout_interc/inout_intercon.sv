`timescale 1ns/1ns
module test;
    reg in;
    wire io;
    buf (io, 1'b0);
    SUB I0(io);

    initial begin
        $sdf_annotate("test.sdf");
    end
    always @(io) begin
        $display($realtime, " io=%b", io);
    end
endmodule

`celldefine
module SUB(io);
    inout io;
    BUF I0(io);
    always @(io) begin
        $display($realtime, "test.I0.io=%b", io);
    end
endmodule

module BUF(io);
    inout io;
    reg in;
    assign io = in;
    initial begin
        in = 0;
        #100;
        in = 1;
        // #100;
        // in = 1'bz;
        // #100;
        // in = 1'bx;
    end
    always @(io) begin
        $display($realtime, "test.I0.I0.io=%b", io);
    end
endmodule
`endcelldefine