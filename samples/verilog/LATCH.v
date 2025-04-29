module LATCH(
	output OUT,
	input ST,
	input D
);

wire INV_0_OUT;
wire AND_1_OUT;
wire AND_2_OUT;
wire NAND_3_OUT;
wire NAND_4_OUT;
wire INV_5_OUT;
wire INV_6_OUT;

INV INV_0(
	.OUT (INV_0_OUT),
	.IN (AND_1_OUT)
);
	
AND AND_1(
	.OUT (AND_1_OUT),
	.A (ST),
	.B (D)
);
	
AND AND_2(
	.OUT (AND_2_OUT),
	.A (ST),
	.B (INV_0_OUT)
);
	
NAND NAND_3(
	.OUT (NAND_3_OUT),
	.A (INV_5_OUT),
	.B (NAND_4_OUT)
);
	
NAND NAND_4(
	.OUT (NAND_4_OUT),
	.A (NAND_3_OUT),
	.B (INV_6_OUT)
);
	
INV INV_5(
	.OUT (INV_5_OUT),
	.IN (AND_1_OUT)
);
	
INV INV_6(
	.OUT (INV_6_OUT),
	.IN (AND_2_OUT)
);
	
assign OUT = NAND_3_OUT;

endmodule
