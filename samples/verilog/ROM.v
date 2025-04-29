module ROM(
	output [15:0] OUT,
	input [15:0] A
);

reg [15:0] D;
initial D = 0;
assign OUT = D;

always @(*) begin
	case (A)
		0: D = 2;
		1: D = 0;
		2: D = 104;
		3: D = 2;
		4: D = 12;
		5: D = 96;
		6: D = 2;
		7: D = 0;
		8: D = 0;
		9: D = 2;
		10: D = 1;
		11: D = 8;
		12: D = 1;
		13: D = 0;
		14: D = 80;
		15: D = 16;
		16: D = 8;
		17: D = 1;
		18: D = 8;
		19: D = 0;
		20: D = 1;
		21: D = 80;
		22: D = 8;
		23: D = 36;
		24: D = 145;
		default: D = 0;
	endcase
end

endmodule
