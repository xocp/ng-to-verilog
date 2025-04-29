module DFF16(
	output [15:0] OUT,
	input ST,
	input [15:0] X,
	input CLK
);

reg [15:0] R;
assign OUT = R;
initial R = 0;
always @(posedge CLK) begin
	if(ST) begin
		R <= X;
	end
end


endmodule
