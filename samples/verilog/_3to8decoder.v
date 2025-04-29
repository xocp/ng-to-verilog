module _3to8decoder(
	output OUT7,
	output OUT6,
	output OUT5,
	output OUT4,
	output OUT3,
	output OUT2,
	output OUT1,
	output OUT0,
	input D2,
	input D1,
	input D0
);

wire AND_0_OUT;
wire AND_1_OUT;
wire AND_2_OUT;
wire AND_3_OUT;
wire INV_4_OUT;
wire AND_5_OUT;
wire AND_6_OUT;
wire AND_7_OUT;
wire AND_8_OUT;
wire _2to4decoder_9_OUT3;
wire _2to4decoder_9_OUT2;
wire _2to4decoder_9_OUT1;
wire _2to4decoder_9_OUT0;

AND AND_0(
	.OUT (AND_0_OUT),
	.A (INV_4_OUT),
	.B (_2to4decoder_9_OUT0)
);
	
AND AND_1(
	.OUT (AND_1_OUT),
	.A (INV_4_OUT),
	.B (_2to4decoder_9_OUT2)
);
	
AND AND_2(
	.OUT (AND_2_OUT),
	.A (INV_4_OUT),
	.B (_2to4decoder_9_OUT3)
);
	
AND AND_3(
	.OUT (AND_3_OUT),
	.A (INV_4_OUT),
	.B (_2to4decoder_9_OUT1)
);
	
INV INV_4(
	.OUT (INV_4_OUT),
	.IN (D2)
);
	
AND AND_5(
	.OUT (AND_5_OUT),
	.A (D2),
	.B (_2to4decoder_9_OUT3)
);
	
AND AND_6(
	.OUT (AND_6_OUT),
	.A (D2),
	.B (_2to4decoder_9_OUT2)
);
	
AND AND_7(
	.OUT (AND_7_OUT),
	.A (D2),
	.B (_2to4decoder_9_OUT1)
);
	
AND AND_8(
	.OUT (AND_8_OUT),
	.A (D2),
	.B (_2to4decoder_9_OUT0)
);
	
_2to4decoder _2to4decoder_9(
	.OUT3 (_2to4decoder_9_OUT3),
	.OUT2 (_2to4decoder_9_OUT2),
	.OUT1 (_2to4decoder_9_OUT1),
	.OUT0 (_2to4decoder_9_OUT0),
	.D1 (D1),
	.D0 (D0)
);
	
assign OUT7 = AND_5_OUT;
assign OUT6 = AND_6_OUT;
assign OUT5 = AND_7_OUT;
assign OUT4 = AND_8_OUT;
assign OUT3 = AND_2_OUT;
assign OUT2 = AND_1_OUT;
assign OUT1 = AND_3_OUT;
assign OUT0 = AND_0_OUT;

endmodule
