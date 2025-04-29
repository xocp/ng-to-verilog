module _8to18bitmux(
	output [15:0] OUT0,
	input A2,
	input A1,
	input A0,
	input [15:0] IN7,
	input [15:0] IN6,
	input [15:0] IN5,
	input [15:0] IN4,
	input [15:0] IN3,
	input [15:0] IN2,
	input [15:0] IN1,
	input [15:0] IN0
);

wire [15:0] SELECT16_0_OUT;
wire [15:0] SELECT16_1_OUT;
wire [15:0] SELECT16_2_OUT;
wire [15:0] SELECT16_3_OUT;
wire [15:0] SELECT16_4_OUT;
wire [15:0] SELECT16_5_OUT;
wire [15:0] SELECT16_6_OUT;

SELECT16 SELECT16_0(
	.OUT (SELECT16_0_OUT),
	.S (A2),
	.D1 (SELECT16_4_OUT),
	.D0 (SELECT16_1_OUT)
);
	
SELECT16 SELECT16_1(
	.OUT (SELECT16_1_OUT),
	.S (A1),
	.D1 (SELECT16_3_OUT),
	.D0 (SELECT16_2_OUT)
);
	
SELECT16 SELECT16_2(
	.OUT (SELECT16_2_OUT),
	.S (A0),
	.D1 (IN1),
	.D0 (IN0)
);
	
SELECT16 SELECT16_3(
	.OUT (SELECT16_3_OUT),
	.S (A0),
	.D1 (IN3),
	.D0 (IN2)
);
	
SELECT16 SELECT16_4(
	.OUT (SELECT16_4_OUT),
	.S (A1),
	.D1 (SELECT16_6_OUT),
	.D0 (SELECT16_5_OUT)
);
	
SELECT16 SELECT16_5(
	.OUT (SELECT16_5_OUT),
	.S (A0),
	.D1 (IN5),
	.D0 (IN4)
);
	
SELECT16 SELECT16_6(
	.OUT (SELECT16_6_OUT),
	.S (A0),
	.D1 (IN7),
	.D0 (IN6)
);
	
assign OUT0 = SELECT16_0_OUT;

endmodule
