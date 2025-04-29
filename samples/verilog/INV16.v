module INV16(
	output [15:0] OUT,
	input [15:0] A
);

assign OUT = ~A;

endmodule
