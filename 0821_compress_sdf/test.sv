module test;
    wire z;
    wire a;
    dut I[0,10000] (z, a);
    initial begin 
        $sdf_annotate("test1.sdf");
    end
endmodule