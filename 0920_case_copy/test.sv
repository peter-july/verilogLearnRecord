`timescale 1ps/1fs
module test;
    reg RDN, CKN;
    initial begin
        #118485000fs;
        CKN = 0;
        #22000fs;
        RDN = 1;
        #5ns;
    end
    S dut(.RDN(RDN), .CKN(CKN));
    initial begin 
        $sdf_annotate("./test.sdf", test, , , "MINIMUM","1.0:1.0:1.0", "FROM_MINIMUM");
    end
endmodule

module S(D, RDN, SE, SI, CKN, Q);
    input D, RDN, SE, SI, CKN;
    output Q;
    reg N;
    wire a0, a1, a2;
    wire a3, a4, a5;
    wire a6, a7, a8, a9;

    specify 
        $setuphold(negedge CKN &&& a0, posedge D &&& a0, 0, 0, N);
        $setuphold(negedge CKN &&& a0, negedge D &&& a0, 0, 0, N);
        $setuphold(negedge CKN &&& a1, posedge D &&& a1, 0, 0, N);
        $setuphold(negedge CKN &&& a1, negedge D &&& a1, 0, 0, N);
        $setuphold(negedge CKN, posedge D, 0, 0, N);
        $setuphold(negedge CKN, negedge D, 0, 0, N);

        $recrem(posedge RDN &&& a6, negedge CKN &&& a6, 0, 0, N);
        $recrem(posedge RDN &&& a7, negedge CKN &&& a7, 0, 0, N);
        $recrem(posedge RDN &&& a8, negedge CKN &&& a8, 0, 0, N);
        $recrem(posedge RDN &&& a9, negedge CKN &&& a9, 0, 0, N);
        $recrem(posedge RDN, negedge CKN, 0, 0, N);

        $setuphold(negedge CKN &&& a3, posedge SE &&& a3, 0, 0, N);
        $setuphold(negedge CKN &&& a3, negedge SE &&& a3, 0, 0, N);
        $setuphold(negedge CKN &&& a2, posedge SE &&& a2, 0, 0, N);
        $setuphold(negedge CKN &&& a2, negedge SE &&& a2, 0, 0, N);
        $setuphold(negedge CKN, posedge SE, 0, 0, N);
        $setuphold(negedge CKN, negedge SE, 0, 0, N);

        $setuphold(negedge CKN &&& a4, posedge SI &&& a4, 0, 0, N);
        $setuphold(negedge CKN &&& a4, negedge SI &&& a4, 0, 0, N);
        $setuphold(negedge CKN &&& a5, posedge SI &&& a5, 0, 0, N);
        $setuphold(negedge CKN &&& a5, negedge SI &&& a5, 0, 0, N);
        $setuphold(negedge CKN, posedge SI, 0, 0, N);
        $setuphold(negedge CKN, negedge SI, 0, 0, N);
    endspecify
endmodule
