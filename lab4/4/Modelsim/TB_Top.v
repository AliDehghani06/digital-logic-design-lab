`timescale 1ns/1ps

module TB_top();

    reg clk, rst, init;
    reg [4:0] PI;
    reg [1:0] AmpSel;
    reg [2:0] Sel;
    
    wire [8:0] final_out;
    
    wire clken_wire;
    wire [8:0] dds_wire;

    Top uut_top (
        .clken(clken_wire),
        .clk(clk),
        .rst(rst),
        .init(init),
        .PI(PI),
        .AmpWave(final_out),
        .AmpSel(AmpSel),
        .DDS(dds_wire),
        .sel(Sel)
    );

    dds uut_dds (
        .clk(clk),
        .clk_en(clken_wire),
        .rst(rst),
        .out_dds(dds_wire)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0; rst = 1; init = 0;
        PI = 5'b11111; 
        Sel = 3'b010;
        AmpSel = 2'b00;
        
        #100 rst = 0;
        
        #40000 AmpSel = 2'b01;
        #40000 AmpSel = 2'b10;
        #40000 AmpSel = 2'b11;
        
        #40000 PI = 5'b11110;
        AmpSel = 2'b01;
        
        #400000 $stop;
    end

endmodule