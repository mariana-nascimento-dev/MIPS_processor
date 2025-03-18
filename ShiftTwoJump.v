module ShiftTwoJump(entrada, saida);
input [25:0] entrada;
output reg [27:0] saida;

always @(*) begin
	saida = {entrada[25:0],2'b0};
end
endmodule
