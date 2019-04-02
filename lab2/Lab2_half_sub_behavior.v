module Lab2_half_sub_behavior(output D, B, input x, y);
	reg d, b;
	always @ (x or y) begin
		b <= !x && y;
		d <= x ^ y;
	end
	assign B = b;
	assign D = d;
endmodule