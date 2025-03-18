module ULACima (a, b, saida);
    input [31:0] a;
	 input [4:0] b;
	 wire [31:0]bNovo;
    output [31:0] saida;     
	 assign bNovo = {27'b0,b};
      
    assign saida = a + bNovo; 
endmodule
