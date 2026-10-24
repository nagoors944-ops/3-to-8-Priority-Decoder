`timescale 1ns / 1ps

// 8-Input, 3-Bit Active-High Priority Encoder / Decoder Logic
// High-order bit in[7] holds the highest priority.
// 'valid' indicates whether any input bit is asserted.
module priority_decoder_3to8 (
    input  wire [7:0] in,
    input  wire       en,
    output reg  [2:0] code,
    output reg        valid
);

    always @(*) begin
        // Hazard mitigation: default assignment prevents unintended latches
        code  = 3'b000;
        valid = 1'b0;

        if (en) begin
            if (in[7]) begin
                code  = 3'b111;
                valid = 1'b1;
            end else if (in[6]) begin
                code  = 3'b110;
                valid = 1'b1;
            end else if (in[5]) begin
                code  = 3'b101;
                valid = 1'b1;
            end else if (in[4]) begin
                code  = 3'b100;
                valid = 1'b1;
            end else if (in[3]) begin
                code  = 3'b011;
                valid = 1'b1;
            end else if (in[2]) begin
                code  = 3'b010;
                valid = 1'b1;
            end else if (in[1]) begin
                code  = 3'b001;
                valid = 1'b1;
            end else if (in[0]) begin
                code  = 3'b000;
                valid = 1'b1;
            end else begin
                code  = 3'b000;
                valid = 1'b0;
            end
        end
    end

endmodule