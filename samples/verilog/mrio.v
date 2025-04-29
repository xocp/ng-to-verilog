module mrio(
	output [15:0] D_OUT,
	input [15:0] D_IN,
	input [15:0] ADDR,
	input STO
);

wire [15:0] ZERO16_0_OUT;

ZERO16 ZERO16_0(
	.OUT (ZERO16_0_OUT)
);
	
assign D_OUT = ZERO16_0_OUT;

endmodule
