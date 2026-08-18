module onePulser ( input clk, input rst, input clkPB, output clkEn);
    reg q0, q1, q2;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q0 <= 1'b0;
            q1 <= 1'b0;
            q2 <= 1'b0;
        end else begin
            q0 <= clkPB;
            q1 <= q0;
            q2 <= q1;
        end
    end
    assign clkEn = q1 & ~q2;
endmodule
