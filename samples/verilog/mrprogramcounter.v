module mrprogramcounter(
	output [15:0] PC,
	input ST,
	input [15:0] ADDR,
	input CLK,
	input ENA,
	input RST
);

wire [15:0] COUNTER_0_OUT;
wire AND_1_OUT;
wire [15:0] ZERO16_2_OUT;
wire OR_3_OUT;
wire OR_4_OUT;
wire [15:0] SELECT16_5_OUT;

COUNTER COUNTER_0(
	.OUT (COUNTER_0_OUT),
	.ST (OR_4_OUT),
	.X (SELECT16_5_OUT),
	.CLK (AND_1_OUT)
);
	
AND AND_1(
	.OUT (AND_1_OUT),
	.A (CLK),
	.B (OR_3_OUT)
);
	
ZERO16 ZERO16_2(
	.OUT (ZERO16_2_OUT)
);
	
OR OR_3(
	.OUT (OR_3_OUT),
	.A (ENA),
	.B (RST)
);
	
OR OR_4(
	.OUT (OR_4_OUT),
	.A (ST),
	.B (RST)
);
	
SELECT16 SELECT16_5(
	.OUT (SELECT16_5_OUT),
	.S (RST),
	.D1 (ZERO16_2_OUT),
	.D0 (ADDR)
);
	
assign PC = COUNTER_0_OUT;

endmodule
