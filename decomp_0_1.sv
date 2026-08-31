module decomp_0_1 #(parameter WIDTH =9)(input signed [WIDTH-1:0]a,b,
output signed [WIDTH:0] even, odd);

assign even = a + b;

assign odd = a - b;

endmodule