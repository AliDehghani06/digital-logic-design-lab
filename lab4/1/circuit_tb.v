`timescale 1ns/1ps

module TB_Function_Generator();

    reg clk;
    reg clk_en;
    reg rst;
    reg [2:0] Sel;
    
    wire [8:0] dds_signal;
    wire [8:0] final_wave;

    dds u_dds (
        .clk(clk),
        .clk_en(clk_en),
        .rst(rst),
        .out_dds(dds_signal)
    );

    Waveform_Generator u_wg (
        .clk(clk),
        .clk_en(clk_en),
        .rst(rst),
        .Sel(Sel),
        .DDS(dds_signal),
        .Wave_out(final_wave)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        clk_en = 1;
        rst = 1;
        Sel = 3'b000;
        
        #55 rst = 0;

        Sel = 3'b000; #25600;
        
        Sel = 3'b001; #25600;
        
        Sel = 3'b010; #25600;
        
        Sel = 3'b011; #25600;
        
        Sel = 3'b100; #25600;
        
        Sel = 3'b101; #25600;
        
        $stop;
    end

endmodule