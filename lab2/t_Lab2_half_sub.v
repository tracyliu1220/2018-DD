module t_Lab2_half_sub;

	wire Bg, Dg, Bd, Dd, Bb, Db;
	reg x, y;

	Lab2_half_sub_gate_level Mg(Dg, Bg, x, y);
	Lab2_half_sub_dataflow Md(Dd, Bd, x, y);
	Lab2_half_sub_behavior Mb(Db, Bb, x, y);

	initial begin
			x = 1'b0; y = 1'b0;
	#100	x = 1'b0; y = 1'b1;
	#100	x = 1'b1; y = 1'b0;
	#100	x = 1'b1; y = 1'b1;
	end
	initial #400 $finish;

endmodule