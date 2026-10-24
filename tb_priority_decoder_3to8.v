`timescale 1ns / 1ps

module tb_priority_decoder_3to8;

    reg  [7:0] in;
    reg        en;
    wire [2:0] code;
    wire       valid;

    // Instantiate Unit Under Test (UUT)
    priority_decoder_3to8 uut (
        .in(in),
        .en(en),
        .code(code),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t ns | en=%b | in=%b | code=%b (%0d) | valid=%b", 
                 $time, en, in, code, code, valid);

        // Case 1: Disabled state (en = 0)
        en = 1'b0; in = 8'b1111_1111; #10;

        // Case 2: Enabled but no inputs asserted
        en = 1'b1; in = 8'b0000_0000; #10;

        // Case 3: Lowest bit active
        in = 8'b0000_0001; #10;

        // Case 4: Multiple active bits - bit 3 priority over bit 0
        in = 8'b0000_1001; #10;

        // Case 5: Multiple active bits - bit 6 priority over lower bits
        in = 8'b0101_0100; #10;

        // Case 6: Highest priority bit active
        in = 8'b1011_1111; #10;

        // Case 7: Arbitrary intermediate pattern
        in = 8'b0010_1010; #10;

        $finish;
    end

endmodule