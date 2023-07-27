`timescale 1ns/1ns
module test();
reg A, B, C;
wire out;
DUT inst1(.out(out), .A(A), .B(B), .C(C));
initial begin 
    $sdf_annotate("test.sdf");
end

initial begin 
    A = 0; B = 0;  // 0ns
    #10;
    A = 1; B = 0;  // 10ns
    #10;
    A = 1; B = 1;  // 20ns violation1
    #10;
    A = 0; B = 1;  // 30ns
    #10;
    A = 0; B = 0;  // 40ns violation2
    #4 $finish;    // 44ns
end
endmodule

module DUT(out, A, B, C); 
output out;
input A, B, C;
reg notifier;
specify 
    $setup(A, B, 1, notifier);
endspecify
endmodule