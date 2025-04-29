module nor3(
	output OUT0,
	input IN0,
	input IN1,
	input IN2
);

wire OR_0_OUT;
wire OR_1_OUT;
wire INV_2_OUT;

OR OR_0(
	.OUT (OR_0_OUT),
	.A (IN0),
	.B (IN1)
);
	
OR OR_1(
	.OUT (OR_1_OUT),
	.A (OR_0_OUT),
	.B (IN2)
);
	
INV INV_2(
	.OUT (INV_2_OUT),
	.IN (OR_1_OUT)
);
	
assign OUT0 = INV_2_OUT;

endmodule
