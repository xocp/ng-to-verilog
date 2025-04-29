module mrregister(
	output [15:0] D_OUT,
	output [15:0] I,
	output [15:0] AH_ACC,
	output [15:0] PG0_IDX0,
	output [15:0] PG1_IDX1,
	output [15:0] DEBUG,
	input [15:0] DST,
	input CLK,
	input [15:0] D_IN,
	input [15:0] SRC,
	input RST,
	input STO,
	input STO_ALU,
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
wire [15:0] DFF16_1_OUT;
wire [15:0] DFF16_2_OUT;
wire [15:0] SELECT16_3_OUT;
wire [15:0] ZERO16_4_OUT;
wire SPLIT16_5_D15;
wire SPLIT16_5_D14;
wire SPLIT16_5_D13;
wire SPLIT16_5_D12;
wire SPLIT16_5_D11;
wire SPLIT16_5_D10;
wire SPLIT16_5_D9;
wire SPLIT16_5_D8;
wire SPLIT16_5_D7;
wire SPLIT16_5_D6;
wire SPLIT16_5_D5;
wire SPLIT16_5_D4;
wire SPLIT16_5_D3;
wire SPLIT16_5_D2;
wire SPLIT16_5_D1;
wire SPLIT16_5_D0;
wire [15:0] _8to18bitmux_6_OUT0;
wire [15:0] mrgpregisters_7_D_OUT;
wire [15:0] mrgpregisters_7_DEBUG;
wire [15:0] mrspregister_8_HI;
wire [15:0] mrspregister_8_LO;
wire [15:0] mrspregister_8_HI_LO;
wire [15:0] mrspregister_9_HI;
wire [15:0] mrspregister_9_LO;
wire [15:0] mrspregister_9_HI_LO;
wire OR_10_OUT;
wire [15:0] ZERO16_11_OUT;
wire _3to8decoder_12_OUT7;
wire _3to8decoder_12_OUT6;
wire _3to8decoder_12_OUT5;
wire _3to8decoder_12_OUT4;
wire _3to8decoder_12_OUT3;
wire _3to8decoder_12_OUT2;
wire _3to8decoder_12_OUT1;
wire _3to8decoder_12_OUT0;
wire [15:0] ZERO16_13_OUT;
wire [15:0] SELECT16_14_OUT;
wire OR_15_OUT;
wire OR_16_OUT;
wire [15:0] SELECT16_17_OUT;
wire and3_18_OUT0;
wire and3_19_OUT0;
wire and3_20_OUT0;
wire and3_21_OUT0;
wire OR_22_OUT;
wire OR_23_OUT;
wire [15:0] mrspregister_24_HI;
wire [15:0] mrspregister_24_LO;
wire [15:0] mrspregister_24_HI_LO;
wire and3_25_OUT0;
wire OR_26_OUT;

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
	.IN (DST)
);
	
DFF16 DFF16_1(
	.OUT (DFF16_1_OUT),
	.ST (OR_22_OUT),
	.X (SELECT16_3_OUT),
	.CLK (CLK)
);
	
DFF16 DFF16_2(
	.OUT (DFF16_2_OUT),
	.ST (OR_23_OUT),
	.X (SELECT16_3_OUT),
	.CLK (CLK)
);
	
SELECT16 SELECT16_3(
	.OUT (SELECT16_3_OUT),
	.S (RST),
	.D1 (ZERO16_4_OUT),
	.D0 (D_IN)
);
	
ZERO16 ZERO16_4(
	.OUT (ZERO16_4_OUT)
);
	
SPLIT16 SPLIT16_5(
	.D15 (SPLIT16_5_D15),
	.D14 (SPLIT16_5_D14),
	.D13 (SPLIT16_5_D13),
	.D12 (SPLIT16_5_D12),
	.D11 (SPLIT16_5_D11),
	.D10 (SPLIT16_5_D10),
	.D9 (SPLIT16_5_D9),
	.D8 (SPLIT16_5_D8),
	.D7 (SPLIT16_5_D7),
	.D6 (SPLIT16_5_D6),
	.D5 (SPLIT16_5_D5),
	.D4 (SPLIT16_5_D4),
	.D3 (SPLIT16_5_D3),
	.D2 (SPLIT16_5_D2),
	.D1 (SPLIT16_5_D1),
	.D0 (SPLIT16_5_D0),
	.IN (SRC)
);
	
_8to18bitmux _8to18bitmux_6(
	.OUT0 (_8to18bitmux_6_OUT0),
	.A2 (SPLIT16_5_D5),
	.A1 (SPLIT16_5_D4),
	.A0 (SPLIT16_5_D3),
	.IN7 (mrspregister_24_HI),
	.IN6 (mrspregister_24_LO),
	.IN5 (mrspregister_8_HI),
	.IN4 (mrspregister_8_LO),
	.IN3 (mrspregister_9_HI),
	.IN2 (mrspregister_9_LO),
	.IN1 (DFF16_1_OUT),
	.IN0 (DFF16_2_OUT)
);
	
mrgpregisters mrgpregisters_7(
	.D_OUT (mrgpregisters_7_D_OUT),
	.DEBUG (mrgpregisters_7_DEBUG),
	.SRC (SRC),
	.DST (DST),
	.D_IN (D_IN),
	.STO (STO),
	.RST (RST),
	.CLK (CLK)
);
	
mrspregister mrspregister_8(
	.HI (mrspregister_8_HI),
	.LO (mrspregister_8_LO),
	.HI_LO (mrspregister_8_HI_LO),
	.D_IN (SELECT16_3_OUT),
	.A0 (_3to8decoder_12_OUT5),
	.STO (and3_21_OUT0),
	.STO_A (RST),
	.A_IN (ZERO16_11_OUT),
	.CLK (CLK)
);
	
mrspregister mrspregister_9(
	.HI (mrspregister_9_HI),
	.LO (mrspregister_9_LO),
	.HI_LO (mrspregister_9_HI_LO),
	.D_IN (SELECT16_3_OUT),
	.A0 (_3to8decoder_12_OUT3),
	.STO (and3_20_OUT0),
	.STO_A (OR_10_OUT),
	.A_IN (SELECT16_14_OUT),
	.CLK (CLK)
);
	
OR OR_10(
	.OUT (OR_10_OUT),
	.A (RST),
	.B (STO_ALU)
);
	
ZERO16 ZERO16_11(
	.OUT (ZERO16_11_OUT)
);
	
_3to8decoder _3to8decoder_12(
	.OUT7 (_3to8decoder_12_OUT7),
	.OUT6 (_3to8decoder_12_OUT6),
	.OUT5 (_3to8decoder_12_OUT5),
	.OUT4 (_3to8decoder_12_OUT4),
	.OUT3 (_3to8decoder_12_OUT3),
	.OUT2 (_3to8decoder_12_OUT2),
	.OUT1 (_3to8decoder_12_OUT1),
	.OUT0 (_3to8decoder_12_OUT0),
	.D2 (SPLIT16_0_D5),
	.D1 (SPLIT16_0_D4),
	.D0 (SPLIT16_0_D3)
);
	
ZERO16 ZERO16_13(
	.OUT (ZERO16_13_OUT)
);
	
SELECT16 SELECT16_14(
	.OUT (SELECT16_14_OUT),
	.S (RST),
	.D1 (ZERO16_13_OUT),
	.D0 (AH_ACC_IN)
);
	
OR OR_15(
	.OUT (OR_15_OUT),
	.A (_3to8decoder_12_OUT5),
	.B (_3to8decoder_12_OUT4)
);
	
OR OR_16(
	.OUT (OR_16_OUT),
	.A (_3to8decoder_12_OUT3),
	.B (_3to8decoder_12_OUT2)
);
	
SELECT16 SELECT16_17(
	.OUT (SELECT16_17_OUT),
	.S (SPLIT16_5_D6),
	.D1 (_8to18bitmux_6_OUT0),
	.D0 (mrgpregisters_7_D_OUT)
);
	
and3 and3_18(
	.OUT0 (and3_18_OUT0),
	.IN0 (SPLIT16_0_D6),
	.IN1 (_3to8decoder_12_OUT0),
	.IN2 (STO)
);
	
and3 and3_19(
	.OUT0 (and3_19_OUT0),
	.IN0 (SPLIT16_0_D6),
	.IN1 (_3to8decoder_12_OUT1),
	.IN2 (STO)
);
	
and3 and3_20(
	.OUT0 (and3_20_OUT0),
	.IN0 (SPLIT16_0_D6),
	.IN1 (OR_16_OUT),
	.IN2 (STO)
);
	
and3 and3_21(
	.OUT0 (and3_21_OUT0),
	.IN0 (SPLIT16_0_D6),
	.IN1 (OR_15_OUT),
	.IN2 (STO)
);
	
OR OR_22(
	.OUT (OR_22_OUT),
	.A (and3_19_OUT0),
	.B (RST)
);
	
OR OR_23(
	.OUT (OR_23_OUT),
	.A (and3_18_OUT0),
	.B (RST)
);
	
mrspregister mrspregister_24(
	.HI (mrspregister_24_HI),
	.LO (mrspregister_24_LO),
	.HI_LO (mrspregister_24_HI_LO),
	.D_IN (SELECT16_3_OUT),
	.A0 (_3to8decoder_12_OUT7),
	.STO (and3_25_OUT0),
	.STO_A (RST),
	.A_IN (ZERO16_11_OUT),
	.CLK (CLK)
);
	
and3 and3_25(
	.OUT0 (and3_25_OUT0),
	.IN0 (SPLIT16_0_D6),
	.IN1 (OR_26_OUT),
	.IN2 (STO)
);
	
OR OR_26(
	.OUT (OR_26_OUT),
	.A (_3to8decoder_12_OUT7),
	.B (_3to8decoder_12_OUT6)
);
	
assign D_OUT = SELECT16_17_OUT;
assign I = DFF16_2_OUT;
assign AH_ACC = mrspregister_9_HI_LO;
assign PG0_IDX0 = mrspregister_8_HI_LO;
assign PG1_IDX1 = mrspregister_24_HI_LO;
assign DEBUG = mrgpregisters_7_DEBUG;

endmodule
