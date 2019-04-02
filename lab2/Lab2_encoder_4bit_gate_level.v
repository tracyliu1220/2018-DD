module Lab2_encoder_4bit_gate_level (output [1:0] Aout, output V, input [3:0] D);

	wire not_D1, not_D0, not_D2;
	wire wA0_1, wA0_2;

	not
		G_not_1(not_D1, D[1]),
		G_not_2(not_D0, D[0]),
		G_not_3(not_D2, D[2]);
	and
		A1_and_1(Aout[1], not_D1, not_D0),
		A0_and_1(wA0_1, D[1], not_D0),
		A0_and_2(wA0_2, not_D2, not_D0);
	or
		A0_or_1(Aout[0], wA0_1, wA0_2),
		V_or(V, D[0], D[1], D[2], D[3]);


endmodule
