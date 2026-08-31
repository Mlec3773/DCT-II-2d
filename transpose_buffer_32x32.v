module transpose_buffer_32x32 (
	input clock, reset, enable, direction, in_buffer, read, write,
	wire [1:0]N1,N2,
	out_0,
	out_1,
	out_2,
	out_3,
	out_4,
	out_5,
	out_6,
	out_7,
	out_8,
	out_9,
	out_10,
	out_11,
	out_12,
	out_13,
	out_14,
	out_15,
	out_16,
	out_17,
	out_18,
	out_19,
	out_20,
	out_21,
	out_22,
	out_23,
	out_24,
	out_25,
	out_26,
	out_27,
	out_28,
	out_29,
	out_30,
	out_31
);

parameter DATA_WIDTH = 16;
input  signed [(32*DATA_WIDTH)-1:0] in_buffer;
wire  signed [DATA_WIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15, in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23, in_24, in_25, in_26, in_27, in_28, in_29, in_30, in_31;
output signed [DATA_WIDTH-1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15, out_16, out_17, out_18, out_19, out_20, out_21, out_22, out_23, out_24, out_25, out_26, out_27, out_28, out_29, out_30, out_31;
logic signed [DATA_WIDTH-1:0] out_of[0:31] [0:31];
logic signed [DATA_WIDTH-1:0] in [0:31];
//wire for logic enable
wire N1_00 = (N1 == 2'b00);
wire N1_01 = (N1 == 2'b01);
wire N1_10 = (N1 == 2'b10);
wire N1_11 = (N1 == 2'b11);
wire N2_00 = (N2 == 2'b00);
wire N2_01 = (N2 == 2'b01);
wire N2_10 = (N2 == 2'b10);
wire N2_11 = (N2 == 2'b11);
wire enable_32 = (N1_11||N2_11);
wire enable_16_left;
wire enable_16_right;
wire enable_8_left;
wire enable_8_right;
wire enable_4_left=(write||(!direction));
wire enable_4_rifht=(write||(direction));
enable_16_left = (direction)
    ? (((!N2_10) && (!N2_00) || N1_11 || write)
       && (N1_11 || (!N2_00)))
    : (((!N1_10) && (!N1_00) || N2_11 || read)
       && (N2_11 || (!N1_00)));
enable_8_left = (direction)
    ? (((!N2_10) && (!N2_00) || N1_11 || write)
       && (N1_11 || (!N2_00)))
    : (((!N2_10) && (!N2_00) || N1_11 || write)
       && (N1_11 || (!N2_00)));
enable_16_right;
enable_8_right;

genvar k;

generate
    for (k = 0; k < 32; i++) begin : GEN_INPUT
        assign in[k] = in_buffer[(31-k)*DATA_WIDTH +: DATA_WIDTH];
    end
endgenerate
genvar i, j;
generate
	for (i = 0; i<32 ; i++) begin : ROW
		for (j = 0; j<32 ; j++ ) begin : COL

			if (i==0 && j ==0) begin : FIRST
				transpose_buffer_cell #(DATA_WIDTH) tb_cell (
					clock,
					reset,
					enable && read,
					dir ection,
					in[31],
					in[0],
					out_of[0][0]
				);

			end
			else if (i==0) begin : FIRST_ROW
				transpose_buffer_cell #(DATA_WIDTH) tb_cell (
					clock,
					reset,
					enable,
					direction,
					in[31-j],
					out_of[0][j-1],
					out_of[0][j]
				);				
			end
			else if (j==0) begin : FIRST_COL
				transpose_buffer_cell #(DATA_WIDTH) tb_cell (
                    clock,
                    reset,
                    enable,
                    direction,
                    out_of[i-1][0],
                    in[i],
                    out_of[i][0]
                );				
			end
			else begin
				transpose_buffer_cell #(DATA_WIDTH) tb_cell (
                    clock,
                    reset,
                    enable,
                    direction,
                    out_of[i-1][j],
                    out_of[i][j-1],
                    out_of[i][j]
                );
			end

		end
		
	end
endgenerate

assign {in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15, in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23, in_24, in_25, in_26, in_27, in_28, in_29, in_30, in_31} = in_buffer;
// always @(posedge clock)begin
//     $display("direction=%0d", direction);
// 	$display("out_of_31 : \ 0=%0d 1=%0d 2=%0d 3=%0d 4=%0d 5=%0d 6=%0d 7=%0d \ 8=%0d 9=%0d 10=%0d 11=%0d 12=%0d 13=%0d 14=%0d 15=%0d \ 16=%0d 17=%0d 18=%0d 19=%0d 20=%0d 21=%0d 22=%0d 23=%0d \ 24=%0d 25=%0d 26=%0d 27=%0d 28=%0d 29=%0d 30=%0d 31=%0d",
// out_of_31_0, out_of_31_1, out_of_31_2, out_of_31_3,
// out_of_31_4, out_of_31_5, out_of_31_6, out_of_31_7,
// out_of_31_8, out_of_31_9, out_of_31_10, out_of_31_11,
// out_of_31_12, out_of_31_13, out_of_31_14, out_of_31_15,
// out_of_31_16, out_of_31_17, out_of_31_18, out_of_31_19,
// out_of_31_20, out_of_31_21, out_of_31_22, out_of_31_23,
// out_of_31_24, out_of_31_25, out_of_31_26, out_of_31_27,
// out_of_31_28, out_of_31_29, out_of_31_30, out_of_31_31);
// $display("out_of_31_col : \ 0=%0d 1=%0d 2=%0d 3=%0d 4=%0d 5=%0d 6=%0d 7=%0d \ 8=%0d 9=%0d 10=%0d 11=%0d 12=%0d 13=%0d 14=%0d 15=%0d \ 16=%0d 17=%0d 18=%0d 19=%0d 20=%0d 21=%0d 22=%0d 23=%0d \ 24=%0d 25=%0d 26=%0d 27=%0d 28=%0d 29=%0d 30=%0d 31=%0d",
// out_of_0_31, out_of_1_31, out_of_2_31, out_of_3_31,
// out_of_4_31, out_of_5_31, out_of_6_31, out_of_7_31,
// out_of_8_31, out_of_9_31, out_of_10_31, out_of_11_31,
// out_of_12_31, out_of_13_31, out_of_14_31, out_of_15_31,
// out_of_16_31, out_of_17_31, out_of_18_31, out_of_19_31,
// out_of_20_31, out_of_21_31, out_of_22_31, out_of_23_31,
// out_of_24_31, out_of_25_31, out_of_26_31, out_of_27_31,
// out_of_28_31, out_of_29_31, out_of_30_31, out_of_31_31);
// 	$display("reset=%0d enable=%0d in0=%0d in1=%0d \ ",
//              reset, enable, in_0, in_1);
// end


assign out_0  = (direction) ? out_of[0][31]  : out_of[31][31];
assign out_1  = (direction) ? out_of[1][31]  : out_of[31][30];
assign out_2  = (direction) ? out_of[2][31]  : out_of[31][29];
assign out_3  = (direction) ? out_of[3][31]  : out_of[31][28];
assign out_4  = (direction) ? out_of[4][31]  : out_of[31][27];
assign out_5  = (direction) ? out_of[5][31]  : out_of[31][26];
assign out_6  = (direction) ? out_of[6][31]  : out_of[31][25];
assign out_7  = (direction) ? out_of[7][31]  : out_of[31][24];
assign out_8  = (direction) ? out_of[8][31]  : out_of[31][23];
assign out_9  = (direction) ? out_of[9][31]  : out_of[31][22];
assign out_10 = (direction) ? out_of[10][31]  : out_of[31][21];
assign out_11 = (direction) ? out_of[11][31]  : out_of[31][20];
assign out_12 = (direction) ? out_of[12][31]  : out_of[31][19];
assign out_13 = (direction) ? out_of[13][31]  : out_of[31][18];
assign out_14 = (direction) ? out_of[14][31]  : out_of[31][17];
assign out_15 = (direction) ? out_of[15][31]  : out_of[31][16];
assign out_16 = (direction) ? out_of[16][31]  : out_of[31][15];
assign out_17 = (direction) ? out_of[17][31]  : out_of[31][14];
assign out_18 = (direction) ? out_of[18][31]  : out_of[31][13];
assign out_19 = (direction) ? out_of[19][31]  : out_of[31][12];
assign out_20 = (direction) ? out_of[20][31]  : out_of[31][11];
assign out_21 = (direction) ? out_of[21][31]  : out_of[31][10];
assign out_22 = (direction) ? out_of[22][31]  : out_of[31][9];
assign out_23 = (direction) ? out_of[23][31]  : out_of[31][8];
assign out_24 = (direction) ? out_of[24][31]  : out_of[31][7];
assign out_25 = (direction) ? out_of[25][31]  : out_of[31][6];
assign out_26 = (direction) ? out_of[26][31]  : out_of[31][5];
assign out_27 = (direction) ? out_of[27][31]  : out_of[31][4];
assign out_28 = (direction) ? out_of[28][31]  : out_of[31][3];
assign out_29 = (direction) ? out_of[29][31]  : out_of[31][2];
assign out_30 = (direction) ? out_of[30][31]  : out_of[31][1];
assign out_31 = (direction) ? out_of[31][31]  : out_of[31][0];

endmodule
