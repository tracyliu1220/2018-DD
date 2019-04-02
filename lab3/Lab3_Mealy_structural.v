module Lab3_Mealy_structural(z, x, clock, reset);
	output z;
	//output tmpz;
	input x, clock, reset;
	wire A, B;
	wire Aj, Ak, Bj, Bk;
	// wire tmpz;

	assign Aj = B ^ x;
	assign Ak = !x;
	assign Bj = x || !A;
	assign Bk = !x && !A;
	//assign tmpz = !B && !x;
	assign z = !B && !x;

	// always @ (posedge clock, negedge reset)
	// 	if(!reset) z <= !x;
	// 	else z <= tmpz;

	JK_ff_AR JK1(A, Aj, Ak, clock, reset);
	JK_ff_AR JK2(B, Bj, Bk, clock, reset);
endmodule

