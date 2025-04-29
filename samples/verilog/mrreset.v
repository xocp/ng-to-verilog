module mrreset(
	output RST,
	input RST_IN,
	input CLK
);

wire OR_0_OUT;
wire OR_1_OUT;
wire OR_2_OUT;
wire DFF_3_OUT;
wire DFF_4_OUT;
wire DFF_5_OUT;
wire ZERO_6_OUT;
wire INV_7_OUT;

OR OR_0(
	.OUT (OR_0_OUT),
	.A (OR_1_OUT),
	.B (DFF_3_OUT)
);
	
OR OR_1(
	.OUT (OR_1_OUT),
	.A (OR_2_OUT),
	.B (DFF_4_OUT)
);
	
OR OR_2(
	.OUT (OR_2_OUT),
	.A (RST_IN),
	.B (DFF_5_OUT)
);
	
DFF DFF_3(
	.OUT (DFF_3_OUT),
	.ST (INV_7_OUT),
	.D (DFF_4_OUT),
	.CLK (CLK)
);
	
DFF DFF_4(
	.OUT (DFF_4_OUT),
	.ST (INV_7_OUT),
	.D (DFF_5_OUT),
	.CLK (CLK)
);
	
DFF DFF_5(
	.OUT (DFF_5_OUT),
	.ST (INV_7_OUT),
	.D (RST_IN),
	.CLK (CLK)
);
	
ZERO ZERO_6(
	.OUT (ZERO_6_OUT)
);
	
INV INV_7(
	.OUT (INV_7_OUT),
	.IN (ZERO_6_OUT)
);
	
assign RST = OR_0_OUT;

endmodule
