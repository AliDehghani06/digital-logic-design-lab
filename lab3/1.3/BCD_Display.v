module BCD_Display (
    input  [7:0] binary_count,
    output [6:0] seg_ones,
    output [6:0] seg_tens,
    output [6:0] seg_hundreds
);
  wire [3:0] ones, tens, hundreds;

  assign ones = binary_count % 10;
  assign tens = (binary_count / 10) % 10;
  assign hundreds = (binary_count / 100) % 10;

  SevenSegmentDecoder u_ones (
      .hex_in (ones),
      .seg_out(seg_ones)
  );

  SevenSegmentDecoder u_tens (
      .hex_in (tens),
      .seg_out(seg_tens)
  );

  SevenSegmentDecoder u_hundreds (
      .hex_in (hundreds),
      .seg_out(seg_hundreds)
  );

endmodule
