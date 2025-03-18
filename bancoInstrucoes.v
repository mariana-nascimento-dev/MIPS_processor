module bancoInstrucoes(opcode, ALUOp, ALUSrc, RegWrite, RegDst, MemToReg, MemRead, MemWrite, Branch, Jump);
input [5:0]opcode;
output reg [1:0]ALUOp;
output reg ALUSrc, RegWrite, RegDst, MemToReg, MemRead, MemWrite, Branch, Jump;


always@(*) begin

case (opcode)
		6'b000000:begin//formato r
			Jump = 1'b0;
			RegDst = 1'b1;
			ALUSrc = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b0;
			ALUOp[1] = 1'b1;
			ALUOp[0] = 1'b0;
			end
			
			6'b100011:begin//lw
			Jump = 1'b0;
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			MemToReg = 1'b1;
			RegWrite = 1'b1;
			MemRead = 1'b1;
			MemWrite = 1'b0;
			Branch = 1'b0;
			ALUOp[1] = 1'b0;
			ALUOp[0] = 1'b0;
			end
			
			6'b101011:begin//sw
			Jump = 1'b0;
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			MemToReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b1;
			Branch = 1'b0;
			ALUOp[1] = 1'b0;
			ALUOp[0] = 1'b0;
			end
			
			6'b001000:begin//tipo i (addi)
			Jump = 1'b0;
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			MemToReg = 1'b0;
			RegWrite = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b0;
			ALUOp[1] = 1'b0;
			ALUOp[0] = 1'b0;
			end
			
			6'b000100:begin //beq
			Jump = 1'b0;
			RegDst = 1'b0;
			ALUSrc = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b1;
			ALUOp[1] = 1'b0;
			ALUOp[0] = 1'b1;
			end
			
			6'b000010:begin//jump
			Jump = 1'b1;
			RegDst = 1'b0;
			ALUSrc = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b0;
			ALUOp[1] = 1'b0;
			ALUOp[0] = 1'b0;
			end
		
	endcase
	end
	endmodule 
	/*
	Rformat = 0;
   lw = 0;
   sw = 0;
   beq = 0;
		  
	Rformat = ~opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5];
	lw = opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & opcode[5];
	sw = opcode[0] & ~opcode[1] & opcode[2] & ~opcode[3] & ~opcode[4] & opcode[5];
	beq = ~opcode[0] & ~opcode[1] & ~opcode[2] & opcode[3] & ~opcode[4] & ~opcode[5];
	
	RegDst = Rformat;
	ALUSrc = lw | sw;
	MemToReg = sw;
	RegWrite = Rformat | lw;
	MemRead = lw;
	MemWrite = sw;
	Branch = beq;
	ALUOp[1] = Rformat;
	ALUOp[0] = beq;
end
endmodule 
*/
