module test;
    reg a, b, c, d, o;
    dut I0 (a,b,c,d,o);
    initial begin
        $monitor($realtime,,,, a,,b,,c,,d,,o);
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        #100;
        a = 1'b1;
        b = 1'b1;
        c = 1'b1;
        d = 1'b1;
    end
endmodule

module dut (A,B,C,D,O);
    input  A;
    input  B;
    input  C;
    input  D;
    output O;

    assign O = A;
    down I0 (B,O);
    specify
        (A => O) = (1);
    endspecify
endmodule

module down (in, out);
    input  in;
    output out;
    assign out = in;
endmodule


// A-tool
// 0   0 0 0 0 x
// 1   0 0 0 0 0
// 100   1 1 1 1 0
// 101   1 1 1 1 1

//B-tool
// 0   0 0 0 0 x
// 1   0 0 0 0 0
// 100   1 1 1 1 0
// 101   1 1 1 1 1

//C-tool
// 0   0 0 0 0 x
// 1   0 0 0 0 0
// 100   1 1 1 1 0
// 101   1 1 1 1 1