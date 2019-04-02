module Lab2_full_sub(output D, B, input x, y, z);

	wire wD_1, wB_1, wB_2;

	Lab2_half_sub_dataflow half_sub_1(wD_1, wB_1, x, y);
	Lab2_half_sub_dataflow half_sub_2(D, wB_2, wD_1, z);
	or
		G_or_1(B, wB_1, wB_2);

endmodule
