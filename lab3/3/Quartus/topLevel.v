module topLevel (
    input wire clk,
    input wire rst,
    input wire clkPB,
    input wire serIn,
    output wire serOutvalid,
    output wire [3:0] count_out,
    output wire serOut
);
  wire clkEn;

  onePulser u_onePulser (
      .clk  (clk),
      .rst  (rst),
      .clkPB(clkPB),
      .clkEn(clkEn)
  );

  serialTransmitter u_transmitter (
      .clk(clk),
      .rst(rst),
      .clkEn(clkEn),
      .serIn(serIn),
      .serOutvalid(serOutvalid),
      .count_out(count_out),
      .serOut(serOut)
  );

endmodule
