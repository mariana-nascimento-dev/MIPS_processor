 module adevogada(reset, clock, ULAresult, overflow, pc, instr, Data1, Data2, saidaMux, zero, result, result2, result3, readData);

	 input reset, clock;
	 wire [1:0] ALUop;     // PC
    wire [4:0] next_pc, next_pc2, next_pc3;  // Proximo PC
    wire carry_out;      // Carry-out do somador
	 wire [31:0] saidaEx;
	 wire [31:0] writeData;
	 wire [31:0] saidaShiftBeq, saidaUlaCima;
	 wire ALUSrc, RegWrite, RegDst, MemToReg, MemRead, MemWrite, Branch, Jump;
	 wire [2:0]operation;
	 wire [4:0] saidaMuxBanco;
	 output zero, overflow;
	 output [31:0] ULAresult;
    output [4:0] pc;  
    output [31:0] instr;   // Instrucao lida da memoria
	 output [31:0] Data1, Data2;
	 output [31:0] saidaMux;
	 output [31:0]result;
	 output [31:0]result2, result3;
	 output [31:0]readData;
	 

    // Instancia do contador de programa (PC)
    countPC BLOCO1 (next_pc, reset, clock, pc);

    // Instancia da memoria de instruoes
    memoriainstrucoes BLOCO3(pc, instr);
	 
	 //unidade de controle
	 //opcode, ALUop, ALUSrc, RegWrite, RegDst, MemToReg, MemRead, MemWrite, Branch
	 bancoInstrucoes BLOCO9(instr[31:26],ALUop, ALUSrc, RegWrite, RegDst, MemToReg, MemRead, MemWrite, Branch, Jump);
	 
	 //module MuxBanco(a, b, seletora, saida);
	 MuxBanco BLOCO51(instr[20:16],instr[15:11],RegDst, saidaMuxBanco);
	 
	 //chamada banco de reg
	 //(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock); 
	 banco BLOCO4(instr[25:21], instr[20:16], saidaMuxBanco[4:0], writeData ,RegWrite, Data1, Data2, clock, result, result2, result3);
	 
	 //chamada do extensor
	 rex BLOCO5 (instr[15:0], saidaEx);
	 
	 //chamada do mux
	 mari8 BLOCO6 (Data2,saidaEx,ALUSrc, saidaMux);
	 
	 //func, ALUop, operation
	 ULAControl BLOCO52 (instr[5:0],ALUop,operation);
	 
	 //chamada ULA
	 //(sc, a, b, saida, overflow);
	 ULA32 BLOCO7(operation, Data1, saidaMux, ULAresult, overflow, zero);
	 
	 //chamada memoria de dados
	 //(address, memWrite, memRead, clock, writeData, readData, memoria, memoria4);
	 elefantedois BLOCO70(ULAresult[4:0], MemWrite, MemRead, clock, Data2, readData);
	 
	 //mux memoria de dados
	 //(a, b, seletora, saida);
	 Muxelefante BLOCO71(ULAresult, readData, MemToReg, writeData);
	 
	 // Instancia do somador de 5 bits (para incrementar o PC)
    somador5bits BLOCO2(pc, 5'b00100,1'b0, ,next_pc2);
	 
	 //ShiftTwoBeq(entrada, saida);
	 ShiftTwoBeq BLOCO80(saidaEx, saidaShiftBeq);
	 
	 //ULACima (a, b, saida);
	 ULACima BLOCO81(saidaShiftBeq, next_pc2, saidaUlaCima);
	 
	 //Muxbeq(a, b, seletora, saida)
	 Muxbeq BLOCO82(next_pc2, saidaUlaCima, Branch & zero, next_pc3);
	 
	 //ShiftTwoJump(entrada, saida);
	 ShiftTwoJump BLOCO84(instr[25:0], saidaShiftJump);
	 
	 	 
	 //MuxJump(a, b, seletora, saida);
	 MuxJump BLOCO83(next_pc3,{next_pc, saidaShiftJump}, Jump, next_pc);
	 
	 
endmodule	