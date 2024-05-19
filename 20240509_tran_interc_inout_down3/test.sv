`timescale 1ns/1ns
module test;
    wire io, io2;
    reg in;
    // assign io = in;
    assign io2 = in;

    initial begin
        in = 0;
        #100;
        in = 1;
    end

    SUB sub(io, io2);
    initial begin
        $sdf_annotate("test.sdf");
    end

    initial begin
        $monitor($realtime, " io=%b, io2=%b, sub.io=%b, sub.io2=%b", 
        io, io2, sub.io, sub.io2);
    end
endmodule

module SUB(io, io2);
    inout io, io2;
    

    tran(io, io2);
endmodule
