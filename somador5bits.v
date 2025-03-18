module somador5bits(a, b, ci, co, s);
input [4:0] a;
input [4:0] b;
input ci;
output co;
output [4:0] s;

assign {co, s} = a + b + ci;

endmodule	