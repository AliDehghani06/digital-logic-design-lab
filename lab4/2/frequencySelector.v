module freq_sel(
    input clk,
    input rst,
    input [4:0] PI,
    input init,
    output clken
);

reg [8:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst)
        count <= {PI,4'b1000};

    else if(init || clken)
        count <= {PI,4'b1000};

    else
        count <= count + 1'b1;
end

assign clken = (count == 9'b111111111);

endmodule