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

module operadorSOP(input wire A, B, C, output wire Y);

  assign Y = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);

endmodule

// POS: Y = (A + B + C) * (A + B + C') * (A + B' + C) * (A + B' + C') * (A' + B' + C);

module gatePOS(input wire A, B, C, output wire Y);

  wire notA, notB, notC, w1, w2, w3, w4, w5;

  not (notA, A);
  not (notB, B);
  not (notC, C);
  or (w1, A, B, C);
  or (w2, A, B, notC);
  or (w3, A, notB, C);
  or (w4, A, notB, notC);
  or (w5, notA, notB, C);
  and  (Y, w1, w2, w3, w4, w5);

endmodule

module operadorPOS(input wire A, B, C, output wire Y);

  assign Y = (A | B | C) & (A | B | ~C) & (A | ~B | C) & (A | ~B | ~C) & (~A | ~B | C);

endmodule

// Minimizada: Y = (A * B') + (A * C);

module gateMin(input wire A, B, C, output wire Y);

  wire notB, w1, w2;

  not (notB, B);
  and (w1, A, notB);
  and (w2, A, C);
  or  (Y, w1, w2);

endmodule

module operadorMin(input wire A, B, C, output wire Y);

  assign Y = (A & ~B) | (A & C);

endmodule
