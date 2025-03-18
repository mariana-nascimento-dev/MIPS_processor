module heitordecod(entrada, saida);

input[7:0]entrada;
output reg [0:6] saida;

//bloco decodificador que transforma a entrada, que está em binario, em um número decimal no display 
always@(*) begin
case ({entrada}) 

8'b00000000: saida <= 7'b0000001;
8'b00000001: saida <= 7'b1001111;
8'b00000010: saida <= 7'b0010010;
8'b00000011: saida <= 7'b0000110;
8'b00000100: saida <= 7'b1001100;
8'b00000101: saida <= 7'b0100100;
8'b00000110: saida <= 7'b0100000;
8'b00000111: saida <= 7'b0001111;
8'b00001000: saida <= 7'b0000000;
8'b00001001: saida <= 7'b0000100;

default: saida <= 7'b1111111;
endcase
end
endmodule	