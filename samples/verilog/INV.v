module INV(
	output OUT,
	input IN
);

wire NAND_0_OUT;

NAND NAND_0(
	.OUT (NAND_0_OUT),
	.A (IN),
	.B (IN)
);
	
assign OUT = NAND_0_OUT;

endmodule
