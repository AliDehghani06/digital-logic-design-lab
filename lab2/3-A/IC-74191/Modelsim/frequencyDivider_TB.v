`timescale 1ps/1ps

module frequencyDivider_TB();

    wire clk_from_ring;
    reg  rst;
    reg  [7:0] data_in;
    wire [7:0] data_out;
    wire div_clk_out;
    

    ringOscillator #(.N(3), .TD(107)) u_ring (
        .out_clk(clk_from_ring)
    );

    frequencyDivider uut (
        .clk(clk_from_ring),
        .rst(rst),
        .in(data_in),   
        .out(data_out),    
        .div_clk(div_clk_out)
    );

    initial begin
        data_in = 8'd142; 
        
        force u_ring.ring_nodes[0] = 1'b0;
        rst = 1'b0; 
        
        #400; 
        
        release u_ring.ring_nodes[0];
        
        #100;
        rst = 1'b1;

        #250000; 
        $stop;
    end

endmodule

