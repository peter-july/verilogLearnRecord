`timescale 1ns/1ns
module test;
    wire io;
    buf (io, 1'b0);
    SUB sub(io);
    initial begin
        $sdf_annotate("test.sdf");
    end

    initial begin
        $monitor($realtime, " io=%b, test.sub.io=%b, test.sub.a=%b, test.sub.leaf.io=%b", 
        io, test.sub.io, test.sub.a, test.sub.leaf.io);
    end
endmodule

module SUB(io);
    inout io;
    wire a;
    // tran(io, a);

    LEAF leaf(io);
endmodule

module LEAF(io);
    inout io;
    reg in;
    assign io = in;
    initial begin
        // #100;
        in = 0;
        #100;
        in = 1;
    end
endmodule

