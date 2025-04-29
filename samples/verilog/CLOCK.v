module CLOCK(
	output OUT
);

reg clock;

assign OUT = clock;
initial clock = 0;
always begin
	#10;
	clock = ~clock;
end

endmodule
