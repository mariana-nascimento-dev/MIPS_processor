module ShiftTwoBeq(entrada, saida);
input [31:0] entrada;
output reg [31:0] saida;
always @(*) begin
	saida = {entrada[29:0],2'b0};
end
endmodule 