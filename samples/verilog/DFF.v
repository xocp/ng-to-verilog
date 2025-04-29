module DFF(
	output OUT,
	input ST,
	input D,
	input CLK
);

reg R;
assign OUT = R;
initial R = 0;
always @(negedge CLK) begin
	if(ST) R <= D;
end


endmodule
