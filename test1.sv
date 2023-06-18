`timescale 10ns/1ns
package p;
        int a=1;
        integer d=1;
        parameter time c=1;
        localparam real b=1.1;
endpackage

module test();
        import p::*;
        wire io1=1'b0;
        wire io2=1'b1;
        wire io3=1'b0;
        wire io4=1'b1;
        wire io5=1'b0;
        wire io6=1'b1;
        wire io7=1'bx;
        wire io8=1'bz;
        wire io9=1'b0;
        wire io10=1'b1;
        wire io11=1'b0;
        wire io12;
        wire io13=1'b0;
        wire io14=1'b1;
        wire io15=1'b1;
        wire io16=1'b0;
        tranif0 #p::a(io1,io2,1'b0);
        tranif0 #p::b(io3,io4,1'b1);
        tranif0 #p::c(io5,io6,1'bx);
        tranif0 #p::d(io7,io8,1'bz);
        rtranif0 #a(io9, io10,1'b0);
        rtranif0 #b(io11,io12,1'b1);
        rtranif0 #c(io13,io14,1'b0);
        rtranif0 #d(io15,io16,1'b1);
        initial begin
                #0;
                $display("io1=%0b,io2=%0b",io1,io2);
                $display("io3=%0b,io4=%0b",io3,io4);
                $display("io5=%0b,io6=%0b",io5,io6);
                $display("io7=%0b,io8=%0b",io7,io8);
                $display("io9=%0b,io10=%0b",io9,io10);
                $display("io11=%0b,io12=%0b",io11,io12);
                $display("io13=%0b,io14=%0b",io13,io14);
                $display("io15=%0b,io16=%0b",io15,io16);
                #2;
                $display("io1=%0b,io2=%0b",io1,io2);
                $display("io3=%0b,io4=%0b",io3,io4);
                $display("io5=%0b,io6=%0b",io5,io6);
                $display("io7=%0b,io8=%0b",io7,io8);
                $display("io9=%0b,io10=%0b",io9,io10);
                $display("io11=%0b,io12=%0b",io11,io12);
                $display("io13=%0b,io14=%0b",io13,io14);
                $display("io15=%0b,io16=%0b",io15,io16);
        end
endmodule