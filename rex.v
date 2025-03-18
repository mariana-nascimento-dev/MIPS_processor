module rex(entrada, saida);

input[15:0]entrada;
output reg [31:0]saida;

//pega o bit mais significativo e repete ele até atingir os 16 bits
always@(*) begin
	case(entrada[15])
		1'b0 : saida <= {16'b0, entrada};
		1'b1 : saida <= {16'b1111111111111111, entrada};
		
	endcase
end

endmodule	