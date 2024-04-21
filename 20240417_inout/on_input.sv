module top;
    reg I;
    wire O;

    submod I0(O, I);
    initial begin
        $monitor($realtime,,O,,I,,I0.I);
        I = 0;
        #2;
        I = 1;
        #2;
        I = 0;
    end
endmodule

module submod (O,I);
    output O;
    input I;
    
    assign O = I;
    specify
        (O => I) = (3);
    endspecify
endmodule

// A-tool
// 0 x 0 x
// 2 x 1 x
// 3 1 1 1
// 4 1 0 1
// 6 0 0 0
