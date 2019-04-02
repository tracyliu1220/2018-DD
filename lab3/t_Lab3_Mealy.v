module t_Lab3_Mealy;
	reg x, clock, reset;
	wire Zd, Zs;

	Lab3_Mealy_state_diagram Md(Zd, x, clock, reset);
	Lab3_Mealy_structural Ms(Zs, x, clock, reset);

	initial #200 $finish;

	initial begin
		reset = 0;
		clock = 0;
		#5 reset = 1;
		repeat(18)
			#5 clock = ~clock;
	end



	initial begin
		x = 0;
		#19 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
	end


endmodule


