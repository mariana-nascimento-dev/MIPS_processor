module ULA32 (sc, a, b, saida, overflow, zero);
    input [2:0] sc;            // 0: bInvert, 1:2: operação
    input [31:0] a, b;
	 output reg zero;
    output reg [31:0] saida;   
    output reg overflow;        
    
    reg [31:0] sub_resultado;
    reg [32:0] soma_resultado; // Carry
	 reg [31:0] slt_resultado;

    always @(*) begin
        // Inverte o operando B se necessário
		  /*if(sc[2] == 1) begin
			 b_invertido = ~b+1'b1;
			 end
			 else begin
          b_invertido = b;
			 end*/
			 
			 
        case (sc[2:0])
            3'b000: begin // AND
                saida = a & b;
                overflow = 0;  // Não há overflow em uma operação AND
            end
            3'b001: begin // OR
                saida = a | b;
                overflow = 0;  // Não há overflow em uma operação OR
            end
            3'b010: begin // SOMA
                soma_resultado = a + b;  
                saida = soma_resultado[31:0];     
                overflow = soma_resultado[32];    // Verifica o overflow da soma
            end
            3'b011: begin // SUBTRAÇÃO
                sub_resultado = a - b;  
                saida = sub_resultado;            
                overflow = (a[31] & ~b[31] & ~sub_resultado[31]) | (~a[31] & b[31] & sub_resultado[31]); // Verifica overflow da subtração
            end
				3'b111: begin //SLT
					slt_resultado = a - b;
					if(slt_resultado[31] == 0) begin
						saida = 32'b0;
						end
						else begin
						saida = {31'b0, 1'b1};
						end
						
						overflow = 0;
				
				end
				3'b100: begin //NOR
					saida = ~(a|b) ;
					overflow = 0;
				end
				3'b110:begin //BEQ
					slt_resultado = a - b;
					if(slt_resultado[31] == 0) begin
						saida = 32'b0;
						end
						else begin
						saida = {31'b0, 1'b1};
						end
						
						overflow = 0;
				end
				
				
            default: begin
                saida = 32'b0; 
                overflow = 0;
            end
        endcase
		  if(saida == 32'b0) begin
				zero = 1'b1;
		  end
		  else begin
				zero = 1'b0;
			end
    end
endmodule
