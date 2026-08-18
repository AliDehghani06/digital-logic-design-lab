`timescale 1ns/1ps

module TB_Function_Generator_Full;

    reg clk, rst, init;
    reg [4:0] PI;
    reg [1:0] AmpSel;
    reg [2:0] Sel;
    wire [8:0] final_out;

    Function_Generator uut (
        .clk(clk),
        .rst(rst),
        .init(init),
        .PI(PI),
        .AmpSel(AmpSel),
        .Sel(Sel),
        .final_out(final_out)
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