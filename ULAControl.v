module ULAControl(func, ALUop, operation );
input [5:0]func;
input [1:0] ALUop;
output reg[2:0] operation;
always@(*)
begin
case (ALUop[1:0])
            2'b00: begin // LW, SW e ADDI
                operation = 010;
            end
            2'b01: begin // branch
                operation = 110;
            end
            2'b10: begin // TIPO R
                case(func[5:0])
						6'b100000: begin//add
							operation = 010;
						end
						6'b100010:begin//sub
							operation = 011;
						end
						6'b100100:begin//and
							operation = 000;
						end
						6'b100101:begin//or
							operation = 001;
						end
						6'b101010:begin//slt
							operation = 111;
						end
						default: begin
							operation = 000;
						end
					endcase
            end
				default: begin
					operation = 000;
				end
endcase
end
endmodule 