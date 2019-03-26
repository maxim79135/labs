-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 9.1 Build 222 10/21/2009 SJ Full Version"
-- CREATED		"Tue Mar 12 13:15:09 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ua IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		res :  IN  STD_LOGIC;
		xpin :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC;
		clkout :  OUT  STD_LOGIC;
		apin :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0);
		ctpin :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		outpin :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		ypin :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ua;

ARCHITECTURE bdf_type OF ua IS 

COMPONENT reg
	PORT(clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ct4pm
	PORT(sclr : IN STD_LOGIC;
		 updown : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 aload : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dc4
	PORT(data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 eq0 : OUT STD_LOGIC;
		 eq1 : OUT STD_LOGIC;
		 eq2 : OUT STD_LOGIC;
		 eq3 : OUT STD_LOGIC;
		 eq4 : OUT STD_LOGIC;
		 eq5 : OUT STD_LOGIC;
		 eq6 : OUT STD_LOGIC;
		 eq7 : OUT STD_LOGIC;
		 eq8 : OUT STD_LOGIC;
		 eq9 : OUT STD_LOGIC;
		 eq10 : OUT STD_LOGIC;
		 eq11 : OUT STD_LOGIC;
		 eq12 : OUT STD_LOGIC;
		 eq13 : OUT STD_LOGIC;
		 eq14 : OUT STD_LOGIC;
		 eq15 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	a :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	c :  STD_LOGIC;
SIGNAL	ct :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	d :  STD_LOGIC;
SIGNAL	e :  STD_LOGIC;
SIGNAL	f :  STD_LOGIC;
SIGNAL	g :  STD_LOGIC;
SIGNAL	gr :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	h :  STD_LOGIC;
SIGNAL	i :  STD_LOGIC;
SIGNAL	k :  STD_LOGIC;
SIGNAL	l :  STD_LOGIC;
SIGNAL	m :  STD_LOGIC;
SIGNAL	n :  STD_LOGIC;
SIGNAL	nx[0] :  STD_LOGIC;
SIGNAL	nx[1] :  STD_LOGIC;
SIGNAL	nx[2] :  STD_LOGIC;
SIGNAL	nx[3] :  STD_LOGIC;
SIGNAL	nx[4] :  STD_LOGIC;
SIGNAL	nx[5] :  STD_LOGIC;
SIGNAL	nx[7] :  STD_LOGIC;
SIGNAL	o :  STD_LOGIC;
SIGNAL	out :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	p :  STD_LOGIC;
SIGNAL	q :  STD_LOGIC;
SIGNAL	r :  STD_LOGIC;
SIGNAL	s :  STD_LOGIC;
SIGNAL	t :  STD_LOGIC;
SIGNAL	v :  STD_LOGIC_VECTOR(0 TO 0);
SIGNAL	x :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	y[0] :  STD_LOGIC;
SIGNAL	y[1] :  STD_LOGIC;
SIGNAL	y[2] :  STD_LOGIC;
SIGNAL	y[3] :  STD_LOGIC;
SIGNAL	y[4] :  STD_LOGIC;
SIGNAL	y[6] :  STD_LOGIC;
SIGNAL	y[7] :  STD_LOGIC;
SIGNAL	yy :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN 

GDFX_TEMP_SIGNAL_1 <= (gr(2 DOWNTO 0) & v(0));
GDFX_TEMP_SIGNAL_2 <= (y[7] & y[6] & a(5) & y[4] & y[3] & y[2] & y[1] & y[0]);
GDFX_TEMP_SIGNAL_0 <= (x(7) & x(5 DOWNTO 0));


c <= a(6) AND nx[4];

 <= NOT(GDFX_TEMP_SIGNAL_0);
 <= NOT(GDFX_TEMP_SIGNAL_0);
 <= NOT(GDFX_TEMP_SIGNAL_0);
 <= NOT(GDFX_TEMP_SIGNAL_0);
 <= NOT(GDFX_TEMP_SIGNAL_0);
 <= NOT(GDFX_TEMP_SIGNAL_0);
 <= NOT(GDFX_TEMP_SIGNAL_0);


l <= d AND nx[3];


m <= a(4) AND x(2);


n <= e AND x(5) AND x(6);


o <= a(1) AND nx[1];


p <= a(3) AND nx[1];


y[0] <= h OR f;


y[2] <= i AND x(1);


y[3] <= e AND nx[5];


y[1] <= g OR k OR f;


y[4] <= c OR l;


d <= a(4) AND nx[2];


y[6] <= n OR m;


y[7] <= a(8) AND x(7);

ct(6) <= SYNTHESIZED_WIRE_0;




ct(4 DOWNTO 1) <= GDFX_TEMP_SIGNAL_1;



SYNTHESIZED_WIRE_0 <= NOT(c);



e <= a(6) AND x(4);


SYNTHESIZED_WIRE_2 <= NOT(SYNTHESIZED_WIRE_1);


ct(5) <= SYNTHESIZED_WIRE_2;



q <= d AND x(3);


g <= p OR q OR o;


ct(0) <= y[6] OR a(7) OR g;


r <= a(0) AND nx[0];


s <= a(2) AND nx[0];


t <= a(8) AND nx[7];


SYNTHESIZED_WIRE_1 <= r OR t OR ct(0) OR s;


f <= a(0) AND x(0);


clkout <= NOT(clk);



h <= a(2) AND x(0);


b2v_inst7 : reg
PORT MAP(clock => clk,
		 data => GDFX_TEMP_SIGNAL_2,
		 q => yy);


k <= a(7) AND x(3);


i <= a(3) OR a(1);


b2v_UAinst24 : ct4pm
PORT MAP(sclr => ct(0),
		 updown => ct(6),
		 clock => clk,
		 cnt_en => ct(5),
		 aload => res,
		 data => ct(4 DOWNTO 1),
		 q => out);


b2v_UAinst28 : dc4
PORT MAP(data => out,
		 eq0 => a(8),
		 eq1 => a(0),
		 eq2 => a(1),
		 eq3 => a(2),
		 eq4 => a(3),
		 eq5 => a(4),
		 eq6 => a(5),
		 eq7 => a(6),
		 eq8 => a(7));

Z <= yy(7);
x <= xpin;
apin <= a;
ctpin <= ct;
outpin <= out;
ypin <= yy;

gr <= "000";
v(0) <= '1';
END bdf_type;