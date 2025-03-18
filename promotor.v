module promotor(SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	//clock e reset, intrucao e overflow, data1, data2, ULAresult, PC
input [17:0]SW;
output [0:6]HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
output [17:0]LEDR;
wire [31:0]resultado, Data1, Data2, saidaMux, instr;
wire [4:0] pc;
//(reset, clock, ULAresult, overflow, pc, instr, Data1, Data2, saidaMux, zero)
adevogada BLOCO20 (SW[17],SW[16], resultado, LEDR[17],pc, instr, Data1, Data2, saidaMux, LEDR[16]);

//assign LEDR[15:0] = instr[15:0];
assign LEDR[15:0] = instr[15:0];
wire [7:0] reg1uni, reg1dez, reg2uni, reg2dez, unid, dez, pcHexUni, pcHexDez;

assign reg1dez[7:0] = ((Data1[7:0] % 100)/10);
assign reg1uni[7:0] = (Data1[7:0] % 10);

assign reg2dez[7:0] = ((saidaMux[7:0] % 100)/10);
assign reg2uni[7:0] = (saidaMux[7:0] % 10);
		  
assign dez[7:0] = ((resultado[7:0] % 100)/10);
assign unid[7:0] = (resultado[7:0] %10);
        
assign pcHexDez = ((pc % 100)/10);
assign pcHexUni = (pc % 10);
		  
heitordecod BLOCO60(reg1dez, HEX5);
heitordecod BLOCO10(reg1uni, HEX4);

heitordecod BLOCO61(reg2dez, HEX3);
heitordecod BLOCO11(reg2uni, HEX2);

heitordecod BLOCO62(dez, HEX1);
heitordecod BLOCO12(unid, HEX0);

heitordecod BLOCO13(pcHexDez, HEX7);
heitordecod BLOCO63(pcHexUni, HEX6);


endmodule 