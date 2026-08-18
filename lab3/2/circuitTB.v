`timescale 1ns / 1ps

module circuitTB();
reg  clk;
reg  rst;
reg  clkPB;
reg  serIn;
wire clkEn;
wire serOut;
wire serOutvalid;
wire [3:0] count_out;

onePulser u_onePulser (
    .clk  (clk),
    .rst  (rst),
    .clkPB(clkPB),
    .clkEn(clkEn)
);

serialTransmitter uut (
    .clk(clk),
    .rst(rst),
    .clkEn(clkEn),
    .serIn(serIn),
    .serOutvalid(serOutvalid),
    .count_out(count_out),
    .serOut(serOut)
);

    always #25 clk = ~clk;

    always begin
        #150 clkPB = 1;
        #150 clkPB = 0;
    end

    initial begin
        clk   = 0;
        rst   = 1;
        clkPB = 0;
        serIn = 0;

        #75 rst = 0;

        @(posedge clkEn) serIn = 1;
        @(posedge clkEn) serIn = 0;
        @(posedge clkEn) serIn = 0;
        @(posedge clkEn) serIn = 1;

        repeat (9) begin
            @(posedge clkEn) serIn = $urandom;
        end

        @(posedge clkEn) serIn = 0;
        @(posedge clkEn) serIn = 1;
        @(posedge clkEn) serIn = 0;
        @(posedge clkEn) serIn = 0;
        @(posedge clkEn) serIn = 1;

        repeat (10) begin
            @(posedge clkEn) serIn = $urandom;
        end

        #200 $stop;
    end

endmodule
