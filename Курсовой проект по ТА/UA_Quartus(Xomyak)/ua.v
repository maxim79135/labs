// Copyright (C) 1991-2009 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II"
// VERSION		"Version 9.1 Build 222 10/21/2009 SJ Full Version"
// CREATED		"Tue Mar 05 00:08:32 2019"

module ua(
	clk,
	res,
	xpin,
	Z,
	clkout,
	apin,
	outpin,
	ypin
);


input	clk;
input	res;
input	[7:0] xpin;
output	Z;
output	clkout;
output	[8:0] apin;
output	[3:0] outpin;
output	[7:0] ypin;

wire	[8:0] a;
wire	b;
wire	clkout_ALTERA_SYNTHESIZED;
wire	ct[0];
wire	ct[1];
wire	ct[2];
wire	ct[3];
wire	ct[4];
wire	ct[6];
wire	d;
wire	e;
wire	f;
wire	g;
wire	[2:0] gr;
wire	h;
wire	i;
wire	k;
wire	l;
wire	m;
wire	n;
wire	nx[1];
wire	nx[2];
wire	nx[3];
wire	nx[4];
wire	nx[5];
wire	nx[7];
wire	o;
wire	[3:0] out;
wire	p;
wire	[0:0] v;
wire	[7:0] x;
wire	y[0];
wire	y[1];
wire	y[2];
wire	y[3];
wire	y[4];
wire	y[6];
wire	y[7];
wire	[7:0] yy;
wire	SYNTHESIZED_WIRE_0;

wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_4;
wire	[5:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_1 = {ct[4],ct[3],ct[2],ct[1]};
assign	ct[4] = GDFX_TEMP_SIGNAL_3[3];
assign	ct[3] = GDFX_TEMP_SIGNAL_3[2];
assign	ct[2] = GDFX_TEMP_SIGNAL_3[1];
assign	ct[1] = GDFX_TEMP_SIGNAL_3[0];

assign	GDFX_TEMP_SIGNAL_4 = {y[7],y[6],a[5],y[4],y[3],y[2],y[1],y[0]};
assign	GDFX_TEMP_SIGNAL_0 = {x[7],x[5:1]};
assign	GDFX_TEMP_SIGNAL_2 = {gr[2:0],v[0]};

assign	b = a[6] & nx[4];

 = ~ GDFX_TEMP_SIGNAL_0;
 = ~ GDFX_TEMP_SIGNAL_0;
 = ~ GDFX_TEMP_SIGNAL_0;
 = ~ GDFX_TEMP_SIGNAL_0;
 = ~ GDFX_TEMP_SIGNAL_0;

assign	l = d & nx[3];

assign	m = a[4] & x[2];

assign	n = e & x[5] & x[6];



assign	y[0] = h | f;

assign	y[2] = i & x[1];

assign	y[3] = e & nx[5];

assign	y[1] = b | k | f;

assign	y[4] = b | l;

assign	d = a[4] & nx[2];

assign	y[6] = n | m;

assign	y[7] = a[8] & x[7];

assign	clkout_ALTERA_SYNTHESIZED =  ~clk;

assign	ct[6] = SYNTHESIZED_WIRE_0;



ct4pm	b2v_inst24(
	.sclr(ct[0]),
	.updown(ct[6]),
	.clock(clkout_ALTERA_SYNTHESIZED),
	.cnt_en(ct[6]),
	.aload(res),
	.data(GDFX_TEMP_SIGNAL_1),
	.q(out));

assign	ct[0] = b | y[7] | g | y[6];



assign	GDFX_TEMP_SIGNAL_3 = GDFX_TEMP_SIGNAL_2;


assign	SYNTHESIZED_WIRE_0 =  ~b;

assign	e = a[6] & x[4];

assign	f = a[0] & x[0];

assign	g = a[8] & nx[7];

assign	h = a[2] & x[0];


reg	b2v_inst7(
	.clock(clk),
	.data(GDFX_TEMP_SIGNAL_4),
	.q(yy));

assign	k = a[7] & x[3];

assign	i = a[3] | a[1];


dc4	b2v_UAinst28(
	.data(out),
	.eq0(a[8]),
	.eq1(a[0]),
	.eq2(a[1]),
	.eq3(a[2]),
	.eq4(a[3]),
	.eq5(a[4]),
	.eq6(a[5]),
	.eq7(a[6]),
	.eq8(a[7])
	
	
	
	
	
	
	);

assign	Z = x[7];
assign	x = xpin;
assign	clkout = clkout_ALTERA_SYNTHESIZED;
assign	apin = a;
assign	outpin = out;
assign	ypin = yy;
assign	gr = 3'b000;
assign	v = 1;

endmodule
