module BUNDLE16(
	output [15:0] OUT,
	input D15,
	input D14,
	input D13,
	input D12,
	input D11,
	input D10,
	input D9,
	input D8,
	input D7,
	input D6,
	input D5,
	input D4,
	input D3,
	input D2,
	input D1,
	input D0
);

assign OUT = {D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0};

endmodule
