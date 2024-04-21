module test;

  reg a_tmp, c_tmp;

  wire a, b, c;

  assign a = a_tmp;
  assign c = c_tmp;
  assign b = a;
  tran(b, c);

  dut I0 (
      a,
      c
  );

  initial begin
    $monitor($realtime,,,, a,, b,, c);
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

  specify
    (A => C) = (10);
  endspecify

endmodule


// A-tool
// 0   0 x x
// 10   0 0 0
// 100   1 x x
// 200   0 0 0



//B-tool
// 0   0 x x
// 10   0 0 0
// 100   1 x x
// 200   0 0 0




//C-tool
// 0   0 0 0
// 100   1 x x
// 200   0 0 0
