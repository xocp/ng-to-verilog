module AND(
	output OUT,
	input A,
	input B
);

wire NAND_0_OUT;
wire INV_1_OUT;

NAND NAND_0(
	.OUT (NAND_0_OUT),
	.A (A),
	.B (B)
);
	
INV INV_1(
	.OUT (INV_1_OUT),
	.IN (NAND_0_OUT)
);
	
assign OUT = INV_1_OUT;

endmodule
