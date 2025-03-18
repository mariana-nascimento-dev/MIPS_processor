module memoriainstrucoes(readAddress, instruction);
	input [4:0] readAddress; // 5bits = 32 enderecos
   output reg [31:0] instruction;
   reg [7:0] memory [0:31]; // Memoria com 32 posicoes de 8 bits

	
	initial begin
       instruction = 32'b10001110000010000000000000000000;  
   end
	
   // Inicializacao da memoria
   initial begin
	
		memory[0] = 8'b00000000; 
		memory[1] = 8'b00000000; 
		memory[2] = 8'b00000000; 
		memory[3] = 8'b00000000; 
	
		//beq $8, $9, 12
		memory[4] = 8'b00010001; 
		memory[5] = 8'b00001001; 
		memory[6] = 8'b00000000; 
		memory[7] = 8'b00000001;
	
		//addi $8, $8, 2
		memory[8] = 8'b00100001; 
		memory[9] = 8'b00001000; 
		memory[10] = 8'b00000000; 
		memory[11] = 8'b00000010; 
		
		//sw $8, 0($12)
		memory[12] = 8'b10101101; 
		memory[13] = 8'b10001000; 
		memory[14] = 8'b00000000; 
		memory[15] = 8'b00000000; 
		
		//lw $16, 0($12)
		memory[16] = 8'b10001101; 
		memory[17] = 8'b10010000; 
		memory[18] = 8'b00000000; 
		memory[19] = 8'b00000000; 
		
		//sub $8, $16, $10
		memory[20] = 8'b00000010; 
		memory[21] = 8'b00001010; 
		memory[22] = 8'b01000000; 
		memory[23] = 8'b00100010; 
		
		//j 0
		memory[24] = 8'b00001000; 
		memory[25] = 8'b00000000; 
		memory[26] = 8'b00000000; 
		memory[27] = 8'b00000000; 
		
		//instanciando o resto da memoria
		
		memory[28] = 8'b00000000; 
		memory[29] = 8'b00000000; 
		memory[30] = 8'b00000000; 
		memory[31] = 8'b00000000; 
		
		
		
   end

   // Leitura da memoria (4 * 8 = 32 bits)
	wire [4:0]readAddress1, readAddress2, readAddress3;
	assign readAddress1 = readAddress+1;
	assign readAddress2 = readAddress+2;
	assign readAddress3 = readAddress+3;
	
   always @ (*) begin
		instruction = {memory[readAddress], memory[readAddress + 1], memory[readAddress + 2], memory[readAddress + 3]};
   end

endmodule 