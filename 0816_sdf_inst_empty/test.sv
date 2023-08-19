`timescale 1ns/1ns
module top;
    logic a;
    logic in, out;
    test1 my_inst1(.a(a));
    test2 my_inst2(.a(a));
    DUT inst0(.in(in), .out(out));

    initial begin 
        #1;
        in = 1;
        #1;
        out = 1;
    end
endmodule

module test1(input a);
    logic in, out;
    // DUT inst1(.in(in), .out(out));
    // DUT inst2(.in(in), .out(out));
    DUT i[0, 10] (.in(in), .out(out));

    // test11 hi_inst(.a(a));
    
    initial begin 
        $sdf_annotate("test.sdf");
    end
    initial begin 
        #1;
        in = 1;
        #1;
        out = 1;
    end
endmodule
module test2(input a);
    logic in, out;
    DUT inst3(.in(in), .out(out));
    DUT inst4(.in(in), .out(out));

    initial begin 
        #1;
        in = 1;
        #1;
        out = 1;
    end
endmodule

// module test11(input a);
//     logic in, out;
//     DUT inst5(.in(in), .out(out));

//     initial begin 
//         #1;
//         in = 1;
//         #1;
//         out = 1;
//     end
// endmodule

module DUT(in, out);
    input in, out;
    specify 
        $setup(in, out, 2);
    endspecify 
endmodule