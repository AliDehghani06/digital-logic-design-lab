`timescale 1ps/1ps

module frequencyDivider_TB();

    wire clk_from_ring;
    reg  rst;
    reg disprst;
    reg  DNclk;
    reg  [7:0] data_in;
    wire [7:0] data_out;
    wire [7:0] dispout;
    wire div_clk_out;
    
    ringOscillator #(.N(3), .TD(2000)) u_ring (
        .out_clk(clk_from_ring)
    );

    frequencyDivider uut (
        .UPclk(clk_from_ring),
        .DNclk(DNclk),
        .disprst(disprst),
        .rst(rst),             
        .in(data_in),   
        .out(data_out),   
        .dispout(dispout), 
        .div_clk(div_clk_out)
    );

    initial begin
        data_in = 8'd142; 
        
        DNclk = 1'b1; 
        
        force u_ring.ring_nodes[0] = 1'b0;
        
        rst = 1'b0; 
        disprst = 1'b1;
        
        #50000;
        
        release u_ring.ring_nodes[0];
        
        #10000;
        rst = 1'b1;
        disprst = 1'b0;

        #50000000; 
        $stop;
    end

endmodule
