`timescale 1ps/1ps

module tb;
    reg clk, E, TE;
    test inst(.Q(), .CK(clk), .E(E), .TE(TE));
    initial begin 
        $sdf_annotate("./1.sdf", inst, , , "MINIMUM", , );
    end
    initial begin 
        E = 1'bx;
        TE = 1'bx;
        clk = 1'bx;
        #200;
        E = 1'b1;
        TE = 1'b1;
        #900;
        clk = 1'b0;
        #900;
        
        E = 1'b1;
        TE = 1'b1;
        #26;
        clk = 1'b0;
        #900;

        E = 1'bx;
        TE = 1'bx;
        #26;
        clk = 1'bx;
        #900;

        E = 1'b1;
        TE = 1'b1;
        #26;
        clk = 1'b0;
        #1900;

        E = 1'bx;
        TE = 1'bx;
        #26;
        clk = 1'bx;
        #900;

        E = 1'b1;
        TE = 1'b1;
        #26;
        clk = 1'b0;
        #1900;

        E = 1'bx;
        TE = 1'bx;
        #26;
        clk = 1'bx;
        #900;

        E = 1'b1;
        TE = 1'b1;
        #26;
        clk = 1'b0;
        #1900;

        E = 1'bx;
        TE = 1'bx;
        #26;
        clk = 1'bx;
        #900;

        E = 1'b1;
        TE = 1'b1;
        #26;
        clk = 1'b0;
        #1900;

        #50000;
        $finish;
    end
endmodule

module test(Q, CK, E, TE);
    input CK, E, TE;
    output Q;
    // reg notifier;

    specify 
        $setuphold(posedge CK &&& TE == 1'b0, negedge E &&& TE == 1'b0, 0, 0);
        $setuphold(posedge CK &&& E == 1'b0, negedge TE &&& E == 1'b0, 0, 0);
    endspecify

endmodule
