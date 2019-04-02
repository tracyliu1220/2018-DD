module t_Lab2_encoder_4bit;

	wire [1:0] Ad, Ag, Ab;
	wire Vd, Vg, Vb;
	reg [3:0] D;

	Lab2_encoder_4bit_gate_level Mg(Ag[1:0], Vg, D[3:0]);
	Lab2_encoder_4bit_dataflow Md(Ad[1:0], Vd, D[3:0]);
	Lab2_encoder_4bit_behavior Mb(Ab[1:0], Vb, D[3:0]);

	initial begin
			D = 4'b0000;
			repeat (15) #100 D = D + 4'b0001;
	end

	initial #1600 $finish;

endmodule