module mrminicontrolunit(
	output T1,
	output T2,
	output T3,
	output T4,
	output PCE,
	input CLK,
	input RST,
	input [15:0] I
);

wire INV_0_OUT;
wire AND_1_OUT;
wire OR_2_OUT;
wire OR_3_OUT;
wire OR_4_OUT;
wire SPLIT22_5_D21;
wire SPLIT22_5_D20;
wire SPLIT22_5_D19;
wire SPLIT22_5_D18;
wire SPLIT22_5_D17;
wire SPLIT22_5_D16;
wire SPLIT22_5_D15;
wire SPLIT22_5_D14;
wire SPLIT22_5_D13;
wire SPLIT22_5_D12;
wire SPLIT22_5_D11;
wire SPLIT22_5_D10;
wire SPLIT22_5_D9;
wire SPLIT22_5_D8;
wire SPLIT22_5_D7;
wire SPLIT22_5_D6;
wire SPLIT22_5_D5;
wire SPLIT22_5_D4;
wire SPLIT22_5_D3;
wire SPLIT22_5_D2;
wire SPLIT22_5_D1;
wire SPLIT22_5_D0;
wire AND_6_OUT;
wire AND_7_OUT;
wire OR_8_OUT;
wire AND_9_OUT;
wire INV_10_OUT;
wire nor8_11_OUT0;
wire OR_12_OUT;
wire AND_13_OUT;
wire OR_14_OUT;
wire OR_15_OUT;
wire OR_16_OUT;
wire ZERO_17_OUT;
wire INV_18_OUT;
wire DFF_19_OUT;
wire DFF_20_OUT;
wire DFF_21_OUT;
wire DFF_22_OUT;
wire DFF_23_OUT;
wire DFF_24_OUT;
wire DFF_25_OUT;
wire DFF_26_OUT;

INV INV_0(
	.OUT (INV_0_OUT),
	.IN (DFF_21_OUT)
);
	
AND AND_1(
	.OUT (AND_1_OUT),
	.A (OR_2_OUT),
	.B (INV_0_OUT)
);
	
OR OR_2(
	.OUT (OR_2_OUT),
	.A (DFF_23_OUT),
	.B (DFF_25_OUT)
);
	
OR OR_3(
	.OUT (OR_3_OUT),
	.A (OR_14_OUT),
	.B (DFF_20_OUT)
);
	
OR OR_4(
	.OUT (OR_4_OUT),
	.A (OR_3_OUT),
	.B (DFF_21_OUT)
);
	
SPLIT22 SPLIT22_5(
	.D21 (SPLIT22_5_D21),
	.D20 (SPLIT22_5_D20),
	.D19 (SPLIT22_5_D19),
	.D18 (SPLIT22_5_D18),
	.D17 (SPLIT22_5_D17),
	.D16 (SPLIT22_5_D16),
	.D15 (SPLIT22_5_D15),
	.D14 (SPLIT22_5_D14),
	.D13 (SPLIT22_5_D13),
	.D12 (SPLIT22_5_D12),
	.D11 (SPLIT22_5_D11),
	.D10 (SPLIT22_5_D10),
	.D9 (SPLIT22_5_D9),
	.D8 (SPLIT22_5_D8),
	.D7 (SPLIT22_5_D7),
	.D6 (SPLIT22_5_D6),
	.D5 (SPLIT22_5_D5),
	.D4 (SPLIT22_5_D4),
	.D3 (SPLIT22_5_D3),
	.D2 (SPLIT22_5_D2),
	.D1 (SPLIT22_5_D1),
	.D0 (SPLIT22_5_D0),
	.IN (I)
);
	
AND AND_6(
	.OUT (AND_6_OUT),
	.A (DFF_22_OUT),
	.B (AND_13_OUT)
);
	
AND AND_7(
	.OUT (AND_7_OUT),
	.A (DFF_22_OUT),
	.B (AND_6_OUT)
);
	
OR OR_8(
	.OUT (OR_8_OUT),
	.A (DFF_24_OUT),
	.B (AND_9_OUT)
);
	
AND AND_9(
	.OUT (AND_9_OUT),
	.A (DFF_22_OUT),
	.B (INV_10_OUT)
);
	
INV INV_10(
	.OUT (INV_10_OUT),
	.IN (AND_13_OUT)
);
	
nor8 nor8_11(
	.OUT0 (nor8_11_OUT0),
	.IN0 (ZERO_17_OUT),
	.IN1 (ZERO_17_OUT),
	.IN2 (SPLIT22_5_D7),
	.IN3 (SPLIT22_5_D6),
	.IN4 (SPLIT22_5_D5),
	.IN5 (SPLIT22_5_D4),
	.IN6 (SPLIT22_5_D3),
	.IN7 (SPLIT22_5_D2)
);
	
OR OR_12(
	.OUT (OR_12_OUT),
	.A (SPLIT22_5_D1),
	.B (SPLIT22_5_D0)
);
	
AND AND_13(
	.OUT (AND_13_OUT),
	.A (nor8_11_OUT0),
	.B (OR_12_OUT)
);
	
OR OR_14(
	.OUT (OR_14_OUT),
	.A (RST),
	.B (DFF_19_OUT)
);
	
OR OR_15(
	.OUT (OR_15_OUT),
	.A (AND_1_OUT),
	.B (OR_16_OUT)
);
	
OR OR_16(
	.OUT (OR_16_OUT),
	.A (AND_7_OUT),
	.B (DFF_26_OUT)
);
	
ZERO ZERO_17(
	.OUT (ZERO_17_OUT)
);
	
INV INV_18(
	.OUT (INV_18_OUT),
	.IN (ZERO_17_OUT)
);
	
DFF DFF_19(
	.OUT (DFF_19_OUT),
	.ST (INV_18_OUT),
	.D (RST),
	.CLK (CLK)
);
	
DFF DFF_20(
	.OUT (DFF_20_OUT),
	.ST (INV_18_OUT),
	.D (DFF_19_OUT),
	.CLK (CLK)
);
	
DFF DFF_21(
	.OUT (DFF_21_OUT),
	.ST (INV_18_OUT),
	.D (OR_3_OUT),
	.CLK (CLK)
);
	
DFF DFF_22(
	.OUT (DFF_22_OUT),
	.ST (INV_18_OUT),
	.D (DFF_26_OUT),
	.CLK (CLK)
);
	
DFF DFF_23(
	.OUT (DFF_23_OUT),
	.ST (INV_18_OUT),
	.D (OR_8_OUT),
	.CLK (CLK)
);
	
DFF DFF_24(
	.OUT (DFF_24_OUT),
	.ST (INV_18_OUT),
	.D (AND_7_OUT),
	.CLK (CLK)
);
	
DFF DFF_25(
	.OUT (DFF_25_OUT),
	.ST (INV_18_OUT),
	.D (OR_4_OUT),
	.CLK (CLK)
);
	
DFF DFF_26(
	.OUT (DFF_26_OUT),
	.ST (INV_18_OUT),
	.D (AND_1_OUT),
	.CLK (CLK)
);
	
assign T1 = AND_1_OUT;
assign T2 = DFF_26_OUT;
assign T3 = AND_7_OUT;
assign T4 = OR_8_OUT;
assign PCE = OR_15_OUT;

endmodule
