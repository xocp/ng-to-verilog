module mrarithmeticunit(
	output [15:0] AH_ACC,
	input [15:0] AH_ACC_IN,
	input [15:0] D_IN,
	input O2,
	input O1,
	input O0
);

wire ADDC16_0_C;
wire [15:0] ADDC16_0_S;
wire [15:0] SUB16_1_OUT;
wire [15:0] SELECT16_2_OUT;
wire [15:0] SELECT16_3_OUT;
wire [15:0] ZERO16_4_OUT;
wire [15:0] ZERO16_5_OUT;
wire [15:0] SELECT16_6_OUT;
wire ZERO_7_OUT;

ADDC16 ADDC16_0(
	.C (ADDC16_0_C),
	.S (ADDC16_0_S),
	.A (AH_ACC_IN),
	.B (D_IN),
	.C_IN (ZERO_7_OUT)
);
	
SUB16 SUB16_1(
	.OUT (SUB16_1_OUT),
	.A (AH_ACC_IN),
	.B (D_IN)
);
	
SELECT16 SELECT16_2(
	.OUT (SELECT16_2_OUT),
	.S (O0),
	.D1 (ZERO16_5_OUT),
	.D0 (ZERO16_4_OUT)
);
	
SELECT16 SELECT16_3(
	.OUT (SELECT16_3_OUT),
	.S (O0),
	.D1 (SUB16_1_OUT),
	.D0 (ADDC16_0_S)
);
	
ZERO16 ZERO16_4(
	.OUT (ZERO16_4_OUT)
);
	
ZERO16 ZERO16_5(
	.OUT (ZERO16_5_OUT)
);
	
SELECT16 SELECT16_6(
	.OUT (SELECT16_6_OUT),
	.S (O1),
	.D1 (SELECT16_2_OUT),
	.D0 (SELECT16_3_OUT)
);
	
ZERO ZERO_7(
	.OUT (ZERO_7_OUT)
);
	
assign AH_ACC = SELECT16_6_OUT;

endmodule
