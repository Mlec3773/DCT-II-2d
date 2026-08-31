`timescale 1 ns/10 ps
module transpose_buffer_tb();

reg clock, reset, enable, direction; //input
reg enable_read, direction_read;
// reg signed [15:0] test_vect [0:32]; // entrées concaténés 
reg signed [15:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15, in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23, in_24, in_25, in_26, in_27, in_28, in_29, in_30, in_31; //registre des entrées via le fichier txt
int k; //constante de boucle
int Erreur =0;
reg signed [(32*16)-1:0] in_test;

//output
wire signed [15:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15, out_16, out_17, out_18, out_19, out_20, out_21, out_22, out_23, out_24, out_25, out_26, out_27, out_28, out_29, out_30, out_31;

reg [31:0] vectornum; // variable de controle
reg signed [15:0] out [31:0];
transpose_buffer_32x32 DUV(clock, reset, enable, direction, in_test, out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15, out_16, out_17, out_18, out_19, out_20, out_21, out_22, out_23, out_24, out_25, out_26, out_27, out_28, out_29, out_30, out_31);
integer fd; //fichier input
integer status;//valeur lu

assign in_test = {
    in_0, in_1, in_2, in_3,
    in_4, in_5, in_6, in_7,
    in_8, in_9, in_10, in_11,
    in_12, in_13, in_14, in_15,
    in_16, in_17, in_18, in_19,
    in_20, in_21, in_22, in_23,
    in_24, in_25, in_26, in_27,
    in_28, in_29, in_30, in_31
};
always begin
	clock = 1; #5; clock = 0; #5; // horloge de période 10ns
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
    if(out_0!=0) begin 
		Erreur =Erreur + 1;
		$display("out_0  = %0d au lieu de 0", out_0);end;
    if(out_1!=0) begin Erreur = Erreur + 1;$display("out_1  = %0d au lieu de 0", out_1);end
    if(out_2!=0) begin Erreur = Erreur + 1;$display("out_2  = %0d au lieu de 0", out_2);end
    if(out_3!=0) begin Erreur = Erreur + 1;$display("out_3  = %0d au lieu de 0", out_3);end
    if(out_4!=0) begin Erreur = Erreur + 1;$display("out_4  = %0d au lieu de 0", out_4);end
    if(out_5!=0) begin Erreur = Erreur + 1;$display("out_5  = %0d au lieu de 0", out_5);end
    if(out_6!=0) begin Erreur = Erreur + 1;$display("out_6  = %0d au lieu de 0", out_6);end
    if(out_7!=0) begin Erreur = Erreur + 1;$display("out_7  = %0d au lieu de 0", out_7);end
    if(out_8!=0) begin Erreur = Erreur + 1;$display("out_8  = %0d au lieu de 0", out_8);end
    if(out_9!=0) begin Erreur = Erreur + 1;$display("out_9  = %0d au lieu de 0", out_9);end
    if(out_10!=0) begin Erreur = Erreur + 1;$display("out_10 = %0d au lieu de 0", out_10);end
    if(out_11!=0) begin Erreur = Erreur + 1;$display("out_11 = %0d au lieu de 0", out_11);end
    if(out_12!=0) begin Erreur = Erreur + 1;$display("out_12 = %0d au lieu de 0", out_12);end
    if(out_13!=0) begin Erreur = Erreur + 1;$display("out_13 = %0d au lieu de 0", out_13);end
    if(out_14!=0) begin Erreur = Erreur + 1;$display("out_14 = %0d au lieu de 0", out_14);end
    if(out_15!=0) begin Erreur = Erreur + 1;$display("out_15 = %0d au lieu de 0", out_15);end
    if(out_16!=0) begin Erreur = Erreur + 1;$display("out_16 = %0d au lieu de 0", out_16);end
    if(out_17!=0) begin Erreur = Erreur + 1;$display("out_17 = %0d au lieu de 0", out_17);end
    if(out_18!=0) begin Erreur = Erreur + 1;$display("out_18 = %0d au lieu de 0", out_18);end
    if(out_19!=0) begin Erreur = Erreur + 1;$display("out_19 = %0d au lieu de 0", out_19);end
    if(out_20!=0) begin Erreur = Erreur + 1;$display("out_20 = %0d au lieu de 0", out_20);end
    if(out_21!=0) begin Erreur = Erreur + 1;$display("out_21 = %0d au lieu de 0", out_21);end
    if(out_22!=0) begin Erreur = Erreur + 1;$display("out_22 = %0d au lieu de 0", out_22);end
    if(out_23!=0) begin Erreur = Erreur + 1;$display("out_23 = %0d au lieu de 0", out_23);end
    if(out_24!=0) begin Erreur = Erreur + 1;$display("out_24 = %0d au lieu de 0", out_24);end
    if(out_25!=0) begin Erreur = Erreur + 1;$display("out_25 = %0d au lieu de 0", out_25);end
    if(out_26!=0) begin Erreur = Erreur + 1;$display("out_26 = %0d au lieu de 0", out_26);end
    if(out_27!=0) begin Erreur = Erreur + 1;$display("out_27 = %0d au lieu de 0", out_27);end
    if(out_28!=0) begin Erreur = Erreur + 1;$display("out_28 = %0d au lieu de 0", out_28);end
    if(out_29!=0) begin Erreur = Erreur + 1;$display("out_29 = %0d au lieu de 0", out_29);end
    if(out_30!=0) begin Erreur = Erreur + 1;$display("out_30 = %0d au lieu de 0", out_30);end
    if(out_31!=0) begin Erreur = Erreur + 1;$display("out_31 = %0d au lieu de 0", out_31);end
end
endtask
initial begin // carrega os vetores de teste no início da simulação
	 // inicializa controle
	reset = 1;
	enable_read=0;
	direction_read= 0;
	vectornum = 0;
	fd = $fopen("/home/cklein/stage/TSMC_TCBN65GPHPBWPWC/Marco_files/DIGITAL/DCT-II-2d/verif/simple_tb/test_buffer.txt", "r");
	if (fd == 0) begin
    	$display("Impossible d'ouvrir test_buffer.txt");
    	$finish;
	end	
	#2;
	display_outputs();
	reset = 0;
end

// aplica cada vetor de teste em uma borda de subida do relógio
always @(posedge clock) begin
	
	enable<= enable_read;
	direction<=direction_read;
	vectornum = vectornum + 1;
	if(vectornum==0)begin
		direction<=0;
		enable <= 1;
	end
	#1;
	$display("---------------------------");
	$display("vectornum = %d", vectornum);
	if(vectornum <31) begin//1 clock  di'initialisation + 31 de remplissage
		display_outputs();
		$display("enable=%b direction=%b", enable, direction);
		$display("tb : in_0=%d in_1=%d in_2=%d in_31=%d", in_0, in_1, in_2, in_31);
	end
	
	else if (vectornum >= 33 && vectornum < 68) begin
		$display("---------------------------");

	for (k=0; k<32; k=k+1) //32 de lecture de colonne par la droite + 5 cycles ou enable=0(voir test_buffer.txt)
	begin
    	if (out[k] != (32-k))begin
        	$display("ERREUR out[%0d]=%0d attendu=%0d",
            k,out[k],32-k);
			Erreur = Erreur + 1;end
//     	else
//         	$display("OK out[%0d]=%0d",
//             k,out[k]);
	end
	$display("---------------------------");
	end

	//si on change un cycle en amont les valeurs de  enable, reset, direction alors on a directement les valeurs correctes souhaité en sorties
	// if(vectornum==68)begin
	// 	for(k=0;k<32;k=k+1)begin
	// 		if (out[k] != 1)begin
    //     	$display("ERREUR out[%0d]=%0d attendu=1",
    //         k,out[k]);
	// 		Erreur = Erreur + 1;end
	// 	end
	// end	
	else if (vectornum > 68) begin
    	for (k=0; k<32; k=k+1) begin
        	if (out[k] != (k+1))begin
            	$display("ERREUR out[%0d]=%0d attendu=%0d",
                     k, out[k], k+1);
					 Erreur = Erreur + 1;end
       		//  else
            // 	$display("OK out[%0d]=%0d",
            //          k, out[k]);
    	end
	end
end
// verifica o resultado na borda de descida
always @(negedge clock) begin
	if (!$feof(fd)) begin
        status=$fscanf(fd,
"%b %b %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d",
		enable_read,direction_read,
		in_0, in_1, in_2, in_3,
		in_4, in_5, in_6, in_7,
		in_8, in_9, in_10, in_11,
		in_12, in_13, in_14, in_15,
		in_16, in_17, in_18, in_19,
		in_20, in_21, in_22, in_23,
		in_24, in_25, in_26, in_27,
		in_28, in_29, in_30, in_31);

        if (status != 34) begin
            $display("Erreur de lecture : %0d valeurs lues", status);
            $finish;
        end
    end
	if (vectornum == 99) begin
		$display("Nombre d'erreurs : %d", Erreur);
		if(Erreur==0) $display("Simulation réussite");
		$finish; // termina a simulação após passar por todos os testes
	end
end
endmodule