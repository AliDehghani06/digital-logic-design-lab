`timescale 1ns / 1ps

module topLevelTB();

  reg clk;
  reg rst;
  reg clkPB;
  reg serIn;

  wire serOutvalid;
  wire [3:0] count_out;
  wire serOut;

  topLevel uut (
      .clk(clk),
      .rst(rst),
      .clkPB(clkPB),
      .serIn(serIn),
      .serOutvalid(serOutvalid),
      .count_out(count_out),
      .serOut(serOut)
  );

  always #25 clk = ~clk;

  task send_bit;
    input val;
    begin
      serIn = val;
      #50;
      clkPB = 1;
      #150;
      clkPB = 0;
      #150;
    end
  endtask

  initial begin
    clk   = 0;
    rst   = 1;
    clkPB = 0;
    serIn = 0;

    #100 rst = 0;
    #50;

    send_bit(1);
    send_bit(0);
    send_bit(0);
    send_bit(1);

    repeat (9) begin
      send_bit($urandom % 2);
    end

    send_bit(0);
    send_bit(1);
    send_bit(0);
    send_bit(0);
    send_bit(1);

    repeat (10) begin
      send_bit($urandom % 2);
    end

    #500 $stop;
  end

endmodule
