`timescale 1ns / 1ps

module onePulserTB();
  reg  clk;
  reg  rst;
  reg  clkPB;
  wire clkEn;

  onePulser inst (
      .clk  (clk),
      .rst  (rst),
      .clkPB(clkPB),
      .clkEn(clkEn)
  );

  always #20 clk = ~clk;

  initial begin
    clk   = 0;
    rst   = 1;
    clkPB = 0;

    #100 rst = 0;

    #50 clkPB = 1;
    #200 clkPB = 0;

    #100 clkPB = 1;
    #150 clkPB = 0;

    #200 $stop;
  end
endmodule
