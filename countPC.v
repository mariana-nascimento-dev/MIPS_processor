module countPC (pcin, reset, clock, pcout);
	input [4:0] pcin;
   input reset;
   input clock;
   output reg [4:0] pcout;
	
   initial begin
       pcout = 5'b00000;  //pc = 0
   end

   always @ (posedge clock or posedge reset) begin
       if (reset) begin
           pcout <= 5'b00000;		//Resetar o PC
       end else begin
           pcout <= pcin;
       end
   end

endmodule 