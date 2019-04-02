module t_Lab2_4_bit_sub;
	reg [3:0] x, y;
	reg Bin;
	wire [3:0] Dr, Dl;
	wire Boutr, Boutl;

	Lab2_ripple_borrow_4_bit_sub Mr(Dr[3:0], Boutr, x[3:0], y[3:0], Bin);
	Lab2_borrow_lookahead_4_bit_sub Ml(Dl[3:0], Boutl, x[3:0], y[3:0], Bin);

	initial begin
			x = 4'b1100; y = 4'b0101; Bin = 1'b1;
	#100	x = 4'b1101; y = 4'b0110; Bin = 1'b0;
	#100	x = 4'b0101; y = 4'b1101; Bin = 1'b0;
	#100	x = 4'b0110; y = 4'b1101; Bin = 1'b1;
	#100	x = 4'b1001; y = 4'b1001; Bin = 1'b0;
	#100	x = 4'b0101; y = 4'b0101; Bin = 1'b1;
	end

	initial #600 $finish;
endmodule