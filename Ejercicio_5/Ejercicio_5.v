// SOP: Y = (A * B * C) + (A * B' * C) + (A * B * C);

module gateSOP(input wire A, B, C, output wire Y);

  wire notB, notC, w1, w2, w3;

  not (notB, B);
  not (notC, C);
  and (w1, A, notB, notC);
  and  (w2, A, notB, C);
  and (w3, A, B, C);
  or  (Y, w1, w2, w3);

endmodule

module operadorSOP(input wire A, B, C, D, output wire Y);

  assign Y = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);

endmodule
