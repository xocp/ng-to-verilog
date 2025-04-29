`timescale 10ns / 10ns

module mrcomputer_tb(
    input CLK100MHZ,
    output [0:3] led,
    output led0_r,
    output led0_g,
    output led0_b,
    output led1_r,
    output led1_g,
    output led1_b
);

wire clk_1hz;
wire [15:0] mrcomputer_0_OUT0;
wire mrcomputer_0_OUT1;
reg RST;
reg [3:0] reset_count;

// Uncomment for behavioral simulation
reg CLK;
initial CLK = 0;
always #1000 CLK <= ~CLK;
assign clk_1hz = CLK;

// Uncomment for synthesis
//  reg [25:0] count = 0;
//  always @ (posedge(CLK100MHZ)) count <= count + 1;    
//  BUFG BUFG_inst(
//      .O(clk_1hz),    // 1-bit output: Buffer
//      .I(count[24])     // 1-bit input: Buffer
//  );

mrcomputer mrcomputer_0(
	.OUT0 (mrcomputer_0_OUT0),
	.OUT1 (mrcomputer_0_OUT1),
	.CLK (clk_1hz),
	.RST (RST)
);

assign led[0] = mrcomputer_0_OUT0[0];
assign led[1] = mrcomputer_0_OUT0[1];
assign led[2] = mrcomputer_0_OUT0[2];
assign led[3] = mrcomputer_0_OUT0[3];
assign led0_r = 0;
assign led0_g = mrcomputer_0_OUT0[4];
assign led0_b = clk_1hz;
assign led1_r = 0;
assign led1_g = mrcomputer_0_OUT0[5];
assign led1_b = RST;

initial begin
	$dumpfile("mrcomputer_tb.vcd");
	$dumpvars(0, mrcomputer_tb);
	
	// TODO: adjust any reg (input) values here	
	reset_count = 0;
	RST = 1;
	
	#1000000 
	
	$display("Test complete");
	$finish;
end

always @(posedge clk_1hz) begin
    if(RST == 1) begin
        if(reset_count<6) reset_count = reset_count + 1;
        else RST = 0;
    end
end

endmodule
