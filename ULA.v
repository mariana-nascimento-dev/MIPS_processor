module ULA(SW, LEDR);
input [17:0]SW;
output[17:0]LEDR;
	
//(sc, a, b, saida, overflow);
ULA32 BLOCO1(SW[17:15], SW[14:8], SW[6:0], LEDR[16:0], LEDR[17]);

endmodule	