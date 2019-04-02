module Lab2_borrow_lookahead_4_bit_sub(output [3:0] Diff, output Bout, input [3:0] X, Y, input Bin);

	wire [3:0] P, B, G;

	assign P[0] = !(X[0] ^ Y[0]);
	assign P[1] = !(X[1] ^ Y[1]);
	assign P[2] = !(X[2] ^ Y[2]);
	assign P[3] = !(X[3] ^ Y[3]);

	assign G[0] = !X[0] && Y[0];
	assign G[1] = !X[1] && Y[1];
	assign G[2] = !X[2] && Y[2];
	assign G[3] = !X[3] && Y[3];

	assign B[1] = P[0] && Bin || G[0];
	assign B[2] = P[1] && P[0] && Bin || P[1] && G[0] || G[1];
	assign B[3] = P[2] && P[1] && P[0] && Bin || P[2] && P[1] && G[0] || P[2] && G[1] || G[2];
	assign Bout = P[3] && P[2] && P[1] && P[0] && Bin || P[3] && P[2] && P[1] && G[0] || P[3] && P[2] && G[1] || P[3] && G[2] || G[3];

	assign Diff[0] = !P[0] ^ Bin;
	assign Diff[1] = !P[1] ^ B[1];
	assign Diff[2] = !P[2] ^ B[2];
	assign Diff[3] = !P[3] ^ B[3];

/*
	xnor
		G_xnor_1(P[0], X[0], Y[0]),
		G_xnor_2(P[1], X[1], Y[1]),
		G_xnor_3(P[2], X[2], Y[2]),
		G_xnor_4(P[3], X[3], Y[3]);

	not
		G_not_1(x_not[0], X[0]),
		G_not_2(x_not[1], X[1]),
		G_not_3(x_not[2], X[2]),
		G_not_4(x_not[3], X[3]),
		G_not_5(p_not[0], P[0]),
		G_not_6(p_not[1], P[1]),
		G_not_7(p_not[2], P[2]),
		G_not_8(p_not[3], P[3]);

	and
		G_and_1(G[0], x_not[0], Y[0]),
		G_and_2(G[1], x_not[1], Y[1]),
		G_and_3(G[2], x_not[2], Y[2]),
		G_and_4(G[3], x_not[3], Y[3]);

	xor
		G_xor_1(Diff[0], p_not[0], Bin),
		G_xor_2(Diff[1], p_not[1], B[1]),
		G_xor_3(Diff[2], p_not[2], B[2]),
		G_xor_4(Diff[3], p_not[3], B[3]);

	//B1
	wire for_b1;
	and
		b1_and_1(for_b1, P[0], Bin);
	or
		b1_or_1(B[1], for_b1, G[0]);

	//B2
	wire for_b2[0:1];
	and
		b2_and_1(for_b2[0], P[1], P[0], Bin),
		b2_and_2(for_b2[1], P[1], G[0]);
	or
		b2_or_1(B[2], for_b2[0], for_b2[1], G[1]);

	//B3
	wire for_b3[0:2];
	and
		b3_and_1(for_b3[0], P[2], P[1], P[0], Bin),
		b3_and_2(for_b3[1], P[2], P[1], G[0]),
		b3_and_3(for_b3[2], P[2], G[1]);
	or
		b3_or_1(B[3], for_b3[0], for_b3[1], for_b3[2], G[2]);

	//B4
	wire for_b4[0:3];
	and
		b4_and_1(for_b4[0], P[3], P[2], P[1], P[0], Bin),
		b4_and_2(for_b4[1], P[3], P[2], P[1], G[0]);
		b4_and_3(for_b4[2], P[3], P[2], G[1]);
		b4_and_4(for_b4[3], P[3], G[2]);
	or
		b4_or_1(Bout, for_b4[0], for_b4[1], for_b4[2], for_b4[3], G[3]);
*/

endmodule