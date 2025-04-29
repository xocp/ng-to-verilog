module RAM16(
	output [15:0] OUT,
	input ST,
	input [15:0] X,
	input [15:0] AD,
	input CLK
);

reg [15:0] memory [0:255];
assign OUT = memory[AD];

always @(posedge CLK) begin
	if (ST) begin
		memory[AD] <= X;
	end
end

endmodule
