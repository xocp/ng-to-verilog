module ADDC16(
	output C,
	output [15:0] S,
	input [15:0] A,
	input [15:0] B,
	input C_IN
);

wire [16:0] SUM;
wire [15:0] CARRY_IN_EXTENDED;

assign CARRY_IN_EXTENDED = {{(15){1'b0}}, C_IN};
assign SUM = A + B + CARRY_IN_EXTENDED;
assign S = SUM[15:0];
assign C = SUM[16:16];

endmodule
