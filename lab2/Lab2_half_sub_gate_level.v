module Lab2_half_sub_gate_level(output D, B, input x, y);
	
	wire x_not;
	not
		G_not_1(x_not, x);
	and
		G_and_1(B, x_not, y);
	xor
		G_xor_1(D, x, y);

endmodule
