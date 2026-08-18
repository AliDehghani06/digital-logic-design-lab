`timescale 1ns/1ps

module tb_freq_sel();

reg clk;
reg rst;
reg init;
reg [4:0] PI;

wire clken;

freq_sel u_freq_sel(
    .clk(clk),
    .rst(rst),
    .PI(PI),
    .init(init),
    .clken(clken)
);

always #10 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    init = 0;
    PI = 5'd0;

    #50;
    rst = 0;

    PI = 5'd4;
    init = 1;
    #20;
    init = 0;

    #10000;

    PI = 5'd17;
    init = 1;
    #20;
    init = 0;

    #10000;

    PI = 5'd25;
    init = 1;
    #20;
    init = 0;

    #10000;

    $stop;
end

endmodule