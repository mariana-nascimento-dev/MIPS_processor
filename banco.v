module banco (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock, result, result2, result3);
	input [4:0] Read1, Read2, WriteReg;
   input [31:0] WriteData;
   input RegWrite, clock;
   output reg [31:0] Data1, Data2;
	output reg[31:0]result;
	output reg[31:0]result2;
	output reg[31:0]result3;
	

    // Define 32 registradores de 32 bits cada
    reg [31:0] registradores [31:0];
	 reg controler = 0;
	 
	 integer i;	 
    always @(posedge clock ) begin
	 if(!controler) begin

    // Inicializacao dos registradores 
        registradores[8] <= {29'b0, 3'b101};
		  registradores[9] <= {29'b0, 3'b101};
		  registradores[10] <= {31'b0,1'b1};
		  registradores[16] <= {27'b0,5'b00000};//endereco que vai ser usado na memoria de dados
		  //registradores[17] <= {27'b0,5'b00010};
		  registradores[12] <= {27'b0,5'b00100};
		  //registradores[18] <= {30'b0,2'b10};
		  controler <=1;
		  end

    

    // Escrita nos registradores
	 
        else if (RegWrite) begin
					registradores[WriteReg] <= WriteData;  // Escreve no registrador selecionado									
        end
    end
	 
	 always@(* ) begin
	 
	
    //$display("Tempo: %0t | Novo valor do registrador[9]: %d", $time, registradores[9]);


	 // Leitura dos registradores
     Data1 = registradores[Read1];
     Data2 = registradores[Read2];
	  
	  result = registradores[8];
	  result2 = registradores[10];
	  result3 = registradores[16];
	  
	  
	  end
	  
	  

	 
endmodule





