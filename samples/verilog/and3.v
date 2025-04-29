module and3(
	output OUT0,
	input IN0,
	input IN1,
	input IN2
);

wire AND_0_OUT;
wire AND_1_OUT;

AND AND_0(
	.OUT (AND_0_OUT),
	.A (IN0),
	.B (IN1)
);
	
AND AND_1(
	.OUT (AND_1_OUT),
	.A (AND_0_OUT),
	.B (IN2)
);
	
assign OUT0 = AND_1_OUT;

endmodule
