module test;
    reg in;
    wire o;
    dut inst(o, in);

    initial begin
        $sdf_annotate("test.sdf");
    end
    initial begin
        $monitor($time, " inst.o = %b, o = %b", inst.o, o);
        in = 0;
        #100;
        in = 1;
    end
endmodule

module dut(o, in); 
    inout o;
    input in;
    assign o = in;
    specify 
        (in => o) = (5);
    endspecify
endmodule