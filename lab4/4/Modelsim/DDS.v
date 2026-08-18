module sine_rom (
    input [5:0] addr,
    output reg [7:0] magnitude
);

reg [7:0] LUT [0:63];

initial begin
    $readmemb("sine.mem", LUT); 
end

always @(*) begin
    magnitude = LUT[addr];
end

endmodule

module datapath_ph (
    input clk,
    input clk_en,
    input rst,
    output reg [7:0] phase,
    output co
);

always @(posedge clk or posedge rst) begin
    if (rst)
        phase <= 8'd0;
    else if (clk_en)
        phase <= phase + 8'd1;
end

assign co = (phase == 8'd255);

endmodule

module controller_ph (
    input [7:0] phase,
    output sign_bit,
    output [5:0] rom_addr,
    output is_peak
);

wire phase_pos;

assign sign_bit  = phase[7];
assign phase_pos = phase[6];

assign rom_addr = phase_pos ? (~phase[5:0]) : phase[5:0];

assign is_peak = phase_pos & (phase[5:0] == 6'b000000);

endmodule

module dds (
    input clk,
    input clk_en,
    input rst,
    output [8:0] out_dds
);

wire [7:0] phase;
wire sign_bit;
wire [5:0] rom_addr;
wire is_peak;
wire [7:0] magnitude;

datapath_ph dp (
    .clk(clk),
    .clk_en(clk_en),
    .rst(rst),
    .phase(phase),
    .co()
);

controller_ph ctrl (
    .phase(phase),
    .sign_bit(sign_bit),
    .rom_addr(rom_addr),
    .is_peak(is_peak)
);

sine_rom rom (
    .addr(rom_addr),
    .magnitude(magnitude)
);

wire [8:0] pos_val = is_peak ? 9'd255 : {1'b0, magnitude};

assign out_dds = sign_bit ? (9'd256 - pos_val) : pos_val;

endmodule