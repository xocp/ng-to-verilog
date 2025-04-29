module COUNTER(
	output [15:0] OUT,
	input ST,
	input [15:0] X,
	input CLK
);

wire [15:0] SELECT16_0_OUT;
wire [15:0] INC16_1_OUT;
wire [15:0] DFF16_2_OUT;
wire INV_3_OUT;
wire ZERO_4_OUT;

SELECT16 SELECT16_0(
	.OUT (SELECT16_0_OUT),
	.S (ST),
	.D1 (X),
	.D0 (INC16_1_OUT)
);
	
INC16 INC16_1(
	.OUT (INC16_1_OUT),
	.IN (DFF16_2_OUT)
);
	
DFF16 DFF16_2(
	.OUT (DFF16_2_OUT),
	.ST (INV_3_OUT),
	.X (SELECT16_0_OUT),
	.CLK (CLK)
);
	
INV INV_3(
	.OUT (INV_3_OUT),
	.IN (ZERO_4_OUT)
);
	
ZERO ZERO_4(
	.OUT (ZERO_4_OUT)
);
	
assign OUT = DFF16_2_OUT;

endmodule
