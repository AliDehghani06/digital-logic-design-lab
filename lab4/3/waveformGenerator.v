module Waveform_Generator (
    input clk,
    input clk_en,
    input rst,
    input [2:0] Sel,
    input [8:0] DDS,
    output reg [8:0] Wave_out
);

    reg [7:0] count; 
    
    reg [8:0] OutRec, OutSquare, OutTri;
    reg [8:0] half, full;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 8'd0;
        else if (clk_en)
            count <= count + 8'd1;
    end

    always @(posedge clk) begin
        if (clk_en) begin
            if (count == 8'd255)
                OutRec <= 9'd255;
            else
                OutRec <= 9'd255 / (9'd255 - count);
        end
    end

    always @(posedge clk) begin
        if (clk_en) begin
            if (count < 8'd128)
                OutSquare <= 9'd0;
            else
                OutSquare <= 9'd255;
        end
    end

    always @(posedge clk) begin
        if (clk_en) begin
            if (count < 8'd128)
                OutTri <= {1'b0, count} << 1;   
            else
                OutTri <= 9'd511 - ({1'b0, count} << 1);
        end
    end

    always @(posedge clk) begin
        if (clk_en) begin
            if (DDS < 9'd128)
                full <= 9'd256 - DDS; 
            else
                full <= DDS;
        end
    end

    always @(posedge clk) begin
        if (clk_en) begin
            if (DDS < 9'd128)
                half <= 9'd128; 
            else
                half <= DDS;
        end
    end

    always @(*) begin
        case (Sel)
            3'b000: Wave_out = OutRec;
            3'b001: Wave_out = OutSquare;
            3'b010: Wave_out = OutTri;
            3'b011: Wave_out = DDS;
            3'b100: Wave_out = full;
            3'b101: Wave_out = half;
            default: Wave_out = 9'd128;
        endcase
    end

endmodule