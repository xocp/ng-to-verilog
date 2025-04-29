module mralu(
	output [15:0] AH_ACC,
	input [15:0] D_IN,
	input [15:0] OP,
	input [15:0] AH_ACC_IN
);

wire SPLIT16_0_D15;
wire SPLIT16_0_D14;
wire SPLIT16_0_D13;
wire SPLIT16_0_D12;
wire SPLIT16_0_D11;
wire SPLIT16_0_D10;
wire SPLIT16_0_D9;
wire SPLIT16_0_D8;
wire SPLIT16_0_D7;
wire SPLIT16_0_D6;
wire SPLIT16_0_D5;
wire SPLIT16_0_D4;
wire SPLIT16_0_D3;
wire SPLIT16_0_D2;
wire SPLIT16_0_D1;
wire SPLIT16_0_D0;
wire [15:0] SELECT16_1_OUT;
wire [15:0] mrlogicunit_2_OUT;
wire [15:0] mrarithmeticunit_3_AH_ACC;
wire OR_4_OUT;

SPLIT16 SPLIT16_0(
	.D15 (SPLIT16_0_D15),
	.D14 (SPLIT16_0_D14),
	.D13 (SPLIT16_0_D13),
	.D12 (SPLIT16_0_D12),
	.D11 (SPLIT16_0_D11),
	.D10 (SPLIT16_0_D10),
	.D9 (SPLIT16_0_D9),
	.D8 (SPLIT16_0_D8),
	.D7 (SPLIT16_0_D7),
	.D6 (SPLIT16_0_D6),
	.D5 (SPLIT16_0_D5),
	.D4 (SPLIT16_0_D4),
	.D3 (SPLIT16_0_D3),
	.D2 (SPLIT16_0_D2),
	.D1 (SPLIT16_0_D1),
	.D0 (SPLIT16_0_D0),
	.IN (OP)
);
	
SELECT16 SELECT16_1(
	.OUT (SELECT16_1_OUT),
	.S (OR_4_OUT),
	.D1 (mrlogicunit_2_OUT),
	.D0 (mrarithmeticunit_3_AH_ACC)
);
	
mrlogicunit mrlogicunit_2(
	.OUT (mrlogicunit_2_OUT),
	.D_IN (D_IN),
	.ACC (AH_ACC_IN),
	.O2 (SPLIT16_0_D3),
	.O1 (SPLIT16_0_D1),
	.O0 (SPLIT16_0_D0)
);
	
mrarithmeticunit mrarithmeticunit_3(
	.AH_ACC (mrarithmeticunit_3_AH_ACC),
	.AH_ACC_IN (AH_ACC_IN),
	.D_IN (D_IN),
	.O2 (SPLIT16_0_D2),
	.O1 (SPLIT16_0_D1),
	.O0 (SPLIT16_0_D0)
);
	
OR OR_4(
	.OUT (OR_4_OUT),
	.A (SPLIT16_0_D3),
	.B (SPLIT16_0_D2)
);
	
assign AH_ACC = SELECT16_1_OUT;

endmodule
