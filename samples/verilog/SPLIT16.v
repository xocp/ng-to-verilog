module SPLIT16(
	output D15,
	output D14,
	output D13,
	output D12,
	output D11,
	output D10,
	output D9,
	output D8,
	output D7,
	output D6,
	output D5,
	output D4,
	output D3,
	output D2,
	output D1,
	output D0,
	input [15:0] IN
);

assign D15 = IN[15:15];
assign D14 = IN[14:14];
assign D13 = IN[13:13];
assign D12 = IN[12:12];
assign D11 = IN[11:11];
assign D10 = IN[10:10];
assign D9 = IN[9:9];
assign D8 = IN[8:8];
assign D7 = IN[7:7];
assign D6 = IN[6:6];
assign D5 = IN[5:5];
assign D4 = IN[4:4];
assign D3 = IN[3:3];
assign D2 = IN[2:2];
assign D1 = IN[1:1];
assign D0 = IN[0:0];

endmodule
