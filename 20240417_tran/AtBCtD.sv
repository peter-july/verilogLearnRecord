module test;

  reg a_tmp, c_tmp;

  wire a, c;

  assign a = a_tmp;
  assign c = c_tmp;

  dut I0 (
      a,
      c
  );

  initial begin
    $monitor($realtime,,,, a,, I0.B,, c,,I0.D);
    a_tmp = 1'b0;
    c_tmp = 1'b0;
    #100;
    a_tmp = 1'b1;
    #100 a_tmp = 1'b0;
  end
endmodule

module dut (
    inout A,
    inout C
);
  wire B;
  wire D;
  tran (B, A);
  tran (C, D);

  assign C = B;

  specify
    (A => C) = (10);
  endspecify

endmodule


// A-tool
// 0   0 0 x x
// 10   0 0 0 0
// 100   1 1 0 0
// 110   1 1 x x
// 200   0 0 x x
// 210   0 0 0 0

//B-tool
// 0   0 0 0 0
// 100   1 1 x x
// 200   0 0 0 0

//C-tool
// 0   0 0 x x
// 10   0 0 0 0
// 100   1 1 0 0
// 110   1 1 x x
// 200   0 0 x x
// 210   0 0 0 0
