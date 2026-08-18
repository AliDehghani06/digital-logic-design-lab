`timescale 1ns / 1ns

module ringOscillator_TB();

    parameter N_INV = 3;
    parameter DELAY_NS = 107;

    wire clk_out;

    ringOscillator #(
        .N(N_INV),
        .TD(DELAY_NS)
    ) UUT (
        .out_clk(clk_out)
    );

    initial begin
        // Kickstart the oscillator to break the unknown 'X' state
        force UUT.ring_nodes[0] = 1'b0;
        #400; 
        release UUT.ring_nodes[0];

        #5000; 
        $stop;
    end

endmodule
