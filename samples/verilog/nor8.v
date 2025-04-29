module nor8(
	output OUT0,
	input IN0,
	input IN1,
	input IN2,
	input IN3,
	input IN4,
	input IN5,
	input IN6,
	input IN7
);

wire INV_0_OUT;
wire OR_1_OUT;
wire OR_2_OUT;
wire OR_3_OUT;
wire OR_4_OUT;
wire OR_5_OUT;
wire OR_6_OUT;
wire OR_7_OUT;

INV INV_0(
	.OUT (INV_0_OUT),
	.IN (OR_7_OUT)
);
	
OR OR_1(
	.OUT (OR_1_OUT),
	.A (IN1),
	.B (OR_2_OUT)
);
	
OR OR_2(
	.OUT (OR_2_OUT),
	.A (IN2),
	.B (OR_3_OUT)
);
	
OR OR_3(
	.OUT (OR_3_OUT),
	.A (IN3),
	.B (OR_4_OUT)
);
	
OR OR_4(
	.OUT (OR_4_OUT),
	.A (IN4),
	.B (OR_5_OUT)
);
	
OR OR_5(
	.OUT (OR_5_OUT),
	.A (IN5),
	.B (OR_6_OUT)
);
	
OR OR_6(
	.OUT (OR_6_OUT),
	.A (IN6),
	.B (IN7)
);
	
OR OR_7(
	.OUT (OR_7_OUT),
	.A (IN0),
	.B (OR_1_OUT)
);
	
assign OUT0 = INV_0_OUT;

endmodule
