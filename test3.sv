module top;
trireg (small) trireg_sm;
trireg (large) trireg_la;
trireg  trireg_me1, trireg_me2;
reg a,b,c,d;
nmos nmos1(trireg_la,c,a);
nmos nmos2(trireg_me1,d,a);
tranif1 tranif1_1(trireg_la, trireg_sm,b);
tranif1 tranif1_2(trireg_me1, trireg_me2,b);
initial begin
a=1'b1;
b=1'b1;
c=1'b1;
d=1'b1;
#10;
b=1'b0;
#10;
c=1'b0;
#10;
d=1'b0;
#10;
a=1'b0;
#10;
b=1'b1;
end
initial begin
#5;
$display("1:%v %v %v %v",trireg_la,trireg_sm,trireg_me1,trireg_me2);
#10;
$display("2:%v %v %v %v",trireg_la,trireg_sm,trireg_me1,trireg_me2);
#10;
$display("3:%v %v %v %v",trireg_la,trireg_sm,trireg_me1,trireg_me2);
#10;
$display("4:%v %v %v %v",trireg_la,trireg_sm,trireg_me1,trireg_me2);
#10;
$display("5:%v %v %v %v",trireg_la,trireg_sm,trireg_me1,trireg_me2);
#10;
$display("6:%v %v %d %d",trireg_la,trireg_sm,trireg_me1,trireg_me2);
end
endmodule