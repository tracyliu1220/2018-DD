module Lab2_ripple_borrow_4_bit_sub(output [3:0] Diff, output Bout, input [3:0] X, Y, input Bin);

	wire [2:0] B;

	Lab2_full_sub FS_1(Diff[0], B[0], X[0], Y[0], Bin);
	Lab2_full_sub FS_2(Diff[1], B[1], X[1], Y[1], B[0]);
	Lab2_full_sub FS_3(Diff[2], B[2], X[2], Y[2], B[1]);
	Lab2_full_sub FS_4(Diff[3], Bout, X[3], Y[3], B[2]);

endmodule