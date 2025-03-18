module adevogado(SW, LEDR, HEX0, HEX1, HEX2, HEX5);
	//clock e reset, intrução e overflow, data1, data2, ULAresult, PC
input [17:0]SW;
output [0:6]HEX0, HEX1, HEX2, HEX5;
output [17:0]LEDR;
wire [31:0]resultado, Data1, Data2, saidaMux, instr;
wire [4:0] pc;
//(reset, clock, ULAresult, overflow, pc, instr, Data1, Data2, saidaMux, zero)
adevogada BLOCO20 (SW[17],SW[16], resultado, LEDR[17],pc, instr, Data1, Data2, saidaMux, LEDR[16]);

//assign LEDR[15:0] = instr[15:0];
assign LEDR[15:0] = instr[15:0];
wire [7:0] reg1, reg2, unid, pcHex;


assign reg1 = ((Data1[7:0]) % 10);

assign reg2 = (Data2[7:0] % 10);
		  
assign unid = (resultado[7:0] %10);
        
assign pcHex = (pc % 10);
		  
		   //$display("Data1: %d, Data2: %d, Resultado: %d, PC: %d, instr: %d, reg1: %d, reg2: %d", Data1, Data2, resultado, pc, instr, reg1, reg2);
		  

heitordecod BLOCO10(reg1, HEX2);
heitordecod BLOCO11(reg2, HEX1);
heitordecod BLOCO12(unid, HEX0);
heitordecod BLOCO13(pcHex, HEX5);

endmodule 