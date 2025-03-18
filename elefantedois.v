module elefantedois(address, memWrite, memRead, clock, writeData, readData);

input [4:0] address;
input memWrite, memRead, clock;
input [31:0] writeData;
output reg [31:0] readData;


    
    // Definicao da memoria: 32 posicoes de 32 bits
    reg [7:0] memory [31:0];

	 //inicializacao na mao
	 initial begin
	
		memory[0] = 8'b00000000; 
		memory[1] = 8'b00000000; 
		memory[2] = 8'b00000000; 
		memory[3] = 8'b00000000;
		memory[4] = 8'b00000000; 
		memory[5] = 8'b00000000;
		memory[6] = 8'b00000000;
		memory[7] = 8'b00000000;
		memory[8] = 8'b00000000;
		memory[9] = 8'b00000000;
		memory[10] = 8'b00000000;
		memory[11] = 8'b00000000;
		memory[12] = 8'b00000000;
		memory[13] = 8'b00000000;
		memory[14] = 8'b00000000;
		memory[15] = 8'b00000000;
		memory[16] = 8'b00000010; //inicializando o numero 2
		memory[17] = 8'b00000000;
		memory[18] = 8'b00000000;
		memory[19] = 8'b00000000;
		memory[20] = 8'b00000000; 
		memory[21] = 8'b00000000; 
		memory[22] = 8'b00000000; 
		memory[23] = 8'b00000000; 
		memory[24] = 8'b00000000; 
		memory[25] = 8'b00000000; 
		memory[26] = 8'b00000000; 
		memory[27] = 8'b00000000; 
		memory[28] = 8'b00000000; 
		memory[29] = 8'b00000000; 
		memory[30] = 8'b00000000; 
		memory[31] = 8'b00000000; 
		
   end
   
	

    // opercao de leitura e escrita na memoria
    always @(posedge clock) begin
        if (memWrite) begin
		  
            memory[address+3] <= writeData[31:24];
				memory[address+2] <= writeData[23:16];
				memory[address+1] <= writeData[15:8];
				memory[address] <= writeData[7:0];	// Escreve o dado na posicao indicada por 'address'
        end  
	 end
	 always @(negedge clock) begin  
	     if (memRead) begin
            readData <= {memory[address+3], memory[address + 2], memory[address + 1], memory[address]};  // le o dado da posicao indicada por 'address'
        end
	 end

endmodule


