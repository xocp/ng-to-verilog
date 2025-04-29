module mrcontrolunit(
	output [15:0] DST,
	output [15:0] SRC,
	output STO_RAM,
	output STO_REG,
	output STO_ALU,
	output STO_IO,
	output J,
	output PC_E,
	input CLK,
	input RST,
	input [15:0] I,
	input [15:0] ALU_ACC,
	input [15:0] D_IN
);

wire mrminicontrolunit_0_T1;
wire mrminicontrolunit_0_T2;
wire mrminicontrolunit_0_T3;
wire mrminicontrolunit_0_T4;
wire mrminicontrolunit_0_PCE;
wire [15:0] CONST_1_OUT;
wire [15:0] CONST_2_OUT;
wire SPLIT16_3_D15;
wire SPLIT16_3_D14;
wire SPLIT16_3_D13;
wire SPLIT16_3_D12;
wire SPLIT16_3_D11;
wire SPLIT16_3_D10;
wire SPLIT16_3_D9;
wire SPLIT16_3_D8;
wire SPLIT16_3_D7;
wire SPLIT16_3_D6;
wire SPLIT16_3_D5;
wire SPLIT16_3_D4;
wire SPLIT16_3_D3;
wire SPLIT16_3_D2;
wire SPLIT16_3_D1;
wire SPLIT16_3_D0;
wire [15:0] DFF16_4_OUT;
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
wire and3_6_OUT0;
wire [15:0] DFF16_7_OUT;
wire [15:0] CONST_8_OUT;
wire [15:0] CONST_9_OUT;
wire mridMOVI_10_OUT0;
wire [15:0] SELECT16_11_OUT;
wire [15:0] SELECT16_12_OUT;
wire [15:0] SELECT16_13_OUT;
wire [15:0] SELECT16_14_OUT;
wire [15:0] SELECT16_15_OUT;
wire [15:0] ZERO16_16_OUT;
wire OR_17_OUT;
wire AND_18_OUT;
wire OR_19_OUT;
wire AND_20_OUT;
wire AND_21_OUT;
wire AND_22_OUT;
wire AND_23_OUT;
wire mrstodecoder_24_STO_RAM;
wire mrstodecoder_24_STO_REG;
wire mrstodecoder_24_STO_ALU;
wire mrstodecoder_24_STO_IO;
wire OR_25_OUT;

mrminicontrolunit mrminicontrolunit_0(
	.T1 (mrminicontrolunit_0_T1),
	.T2 (mrminicontrolunit_0_T2),
	.T3 (mrminicontrolunit_0_T3),
	.T4 (mrminicontrolunit_0_T4),
	.PCE (mrminicontrolunit_0_PCE),
	.CLK (CLK),
	.RST (RST),
	.I (I)
);
	
SPLIT16 SPLIT16_3(
	.D15 (SPLIT16_3_D15),
	.D14 (SPLIT16_3_D14),
	.D13 (SPLIT16_3_D13),
	.D12 (SPLIT16_3_D12),
	.D11 (SPLIT16_3_D11),
	.D10 (SPLIT16_3_D10),
	.D9 (SPLIT16_3_D9),
	.D8 (SPLIT16_3_D8),
	.D7 (SPLIT16_3_D7),
	.D6 (SPLIT16_3_D6),
	.D5 (SPLIT16_3_D5),
	.D4 (SPLIT16_3_D4),
	.D3 (SPLIT16_3_D3),
	.D2 (SPLIT16_3_D2),
	.D1 (SPLIT16_3_D1),
	.D0 (SPLIT16_3_D0),
	.IN (ALU_ACC)
);
	
DFF16 DFF16_4(
	.OUT (DFF16_4_OUT),
	.ST (mrminicontrolunit_0_T2),
	.X (D_IN),
	.CLK (CLK)
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
	.IN (I)
);
	
and3 and3_6(
	.OUT0 (and3_6_OUT0),
	.IN0 (mrminicontrolunit_0_T4),
	.IN1 (SPLIT16_5_D5),
	.IN2 (SPLIT16_3_D0)
);
	
DFF16 DFF16_7(
	.OUT (DFF16_7_OUT),
	.ST (mrminicontrolunit_0_T3),
	.X (D_IN),
	.CLK (CLK)
);
	
mridMOVI mridMOVI_10(
	.OUT0 (mridMOVI_10_OUT0),
	.I (I)
);
	
SELECT16 SELECT16_11(
	.OUT (SELECT16_11_OUT),
	.S (mrminicontrolunit_0_T4),
	.D1 (SELECT16_12_OUT),
	.D0 (CONST_8_OUT)
);
	
SELECT16 SELECT16_12(
	.OUT (SELECT16_12_OUT),
	.S (mridMOVI_10_OUT0),
	.D1 (CONST_9_OUT),
	.D0 (DFF16_4_OUT)
);
	
SELECT16 SELECT16_13(
	.OUT (SELECT16_13_OUT),
	.S (mrminicontrolunit_0_T1),
	.D1 (CONST_2_OUT),
	.D0 (SELECT16_14_OUT)
);
	
SELECT16 SELECT16_14(
	.OUT (SELECT16_14_OUT),
	.S (mrminicontrolunit_0_T2),
	.D1 (CONST_1_OUT),
	.D0 (SELECT16_15_OUT)
);
	
SELECT16 SELECT16_15(
	.OUT (SELECT16_15_OUT),
	.S (mrminicontrolunit_0_T4),
	.D1 (DFF16_7_OUT),
	.D0 (ZERO16_16_OUT)
);
	
ZERO16 ZERO16_16(
	.OUT (ZERO16_16_OUT)
);
	
OR OR_17(
	.OUT (OR_17_OUT),
	.A (mrminicontrolunit_0_T1),
	.B (OR_19_OUT)
);
	
AND AND_18(
	.OUT (AND_18_OUT),
	.A (mrminicontrolunit_0_T2),
	.B (mridMOVI_10_OUT0)
);
	
OR OR_19(
	.OUT (OR_19_OUT),
	.A (AND_18_OUT),
	.B (AND_20_OUT)
);
	
AND AND_20(
	.OUT (AND_20_OUT),
	.A (mrminicontrolunit_0_T4),
	.B (mrstodecoder_24_STO_REG)
);
	
AND AND_21(
	.OUT (AND_21_OUT),
	.A (mrminicontrolunit_0_T4),
	.B (mrstodecoder_24_STO_RAM)
);
	
AND AND_22(
	.OUT (AND_22_OUT),
	.A (mrminicontrolunit_0_T4),
	.B (mrstodecoder_24_STO_ALU)
);
	
AND AND_23(
	.OUT (AND_23_OUT),
	.A (mrminicontrolunit_0_T4),
	.B (mrstodecoder_24_STO_IO)
);
	
mrstodecoder mrstodecoder_24(
	.STO_RAM (mrstodecoder_24_STO_RAM),
	.STO_REG (mrstodecoder_24_STO_REG),
	.STO_ALU (mrstodecoder_24_STO_ALU),
	.STO_IO (mrstodecoder_24_STO_IO),
	.I (I),
	.DST (DFF16_7_OUT)
);
	
OR OR_25(
	.OUT (OR_25_OUT),
	.A (mrminicontrolunit_0_PCE),
	.B (and3_6_OUT0)
);
	
assign CONST_1_OUT = 72;
assign CONST_2_OUT = 64;
assign CONST_8_OUT = 129;
assign CONST_9_OUT = 72;
assign DST = SELECT16_13_OUT;
assign SRC = SELECT16_11_OUT;
assign STO_RAM = AND_21_OUT;
assign STO_REG = OR_17_OUT;
assign STO_ALU = AND_22_OUT;
assign STO_IO = AND_23_OUT;
assign J = and3_6_OUT0;
assign PC_E = OR_25_OUT;

endmodule
