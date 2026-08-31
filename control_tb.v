`timescale 1 ns/10 ps
module control_tb();
parameter SIZE = 2'b00;

reg clk, start, reset; //input
reg [1:0] N; 

wire write, read, enable, direction; //output
wire true;
wire [5:0]counter;
wire [2:0]current_state;
wire [1:0] N1, N2;
integer fd;//fichier imput 
integer status;//valeur lu
wire [1:0] N_read; 

reg [31:0] vectornum; // variáveis para controle
control DUV(.start(start), .clk(clk), .reset(reset), .N(N), .enable(enable), .read(read), .write(write), .direction(direction), .counter(counter), .current_state(current_state), .N1(N1), .N2(N2));

always begin
	clk = 1; #5; clk = 0; #5; // clock com período de 10ns
end

initial begin // carrega os vetores de teste no início da simulação
	 // inicializa controle
	reset = 1;
	start = 0;
	true = 1;
	vectornum = 0;
	N = SIZE;
	#11;
	reset = 0;
	start = 1;
end

always @(negedge clk)begin
	if (!$feof(fd)) begin
		status=$fscanf(fd, )
	end
	if (status!=)begin
		$display("Erreur de lecture : %0d valeurs lues", status);
        $finish;
	end
	if (vectornum == 64) begin 
		$finish;
	end // termina a simulação após passar por todos os testes

	

	end

// aplica cada vetor de teste em uma borda de subida do relógio
always @(posedge clk) begin
	N<=N_read
	vectornum = vectornum + 1;
end

// verifica o resultado na borda de descida
	if (vectornum == 64)
		$finish; // termina a simulação após passar por todos os testes

endmodule