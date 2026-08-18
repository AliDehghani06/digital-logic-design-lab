`timescale 1ps / 1ps

module ringOscillator #(
    parameter N = 3,
    parameter TD = 107
)(
    output wire out_clk
);

    wire [N:0] ring_nodes;

    assign ring_nodes[0] = ring_nodes[N];
    assign out_clk = ring_nodes[N];

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : inverters
            assign #TD ring_nodes[i+1] = ~ring_nodes[i];
        end
    endgenerate

endmodule
