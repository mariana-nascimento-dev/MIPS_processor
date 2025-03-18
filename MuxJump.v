module MuxJump(a, b, seletora, saida);

input [4:0]a;
input [31:0]b;
input seletora;
output reg [4:0]saida;

//no bloco always de acordo com a seletora escolhida ele libera uma das saidas
always @(*)
begin
	case (seletora)
		1'b0: saida = a;
		1'b1: saida = b[4:0];
	endcase
end

endmodule	