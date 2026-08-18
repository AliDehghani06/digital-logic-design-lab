module Function_Generator(
    input clk,
    input rst,
    input init,
    input [4:0] PI,
    input [1:0] AmpSel,
    input [2:0] Sel,
    output [8:0] final_out
);

    wire clk_en_signal;
    wire [8:0] dds_out;
    wire [8:0] waveform_out;

    freq_sel Freq_Unit (
        .clk(clk),
        .rst(rst),
        .PI(PI),
        .init(init),
        .clken(clk_en_signal)
    );

    dds DDS_Unit (
        .clk(clk),
        .clk_en(clk_en_signal),
        .rst(rst),
        .out_dds(dds_out)
    );

    Waveform_Generator Wave_Unit (
        .clk(clk),
        .clk_en(clk_en_signal),
        .rst(rst),
        .Sel(Sel),
        .DDS(dds_out),
        .Wave_out(waveform_out)
    );

    amp_sel Amp_Unit (
        .wave_in(waveform_out),
        .AmpSel(AmpSel),
        .wave_out(final_out)
    );

endmodule