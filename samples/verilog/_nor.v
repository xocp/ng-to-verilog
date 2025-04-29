module _nor(
	output OUT0,
	input A,
	input B
);

wire OR_0_OUT;
wire INV_1_OUT;

OR OR_0(
	.OUT (OR_0_OUT),
	.A (A),
	.B (B)
);
	
INV INV_1(
	.OUT (INV_1_OUT),
	.IN (OR_0_OUT)
);
	
assign OUT0 = INV_1_OUT;

endmodule
