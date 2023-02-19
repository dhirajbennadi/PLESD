

module HW2P6(input[1:0] A, input[1:0] B, output equals);

assign equals = ~(A[0] ^ B[0]) & ~(A[1] ^ B[1]);

endmodule

    