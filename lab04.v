// Ecuación a implementar: Y = (A' * C') + (A * B') + (A * C);

module gateLevel1(input wire A, B, C, output wire Y);

  wire notA, notC, notB, w1, w2, w3;

  not (notA, A);
  not (notB, B);
  not (notC, C);
  and (w1, notA, notC);
  and  (w2, A, notB);
  and (w3, A, C);
  or  (Y, w1, w2, w3);

endmodule

// Ecuación a implementar: Y = (B');

module gateLevel2(input wire A, B, C, output wire Y);

  not (Y, B);

endmodule

// Ecuación a implementar: SOP ejercicio 1, tabla 3;

module gateLevel3(input wire A, B, C, D, output wire Y);

  wire notA, notC, notB, w1, w2, w3;

  not (notA, A);
  not (notB, B);
  not (notC, C);
  not (notD, D);
  and (w1, notA, notB, notC, notD);
  and  (w2, notA, notB, C, D);
  and (w3, notA, B, notC, D);
  and (w4, notA, B, C, notD);
  and (w5, A, notB, notC, D);
  and (w6, A, notB, C, notD);
  and (w7, A, B, notC, notD);
  and (w8, A, B, C, D);
  or  (Y, w1, w2, w3, w4, w5, w6, w7, w8);

endmodule

// Ecuación a implementar: Y = (A * D') + (B * D) + (A * C);

module gateLevel4(input wire A, B, C, D, output wire Y);

  wire notD, w1, w2, w3;

  not (notD, D);
  and (w1, A, notD);
  and  (w2, B, D);
  and (w3, A, C);
  or  (Y, w1, w2, w3);

endmodule

// Función a implementar: Y = (B' * C' * D') + (A * C') + (A * D') + (A * B');

module operadores1(input wire A, B, C, D, output wire Y);

  assign Y = (~B & ~C & ~D) | (A & ~C) | (A & ~D) | (A & ~B);

endmodule

// Función a implementar: Y = (B' + C);

module operadores2(input wire A, B, C, output wire Y);

  assign Y = (~B  | C);

endmodule

// Función a implementar: Y = B + (C' * D) + (A * D);

module operadores3(input wire A, B, C, D, output wire Y);

  assign Y = B | (~C & D) | (A & D);

endmodule

// Función a implementar: Y = B + (A' * C');

module operadores4(input wire A, B, C, output wire Y);

  assign Y = B | (~A & ~C);

endmodule
