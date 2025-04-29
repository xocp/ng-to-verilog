module SELECT16(
	output reg [15:0] OUT,
	input S,
	input [15:0] D1,
	input [15:0] D0
);

always @(*) begin
	if (S) OUT = D1;
	else OUT = D0;
end

endmodule
