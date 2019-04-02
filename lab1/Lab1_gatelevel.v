module Lab1_gatelevel(F, A, B, C, D);
	output F;
	input A, B, C, D;
	wire A_not, D_not, w1, w2, w3, w4, w5;

	not G_not_1(A_not, A);
	not G_not_2(D_not, D);
	and G_and_1(w1, A, B);
	and G_and_2(w2, C, D_not);
	and G_and_3(w3, B, D);
	or G_or_1(w4, w1, w2);
	or G_or_2(w5, A_not, w3);
	and G_and_4(F, w4, w5);
endmodule

