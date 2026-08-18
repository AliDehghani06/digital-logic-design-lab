module freq_sel(
    input clk,
    input rst,
    input [4:0] PI,
    input init,
    output clken
);

reg [8:0] count;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        count <= {PI, 4'b1000};
    end
    else if(init || (count == 9'd511)) begin
        count <= {PI, 4'b1000};
    end
    else begin
        count <= count + 1'b1;
    end
end

assign clken = (count == 9'd511);

endmodule

