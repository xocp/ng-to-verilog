module mrgpregisters(
	output [15:0] D_OUT,
	output [15:0] DEBUG,
	input [15:0] SRC,
	input [15:0] DST,
	input [15:0] D_IN,
	input STO,
	input RST,
	input CLK
);

wire [15:0] DFF16_0_OUT;
wire [15:0] DFF16_1_OUT;
wire [15:0] DFF16_2_OUT;
wire [15:0] DFF16_3_OUT;
wire [15:0] DFF16_4_OUT;
wire [15:0] DFF16_5_OUT;
wire [15:0] DFF16_6_OUT;
wire [15:0] DFF16_7_OUT;
wire SPLIT16_8_D15;
wire SPLIT16_8_D14;
wire SPLIT16_8_D13;
wire SPLIT16_8_D12;
wire SPLIT16_8_D11;
wire SPLIT16_8_D10;
wire SPLIT16_8_D9;
wire SPLIT16_8_D8;
wire SPLIT16_8_D7;
wire SPLIT16_8_D6;
wire SPLIT16_8_D5;
wire SPLIT16_8_D4;
wire SPLIT16_8_D3;
wire SPLIT16_8_D2;
wire SPLIT16_8_D1;
wire SPLIT16_8_D0;
wire SPLIT16_9_D15;
wire SPLIT16_9_D14;
wire SPLIT16_9_D13;
wire SPLIT16_9_D12;
wire SPLIT16_9_D11;
wire SPLIT16_9_D10;
wire SPLIT16_9_D9;
wire SPLIT16_9_D8;
wire SPLIT16_9_D7;
wire SPLIT16_9_D6;
wire SPLIT16_9_D5;
wire SPLIT16_9_D4;
wire SPLIT16_9_D3;
wire SPLIT16_9_D2;
wire SPLIT16_9_D1;
wire SPLIT16_9_D0;
wire [15:0] ZERO16_10_OUT;
wire [15:0] SELECT16_11_OUT;
wire OR_12_OUT;
wire [15:0] _8to18bitmux_13_OUT0;
wire _3to8decoder_14_OUT7;
wire _3to8decoder_14_OUT6;
wire _3to8decoder_14_OUT5;
wire _3to8decoder_14_OUT4;
wire _3to8decoder_14_OUT3;
wire _3to8decoder_14_OUT2;
wire _3to8decoder_14_OUT1;
wire _3to8decoder_14_OUT0;
wire _nor_15_OUT0;
wire _nor_16_OUT0;
wire and3_17_OUT0;
wire and3_18_OUT0;
wire and3_19_OUT0;
wire and3_20_OUT0;
wire and3_21_OUT0;
wire and3_22_OUT0;
wire and3_23_OUT0;
wire and3_24_OUT0;

DFF16 DFF16_0(
	.OUT (DFF16_0_OUT),
	.ST (and3_17_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_1(
	.OUT (DFF16_1_OUT),
	.ST (and3_18_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_2(
	.OUT (DFF16_2_OUT),
	.ST (and3_19_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_3(
	.OUT (DFF16_3_OUT),
	.ST (and3_20_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_4(
	.OUT (DFF16_4_OUT),
	.ST (and3_21_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_5(
	.OUT (DFF16_5_OUT),
	.ST (and3_23_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_6(
	.OUT (DFF16_6_OUT),
	.ST (and3_24_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_7(
	.OUT (DFF16_7_OUT),
	.ST (and3_22_OUT0),
	.X (SELECT16_11_OUT),
	.CLK (CLK)
);
	
SPLIT16 SPLIT16_8(
	.D15 (SPLIT16_8_D15),
	.D14 (SPLIT16_8_D14),
	.D13 (SPLIT16_8_D13),
	.D12 (SPLIT16_8_D12),
	.D11 (SPLIT16_8_D11),
	.D10 (SPLIT16_8_D10),
	.D9 (SPLIT16_8_D9),
	.D8 (SPLIT16_8_D8),
	.D7 (SPLIT16_8_D7),
	.D6 (SPLIT16_8_D6),
	.D5 (SPLIT16_8_D5),
	.D4 (SPLIT16_8_D4),
	.D3 (SPLIT16_8_D3),
	.D2 (SPLIT16_8_D2),
	.D1 (SPLIT16_8_D1),
	.D0 (SPLIT16_8_D0),
	.IN (SRC)
);
	
SPLIT16 SPLIT16_9(
	.D15 (SPLIT16_9_D15),
	.D14 (SPLIT16_9_D14),
	.D13 (SPLIT16_9_D13),
	.D12 (SPLIT16_9_D12),
	.D11 (SPLIT16_9_D11),
	.D10 (SPLIT16_9_D10),
	.D9 (SPLIT16_9_D9),
	.D8 (SPLIT16_9_D8),
	.D7 (SPLIT16_9_D7),
	.D6 (SPLIT16_9_D6),
	.D5 (SPLIT16_9_D5),
	.D4 (SPLIT16_9_D4),
	.D3 (SPLIT16_9_D3),
	.D2 (SPLIT16_9_D2),
	.D1 (SPLIT16_9_D1),
	.D0 (SPLIT16_9_D0),
	.IN (DST)
);
	
ZERO16 ZERO16_10(
	.OUT (ZERO16_10_OUT)
);
	
SELECT16 SELECT16_11(
	.OUT (SELECT16_11_OUT),
	.S (RST),
	.D1 (ZERO16_10_OUT),
	.D0 (D_IN)
);
	
OR OR_12(
	.OUT (OR_12_OUT),
	.A (STO),
	.B (RST)
);
	
_8to18bitmux _8to18bitmux_13(
	.OUT0 (_8to18bitmux_13_OUT0),
	.A2 (SPLIT16_8_D5),
	.A1 (SPLIT16_8_D4),
	.A0 (SPLIT16_8_D3),
	.IN7 (DFF16_0_OUT),
	.IN6 (DFF16_1_OUT),
	.IN5 (DFF16_2_OUT),
	.IN4 (DFF16_3_OUT),
	.IN3 (DFF16_4_OUT),
	.IN2 (DFF16_7_OUT),
	.IN1 (DFF16_5_OUT),
	.IN0 (DFF16_6_OUT)
);
	
_3to8decoder _3to8decoder_14(
	.OUT7 (_3to8decoder_14_OUT7),
	.OUT6 (_3to8decoder_14_OUT6),
	.OUT5 (_3to8decoder_14_OUT5),
	.OUT4 (_3to8decoder_14_OUT4),
	.OUT3 (_3to8decoder_14_OUT3),
	.OUT2 (_3to8decoder_14_OUT2),
	.OUT1 (_3to8decoder_14_OUT1),
	.OUT0 (_3to8decoder_14_OUT0),
	.D2 (SPLIT16_9_D5),
	.D1 (SPLIT16_9_D4),
	.D0 (SPLIT16_9_D3)
);
	
_nor _nor_15(
	.OUT0 (_nor_15_OUT0),
	.A (SPLIT16_8_D7),
	.B (SPLIT16_8_D6)
);
	
_nor _nor_16(
	.OUT0 (_nor_16_OUT0),
	.A (SPLIT16_9_D7),
	.B (SPLIT16_9_D6)
);
	
and3 and3_17(
	.OUT0 (and3_17_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT7)
);
	
and3 and3_18(
	.OUT0 (and3_18_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT6)
);
	
and3 and3_19(
	.OUT0 (and3_19_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT5)
);
	
and3 and3_20(
	.OUT0 (and3_20_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT4)
);
	
and3 and3_21(
	.OUT0 (and3_21_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT3)
);
	
and3 and3_22(
	.OUT0 (and3_22_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT2)
);
	
and3 and3_23(
	.OUT0 (and3_23_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT1)
);
	
and3 and3_24(
	.OUT0 (and3_24_OUT0),
	.IN0 (_nor_16_OUT0),
	.IN1 (OR_12_OUT),
	.IN2 (_3to8decoder_14_OUT0)
);
	
assign D_OUT = _8to18bitmux_13_OUT0;
assign DEBUG = DFF16_6_OUT;

endmodule
