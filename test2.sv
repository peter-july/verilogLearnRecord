`timescale 1ns/1ns
module test();
reg A, B, C;
wire out;
dut my_inst1(.out(out), .A(A), .B(B), .C(C));
dut my_inst2(.out(out), .A(A), .B(B), .C(C));
initial begin 
    $disable_warnings(test);
    #21ns;
    $enable_warnings(test);
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

module dut(out, A, B, C); 
output out;
input A, B, C;
reg notifier;
// initial begin 
//     $monitor($realtime, " notifier = %b", notifier);
// end
specify 
    $setup(A, B, 11, notifier);
endspecify
endmodule