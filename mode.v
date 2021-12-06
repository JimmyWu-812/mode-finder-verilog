`timescale 1ns/1ps

module mode_max(mode, i0, i1, i2, i3, i4);
//DO NOT CHANGE!
	input  [3:0] i0, i1, i2, i3, i4;
	output [3:0] mode;
//---------------------------------------------------
// x
	wire [20:1] x;
	CMP4 cmp1(x[1], x[2], i0, i1);
	CMP4 cmp2(x[3], x[4], i0, i2);
	CMP4 cmp3(x[5], x[6], i0, i3);
	CMP4 cmp4(x[7], x[8], i0, i4);
	CMP4 cmp5(x[9], x[10], i1, i2);
	CMP4 cmp6(x[11], x[12], i1, i3);
	CMP4 cmp7(x[13], x[14], i1, i4);
	CMP4 cmp8(x[15], x[16], i2, i3);
	CMP4 cmp9(x[17], x[18], i2, i4);
	CMP4 cmp10(x[19], x[20], i3, i4);

// invX
	wire [20:1] invX;
	IV ivx1(invX[1], x[1]);
	IV ivx2(invX[2], x[2]);
	IV ivx3(invX[3], x[3]);
	IV ivx4(invX[4], x[4]);
	IV ivx5(invX[5], x[5]);
	IV ivx6(invX[6], x[6]);
	IV ivx7(invX[7], x[7]);
	IV ivx8(invX[8], x[8]);
	IV ivx9(invX[9], x[9]);
	IV ivx10(invX[10], x[10]);
	IV ivx11(invX[11], x[11]);
	IV ivx12(invX[12], x[12]);
	IV ivx13(invX[13], x[13]);
	IV ivx14(invX[14], x[14]);
	IV ivx15(invX[15], x[15]);
	IV ivx16(invX[16], x[16]);
	IV ivx17(invX[17], x[17]);
	IV ivx18(invX[18], x[18]);
	IV ivx19(invX[19], x[19]);
	IV ivx20(invX[20], x[20]);

// tmp3
	wire [9:0] tmp3;
	AN2 an1(tmp3[0], x[1], x[3]);
	AN2 an2(tmp3[1], x[1], x[5]);
	AN2 an3(tmp3[2], x[1], x[7]);
	AN2 an4(tmp3[3], x[3], x[5]);
	AN2 an5(tmp3[4], x[3], x[7]);
	AN2 an6(tmp3[5], x[5], x[7]);
	AN2 an7(tmp3[6], x[9], x[11]);
	AN2 an8(tmp3[7], x[9], x[13]);
	AN2 an9(tmp3[8], x[11], x[13]);
	AN2 an10(tmp3[9], x[15], x[17]);

// control_3
	wire [2:0] control_3_tmp;
	wire control_3;
	NR3 nr1(control_3_tmp[0], tmp3[0], tmp3[1], tmp3[2]);
	NR3 nr2(control_3_tmp[1], tmp3[3], tmp3[4], tmp3[5]);
	NR4 nr3(control_3_tmp[2], tmp3[6], tmp3[7], tmp3[8], tmp3[9]);
	ND3 nd1(control_3, control_3_tmp[0], control_3_tmp[1], control_3_tmp[2]);

// control_2
	wire [2:0] control_2_tmp;
	wire control_2;
	NR3 nr4(control_2_tmp[0], x[1], x[3], x[5]);
	NR3 nr5(control_2_tmp[1], x[7], x[9], x[11]);
	NR4 nr6(control_2_tmp[2], x[13], x[15], x[17], x[19]);
	ND3 nd2(control_2, control_2_tmp[0], control_2_tmp[1], control_2_tmp[2]);

// control_i0_3
	wire control_i012_3;
	wire [3:0] control_i012_3_tmp;
	ND2 nd3(control_i012_3_tmp[0], x[9], x[11]);
	ND2 nd4(control_i012_3_tmp[1], x[9], x[13]);
	ND2 nd5(control_i012_3_tmp[2], x[11], x[13]);
	ND2 nd6(control_i012_3_tmp[3], x[15], x[17]);
	ND4 nd7(control_i012_3, control_i012_3_tmp[0], control_i012_3_tmp[1], control_i012_3_tmp[2], control_i012_3_tmp[3]);

// control_i12_3
	wire control_i12_3;
	assign control_i12_3 = tmp3[9];

// mode_3
	wire [3:0] mode_3;
	wire [3:0] i12_3;
	MUX4 mux1(i12_3, i1, i2, control_i12_3);
	MUX4 mux2(mode_3, i0, i12_3, control_i012_3);

// tmp2[0] (bc)
	wire [5:0] tmp2;

	wire [3:0] tmp2_bc_tmp;
	AN4 an11(tmp2_bc_tmp[0], x[9], invX[5], invX[7], invX[19]);
	AN3 an12(tmp2_bc_tmp[1], x[9], x[5], x[16]);
	AN3 an13(tmp2_bc_tmp[2], x[9], x[7], x[18]);
	AN3 an14(tmp2_bc_tmp[3], x[9], x[19], x[18]);
	NR4 nr7(tmp2[0], tmp2_bc_tmp[0], tmp2_bc_tmp[1], tmp2_bc_tmp[2], tmp2_bc_tmp[3]);

// tmp2[1] (bd)
	wire [3:0] tmp2_bd_tmp;
	AN4 an15(tmp2_bd_tmp[0], x[11], invX[3], invX[7], invX[17]);
	AN3 an16(tmp2_bd_tmp[1], x[11], x[3], x[10]);
	AN3 an17(tmp2_bd_tmp[2], x[11], x[7], x[14]);
	AN3 an18(tmp2_bd_tmp[3], x[11], x[17], x[10]);
	NR4 nr8(tmp2[1], tmp2_bd_tmp[0], tmp2_bd_tmp[1], tmp2_bd_tmp[2], tmp2_bd_tmp[3]);

// tmp2[2] (be)
	wire [3:0] tmp2_be_tmp;
	AN4 an19(tmp2_be_tmp[0], x[13], invX[3], invX[5], invX[15]);
	AN3 an20(tmp2_be_tmp[1], x[13], x[3], x[10]);
	AN3 an21(tmp2_be_tmp[2], x[13], x[5], x[12]);
	AN3 an22(tmp2_be_tmp[3], x[13], x[15], x[10]);
	NR4 nr9(tmp2[2], tmp2_be_tmp[0], tmp2_be_tmp[1], tmp2_be_tmp[2], tmp2_be_tmp[3]);

// tmp2[3] (cd)
	wire [3:0] tmp2_cd_tmp;
	AN4 an23(tmp2_cd_tmp[0], x[15], invX[1], invX[7], invX[13]);
	AN3 an24(tmp2_cd_tmp[1], x[15], x[1], invX[4]);
	AN3 an25(tmp2_cd_tmp[2], x[15], x[7], x[18]);
	AN3 an26(tmp2_cd_tmp[3], x[15], x[13], x[18]);
	NR4 nr10(tmp2[3], tmp2_cd_tmp[0], tmp2_cd_tmp[1], tmp2_cd_tmp[2], tmp2_cd_tmp[3]);

// tmp2[4] (ce)
	wire [3:0] tmp2_ce_tmp;
	AN4 an27(tmp2_ce_tmp[0], x[17], invX[1], invX[5], invX[11]);
	AN3 an28(tmp2_ce_tmp[1], x[17], x[1], invX[4]);
	AN3 an29(tmp2_ce_tmp[2], x[17], x[5], x[16]);
	AN3 an30(tmp2_ce_tmp[3], x[17], x[11], x[16]);
	NR4 nr11(tmp2[4], tmp2_ce_tmp[0], tmp2_ce_tmp[1], tmp2_ce_tmp[2], tmp2_ce_tmp[3]);

// tmp2[5] (de)
	wire [3:0] tmp2_de_tmp;
	AN4 an31(tmp2_de_tmp[0], x[19], invX[1], invX[3], invX[9]);
	AN3 an32(tmp2_de_tmp[1], x[19], x[1], invX[6]);
	AN3 an33(tmp2_de_tmp[2], x[19], x[3], invX[6]);
	AN3 an34(tmp2_de_tmp[3], x[19], x[9], invX[12]);
	NR4 nr12(tmp2[5], tmp2_de_tmp[0], tmp2_de_tmp[1], tmp2_de_tmp[2], tmp2_de_tmp[3]);

// control_i0123_2
	wire control_i0123_2;
	ND3 nd8(control_i0123_2, tmp2[3], tmp2[4], tmp2[5]);

// control_i01_2
	wire control_i01_2;
	ND3 nd9(control_i01_2, tmp2[0], tmp2[1], tmp2[2]);

// control_i23_2
	wire control_i23_2;
	assign control_i23_2 = tmp2[5];

// mode_2
	wire [3:0] mode_2;
	wire [3:0] i01_2, i23_2;
	MUX4 mux3(i01_2, i0, i1, control_i01_2);
	MUX4 mux4(i23_2, i3, i2, control_i23_2);
	MUX4 mux5(mode_2, i01_2, i23_2, control_i0123_2);

// control_i34_0
	wire control_i34_0;
	assign control_i34_0 = x[20];

// control_i12_0
	wire control_i12_0;
	assign control_i12_0 = x[10];

// control_i1234_0
	wire control_i1234_0;
	wire [1:0] control_i1234_0_tmp;
	ND2 nd10(control_i1234_0_tmp[0], x[12], x[14]);
	ND2 nd11(control_i1234_0_tmp[1], x[16], x[18]);
	ND2 nd12(control_i1234_0, control_i1234_0_tmp[0], control_i1234_0_tmp[1]);

// control_i01234_0
	wire control_i01234_0;
	ND4 nd13(control_i01234_0, x[2], x[4], x[6], x[8]);

// mode_0
	wire [3:0] mode_0;
	wire [3:0] i12_0, i34_0, i1234_0;
	MUX4 mux6(i12_0, i2, i1, control_i12_0);
	MUX4 mux7(i34_0, i4, i3, control_i34_0);
	MUX4 mux8(i1234_0, i34_0, i12_0, control_i1234_0);
	MUX4 mux9(mode_0, i0, i1234_0, control_i01234_0);

// mode
	wire [3:0] mode_tmp;
	MUX4 mux10(mode_tmp, mode_2, mode_3, control_3);
	MUX4 mux11(mode, mode_0, mode_tmp, control_2);
endmodule

module CMP4(equal, geq, X, Y);
	input [3:0] X, Y;
	output equal, geq;

	wire [3:0] neq;
	wire [3:0] eq;
	wire [3:0] invY;
	wire [3:0] cond;

	EO b1(neq[3], X[3], Y[3]);
	EO b2(neq[2], X[2], Y[2]);
	EO b3(neq[1], X[1], Y[1]);
	EO b4(neq[0], X[0], Y[0]);

	IV b5(eq[3], neq[3]);
	IV b6(eq[2], neq[2]);
	IV b7(eq[1], neq[1]);
	IV b8(eq[0], neq[0]);

	IV b9(invY[3], Y[3]);
	IV b10(invY[2], Y[2]);
	IV b11(invY[1], Y[1]);
	IV b12(invY[0], Y[0]);

	ND2 b13(cond[3], X[3], invY[3]);
	ND3 b14(cond[2], eq[3], X[2], invY[2]);
	ND4 b15(cond[1], eq[3], eq[2], X[1], invY[1]);
	ND4 b16(cond[0], eq[3], eq[2], eq[1], X[0]);

	NR4 b17(equal, neq[3], neq[2], neq[1], neq[0]);

	ND4 b18(geq, cond[3], cond[2], cond[1], cond[0]);
endmodule

module MUX4(Z, X, Y, CTRL);
	input [3:0] X, Y;
	input CTRL;
	output [3:0] Z;

	MUX21H mux1(Z[0], X[0], Y[0], CTRL);
	MUX21H mux2(Z[1], X[1], Y[1], CTRL);
	MUX21H mux3(Z[2], X[2], Y[2], CTRL);
	MUX21H mux4(Z[3], X[3], Y[3], CTRL);
endmodule