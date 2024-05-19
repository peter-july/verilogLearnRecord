`timescale 1ns/1ns
module test;
    wire io;
    buf (io, 1'b0);

    tran(io, sub.io);

    SUB sub(io);
    initial begin
        $sdf_annotate("test.sdf");
    end

    initial begin
        $monitor($realtime, " io=%b, sub.io=%b, sub.leaf.io=%b", 
        io, sub.io, sub.leaf.io);
    end
endmodule

module SUB(io);
    inout io;
    LEAF leaf(io);
endmodule

module LEAF(io);
    inout io;
    reg in;
    assign io = in;
    initial begin
        in = 0;
        #100;
        in = 1;
    end
endmodule

