module top;
    logic ina, out;
    test test_u (ina,out);
    initial begin
        $monitor($realtime, " ina :%d, out: %d", ina, out);
        ina = 1'b0;
        #10ns;
        ina = 1'b1;
    end
endmodule

module test (ina,out);
    input ina;
    output out;

    sub I0 (ina,out);
    specify
        (ina => out) = 2;
    endspecify
endmodule

module sub (in,out);
    input  in;
    output out;
    assign out = in;
endmodule

// A-tool
// 0 ina :0, out: x
// 2 ina :0, out: 0
// 10 ina :1, out: 0
// 12 ina :1, out: 1
