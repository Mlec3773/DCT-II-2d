module dct2_4_1 #(parameter WIDTH =12)(input signed [WIDTH-1:0]X[0:3], 
output signed [WIDTH+7:0] Ye[0:1], Yo[0:1]);

wire signed [WIDTH:0] E[0:1], O[0:1];


// even-odd decomposition
generate
genvar i;
	for (i = 0; i < 2; i = i + 1) begin: dcmploop
		decomp_3_1 #(.WIDTH(WIDTH))decomposition(X[i], X[3-i], E[i], O[i]);
	end
endgenerate


	// T2O
assign Ye[0] = (E[0] << 6) + (E[1] << 6);
assign Ye[1] = (E[0] << 6) - (E[1] << 6);

	// T2E
wire signed [WIDTH+7:0] x36[0:1], x83[0:1];

		// SAU
sau_2o_1 #(.WIDTH(WIDTH+1)) sau_0(O[0],x36[0],x83[0]);
sau_2o_1 #(.WIDTH(WIDTH+1)) sau_1(O[1],x36[1],x83[1]);

assign Yo[0] = x83[0] + x36[1];
assign Yo[1] = x36[0] - x83[1];
	

endmodule
