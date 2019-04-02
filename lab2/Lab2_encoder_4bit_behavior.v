module Lab2_encoder_4bit_behavior (output [1:0] Aout, output V, input [3:0] D);

	reg A0, A1, V_;
	always @ (D) begin
		A1 = !D[1] && !D[0];
		A0 = D[1] && !D[0] || !D[2] && !D[0];
		V_ = D[0] || D[1] || D[2] || D[3];
	end
	assign Aout[1] = A1;
	assign Aout[0] = A0;
	assign V = V_;

endmodule
