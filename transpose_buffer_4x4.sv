module transpose_buffer_4x4 (
    clock,
    reset,
    enable_read,
    enable_write,
    direction,
    in_0,
    in_1,
    in_2,
    in_3,
    out_0,
    out_1,
    out_2
    out_3
);

parameter DATA_WIDTH = 18;
input clock, reset, enable_read, enable_write, direction;
output signed [DATA_WIDTH-1:0] out_0, out_1, out_2, out_3;
input signed [DATA_WIDTH-1:0] in_0, in_1, in_2, in_3;
wire signed [DATA_WIDTH-1:0] out_of_0_0, out_of_0_1, out_of_0_2, out_of_0_3, out_of_1_0, out_of_1_1, out_of_1_2, out_of_1_3, out_of_2_0, out_of_2_1, out_of_2_2, out_of_2_3, out_of_3_0, out_of_3_1, out_of_3_2, out_of_3_3;

wire enable_row_0, enable_col_0, enable_elem

endmodule