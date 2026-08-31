`timescale 1 ns/10 ps
module transpose_buffer_tb();

reg clock, reset, enable, direction; //input
reg signed [15:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15, in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23, in_24, in_25, in_26, in_27, in_28, in_29, in_30, in_31;
int k;
//output
wire signed [15:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15, out_16, out_17, out_18, out_19, out_20, out_21, out_22, out_23, out_24, out_25, out_26, out_27, out_28, out_29, out_30, out_31;

reg [31:0] vectornum; // variáveis para controle
wire signed [15:0] out [31:0];
transpose_buffer_32x32 DUV(clock, reset, enable, direction, in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15, in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23, in_24, in_25, in_26, in_27, in_28, in_29, in_30, in_31, out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15, out_16, out_17, out_18, out_19, out_20, out_21, out_22, out_23, out_24, out_25, out_26, out_27, out_28, out_29, out_30, out_31);

always begin
	clock = 1; #5; clock = 0; #5; // clock com período de 10ns
end
always_comb begin : sortie
	out[0]=out_0;
	out[1]=out_1;
	out[2]=out_2;
	out[3]=out_3;
	out[4]=out_4;
	out[5]=out_5;
	out[6]=out_6;
	out[7]=out_7;
	out[8]=out_8;
	out[9]=out_9;
	out[10]=out_10;
	out[11]=out_11;
	out[12]=out_12;
	out[13]=out_13;
	out[14]=out_14;
	out[15]=out_15;
	out[16]=out_16;
	out[17]=out_17;
	out[18]=out_18;
	out[19]=out_19;
	out[20]=out_20;
	out[21]=out_21;
	out[22]=out_22;
	out[23]=out_23;
	out[24]=out_24;
	out[25]=out_25;
	out[26]=out_26;
	out[27]=out_27;
	out[28]=out_28;
	out[29]=out_29;
	out[30]=out_30;
	out[31]=out_31;
end	
task display_outputs;
begin
    $display("------------------------------------------------");
    $display("out_0  = %0d au lieu de 0", out_0);
    $display("out_1  = %0d au lieu de 0", out_1);
    $display("out_2  = %0d au lieu de 0", out_2);
    $display("out_3  = %0d au lieu de 0", out_3);
    $display("out_4  = %0d au lieu de 0", out_4);
    $display("out_5  = %0d au lieu de 0", out_5);
    $display("out_6  = %0d au lieu de 0", out_6);
    $display("out_7  = %0d au lieu de 0", out_7);
    $display("out_8  = %0d au lieu de 0", out_8);
    $display("out_9  = %0d au lieu de 0", out_9);
    $display("out_10 = %0d au lieu de 0", out_10);
    $display("out_11 = %0d au lieu de 0", out_11);
    $display("out_12 = %0d au lieu de 0", out_12);
    $display("out_13 = %0d au lieu de 0", out_13);
    $display("out_14 = %0d au lieu de 0", out_14);
    $display("out_15 = %0d au lieu de 0", out_15);
    $display("out_16 = %0d au lieu de 0", out_16);
    $display("out_17 = %0d au lieu de 0", out_17);
    $display("out_18 = %0d au lieu de 0", out_18);
    $display("out_19 = %0d au lieu de 0", out_19);
    $display("out_20 = %0d au lieu de 0", out_20);
    $display("out_21 = %0d au lieu de 0", out_21);
    $display("out_22 = %0d au lieu de 0", out_22);
    $display("out_23 = %0d au lieu de 0", out_23);
    $display("out_24 = %0d au lieu de 0", out_24);
    $display("out_25 = %0d au lieu de 0", out_25);
    $display("out_26 = %0d au lieu de 0", out_26);
    $display("out_27 = %0d au lieu de 0", out_27);
    $display("out_28 = %0d au lieu de 0", out_28);
    $display("out_29 = %0d au lieu de 0", out_29);
    $display("out_30 = %0d au lieu de 0", out_30);
    $display("out_31 = %0d au lieu de 0", out_31);
    $display("------------------------------------------------");
end
endtask
initial begin // carrega os vetores de teste no início da simulação
	 // inicializa controle
	reset = 1;
	vectornum = 0;
	#11;
	display_outputs();
	reset = 0;
end

// aplica cada vetor de teste em uma borda de subida do relógio
always @(posedge clock) begin
	vectornum = vectornum + 1;
	if(vectornum <33) display_outputs();
	else if (vectornum > 32 && vectornum < 65){
		$display("---------------------------");

	for (k=0; k<32; k=k+1)
	begin
    	if (out[k] != (k+1))
        	$display("ERREUR out[%0d]=%0d attendu=%0d",
            k,out[k],k+1);
    	else
        	$display("OK out[%0d]=%0d",
            k,out[k]);
	end
	$display("---------------------------");}
	else if(vectornum==65)	display_outputs();
	else if (vectornum > 65) begin
    	for (k=0; k<32; k=k+1) begin
        	if (out[k] != (k+1))
            	$display("ERREUR out[%0d]=%0d attendu=%0d",
                     k, out[k], k+1);
       		 else
            	$display("OK out[%0d]=%0d",
                     k, out[k]);
    	end
	end
end
// verifica o resultado na borda de descida
always @(negedge clock) begin
	if (vectornum == 97)
		$finish; // termina a simulação após passar por todos os testes
end
endmodule