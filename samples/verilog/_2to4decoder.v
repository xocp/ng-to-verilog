module _2to4decoder(
	output OUT3,
	output OUT2,
	output OUT1,
	output OUT0,
	input D1,
	input D0
);

wire INV_0_OUT;
wire INV_1_OUT;
wire AND_2_OUT;
wire AND_3_OUT;
wire AND_4_OUT;
wire AND_5_OUT;

INV INV_0(
	.OUT (INV_0_OUT),
	.IN (D0)
);
	
INV INV_1(
	.OUT (INV_1_OUT),
	.IN (D1)
);
	
AND AND_2(
	.OUT (AND_2_OUT),
	.A (INV_1_OUT),
	.B (INV_0_OUT)
);
	
AND AND_3(
	.OUT (AND_3_OUT),
	.A (INV_1_OUT),
	.B (D0)
);
	
AND AND_4(
	.OUT (AND_4_OUT),
	.A (D1),
	.B (INV_0_OUT)
);
	
AND AND_5(
	.OUT (AND_5_OUT),
	.A (D1),
	.B (D0)
);
	
assign OUT3 = AND_5_OUT;
assign OUT2 = AND_4_OUT;
assign OUT1 = AND_3_OUT;
assign OUT0 = AND_2_OUT;

endmodule
