`timescale 1ns / 1ps

module serialTransmitterTB();
  reg  clk;
  reg  rst;
  reg  clkEn;
  reg  serIn;
  wire serOutvalid;
  wire [3:0] count_out;
  wire serOut;


  serialTransmitter uut (
      .clk(clk),
      .rst(rst),
      .clkEn(clkEn),
      .serIn(serIn),
      .serOutvalid(serOutvalid),
      .count_out(count_out),
      .serOut(serOut)
  );

  always #10 clk = ~clk;

  always begin
    #20 clkEn = 1;
    #20 clkEn = 0;
  end

  initial begin
    clk   = 0;
    rst   = 1;
    clkEn = 0;
    serIn = 0;
    #25 rst = 0;

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
