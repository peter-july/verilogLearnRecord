module test;
    reg in;
    wire out;
    dut inst(in, out);
    initial begin
       $sdf_annotate("test.sdf"); 
    end
    initial begin
        #10;
        in = 1;
        #10;
        in = 0;
    end
endmodule

module dut(in, out); 
    input in;
    output out;
    wire a;
    // tran(out, a);

    sub sub(in, out);
    initial begin
        $monitor($realtime, " in = %b, sub.in = %b, sub.out = %b, out = %b, a=%b", in, sub.in, sub.out, out, a); 
    end
endmodule

module sub(in, out); 
    input in;
    output out;
    assign out = in;
endmodule