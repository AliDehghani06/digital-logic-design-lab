module counter9 (
    input            clk,
    input            clkEn,
    input            rst,
    input            en,
    input            rst_cnt,
    output reg [3:0] count,
    output           co
);
  always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'd0;
    else if (clkEn) begin
      if (rst_cnt)
        count <= 4'd0;
      else if (en) begin
        if (count == 4'd8) count <= 4'd0;
        else count <= count + 1'b1;
      end
    end
  end
  assign co = (count == 4'd8) & en;
endmodule

module sequenceDetector (
    input clk,
    input rst,
    input clkEn,
    input serIn,
    input co,
    output reg rst_cnt,
    output reg countEn,
    output reg serOutvalid
);
  parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
  reg [2:0] state, next_state;

  always @(posedge clk or posedge rst) begin
    if (rst) state <= S0;
    else if (clkEn) state <= next_state;
  end

  always @(*) begin
    next_state = state;
    countEn = 0;
    rst_cnt = 0;
    serOutvalid = 0;

    case (state)
      S0:
      if (serIn) next_state = S1;
      else next_state = S0;
      S1:
      if (~serIn) next_state = S2;
      else next_state = S1;
      S2:
      if (~serIn) next_state = S3;
      else next_state = S1;
      S3:
      if (serIn) begin
        next_state = S4;
        rst_cnt = 1;
      end else next_state = S0;
      S4: begin
        countEn = 1;
        serOutvalid = 1;
        if (co) next_state = S0;
        else next_state = S4;
      end
      default: next_state = S0;
    endcase
  end
endmodule

module serialTransmitter (
    input clk,
    input rst,
    input clkEn,
    input serIn,
    output serOutvalid,
    output [3:0] count_out,
    output serOut
);
  wire co, countEn, rst_cnt;

  counter9 counter_inst (
      .clk(clk),
      .clkEn(clkEn),
      .rst(rst),
      .en(countEn),
      .rst_cnt(rst_cnt),
      .count(count_out),
      .co(co)
  );

  sequenceDetector seqDetect_inst (
      .clk(clk),
      .rst(rst),
      .clkEn(clkEn),
      .serIn(serIn),
      .co(co),
      .rst_cnt(rst_cnt),
      .countEn(countEn),
      .serOutvalid(serOutvalid)
  );

  assign serOut = serOutvalid ? serIn : 1'b0;

endmodule
