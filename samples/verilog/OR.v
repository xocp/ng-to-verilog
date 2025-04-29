module OR(
	output OUT,
	input A,
	input B
);

wire NAND_0_OUT;
wire NAND_1_OUT;
wire NAND_2_OUT;

NAND NAND_0(
	.OUT (NAND_0_OUT),
	.A (B),
	.B (B)
);
	
NAND NAND_1(
	.OUT (NAND_1_OUT),
	.A (A),
	.B (A)
);
	
NAND NAND_2(
	.OUT (NAND_2_OUT),
	.A (NAND_1_OUT),
	.B (NAND_0_OUT)
);
	
assign OUT = NAND_2_OUT;

endmodule
