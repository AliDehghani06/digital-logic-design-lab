module amp_sel(
    input [8:0] wave_in,
    input [1:0] AmpSel,
    output reg [8:0] wave_out
);

    always @(*) begin
        case (AmpSel)
            2'b00: wave_out = wave_in;
            2'b01: wave_out = wave_in >> 1;
            2'b10: wave_out = wave_in >> 2;
            2'b11: wave_out = wave_in >> 3;
            default: wave_out = wave_in;
        endcase
    end

endmodule