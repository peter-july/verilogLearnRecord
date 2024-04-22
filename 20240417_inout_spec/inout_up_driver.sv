module test;
    reg a, b, c, d, o_tmp;
    wire o;
    assign o = c;
    dut I0 (a,b,c,d,o);

    initial begin
        $monitor($realtime,,,, a,,b,,c,,d,,,,,,o,,I0.O);
        // a = 1'b0;
        // b = 1'b0;
        c = 1'b0;
        d = 1'b0;

        #100;
        a = 1'b1;
        #100
        a = 1'b0;

        #100;
        b = 1'b1;
        #100
        b = 1'b0;

        #100;
        c = 1'b1;
        #100
        c = 1'b0;

        #100;
        d = 1'b1;
    end
endmodule

module dut (A,B,C,D,O);
    input  A;
    input  B;
    input  C;
    input  D;
    inout  O;
    assign O = A;
    down I0 (B,O);
    specify
        (A => O) = (1); // local
        (B => O) = (2); // lowconn
        (C => O) = (3); // highconn
    endspecify
endmodule

module down (in,out);
    input  in;
    inout out;
    assign out = in;
endmodule


// A-tool
// 0   0 0 0 0     x x
// 1   0 0 0 0     0 0
// 100   1 0 0 0     0 0
// 101   1 0 0 0     x x
// 200   0 0 0 0     x x
// 201   0 0 0 0     0 0
// 300   0 1 0 0     0 0
// 302   0 1 0 0     x x
// 400   0 0 0 0     x x
// 402   0 0 0 0     0 0
// 500   0 0 1 0     x x
// 600   0 0 0 0     0 0
// 700   0 0 0 1     0 0


//B-tool
// 0   0 0 0 0     x x
// 1   0 0 0 0     0 0
// 100   1 0 0 0     0 0
// 101   1 0 0 0     x x
// 200   0 0 0 0     x x
// 201   0 0 0 0     0 0
// 300   0 1 0 0     0 0
// 302   0 1 0 0     x x
// 400   0 0 0 0     x x
// 402   0 0 0 0     0 0
// 500   0 0 1 0     x x
// 600   0 0 0 0     0 0
// 700   0 0 0 1     0 0

//C-tool
// 0   0 0 0 0     x x
// 1   0 0 0 0     0 0
// 100   1 0 0 0     0 0
// 101   1 0 0 0     x x
// 200   0 0 0 0     x x
// 201   0 0 0 0     0 0
// 300   0 1 0 0     0 0
// 302   0 1 0 0     x x
// 400   0 0 0 0     x x
// 402   0 0 0 0     0 0
// 500   0 0 1 0     x x
// 600   0 0 0 0     0 0
// 700   0 0 0 1     0 0