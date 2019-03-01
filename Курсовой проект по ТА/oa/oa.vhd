-- Copyright (C) 1991-2010 Altera Corporation
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
-- VERSION		"Version 9.1 Build 350 03/24/2010 Service Pack 2 SJ Web Edition"
-- CREATED		"Wed May 16 14:51:28 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY oa IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		x :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Z :  OUT  STD_LOGIC;
		prs :  OUT  STD_LOGIC;
		p :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		result :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		y :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END oa;

ARCHITECTURE bdf_type OF oa IS 

COMPONENT ct1
	PORT(sload : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sm2
	PORT(dataa : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 cout : OUT STD_LOGIC;
		 result : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT or5har
	PORT(data : IN STD_LOGIC_VECTOR(3 DOWNTO 0 , 0 TO 0);
		 result : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT rgshiftright
	PORT(load : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 shiftin : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rgshiftleft
	PORT(load : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 shiftin : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ms1
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;

COMPONENT xor21
	PORT(data0x : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sm1
	PORT(cin : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rgharak
	PORT(clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT or10rez
	PORT(data : IN STD_LOGIC_VECTOR(9 DOWNTO 0 , 0 TO 0);
		 result : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ct2
	PORT(sclr : IN STD_LOGIC;
		 sload : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT schp
	PORT(sclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;

COMPONENT upavt
	PORT(clk : IN STD_LOGIC;
		 res : IN STD_LOGIC;
		 xpin : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 Z : OUT STD_LOGIC;
		 clkout : OUT STD_LOGIC;
		 apin : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 ypin : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT shifter
	PORT(distance : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	a :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	clkout :  STD_LOGIC;
SIGNAL	ct1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	CT2 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	gr :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	har :  STD_LOGIC;
SIGNAL	ms1 :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	p_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	rez :  STD_LOGIC;
SIGNAL	rgharak :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	rgshiftleft :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	rgshiftright :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	rgshiftschp :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	sh :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	sm :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	sm1 :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	u :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	v :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	xor21 :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	y_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_1 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_2 :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_4 :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_3 :  STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_5 :  STD_LOGIC_VECTOR(11 DOWNTO 0);

BEGIN 

GDFX_TEMP_SIGNAL_1 <= (x(15) & x(9 DOWNTO 0));
GDFX_TEMP_SIGNAL_2 <= (gr(10 DOWNTO 0) & x(15) & x(9 DOWNTO 0));
GDFX_TEMP_SIGNAL_4 <= (y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7) & y_ALTERA_SYNTHESIZED(7));
GDFX_TEMP_SIGNAL_3 <= (rgshiftright(10 DOWNTO 0) & gr(10 DOWNTO 0));
GDFX_TEMP_SIGNAL_0 <= (gr(10 DOWNTO 9) & v(1) & gr(8) & v(0));
GDFX_TEMP_SIGNAL_5 <= (u(1) & p_ALTERA_SYNTHESIZED(9 DOWNTO 0) & u(0));


b2v_inst : ct1
PORT MAP(sload => y_ALTERA_SYNTHESIZED(1),
		 clock => clkout,
		 cnt_en => y_ALTERA_SYNTHESIZED(3),
		 data => GDFX_TEMP_SIGNAL_0,
		 q => ct1);


b2v_inst1 : sm2
PORT MAP(dataa => rgharak,
		 datab => CT2,
		 cout => SYNTHESIZED_WIRE_1,
		 result => sm);


SYNTHESIZED_WIRE_2 <= y_ALTERA_SYNTHESIZED(3) OR y_ALTERA_SYNTHESIZED(1);


har <= NOT(CT2(4));



SYNTHESIZED_WIRE_3 <= y_ALTERA_SYNTHESIZED(3) OR y_ALTERA_SYNTHESIZED(0);


PROCESS(clkout,SYNTHESIZED_WIRE_0)
BEGIN
IF (SYNTHESIZED_WIRE_0 = '0') THEN
	SYNTHESIZED_WIRE_19 <= '0';
ELSIF (RISING_EDGE(clkout)) THEN
	IF (y_ALTERA_SYNTHESIZED(8) = '1') THEN
	SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_1;
	END IF;
END IF;
END PROCESS;


b2v_inst14 : or5har
PORT MAP(data => CT2(3 DOWNTO 0),
		 result => SYNTHESIZED_WIRE_17);


b2v_inst15 : rgshiftright
PORT MAP(load => y_ALTERA_SYNTHESIZED(1),
		 clock => clkout,
		 enable => SYNTHESIZED_WIRE_2,
		 shiftin => rgshiftright(0),
		 data => GDFX_TEMP_SIGNAL_1,
		 q => rgshiftright);


b2v_inst16 : rgshiftleft
PORT MAP(load => y_ALTERA_SYNTHESIZED(0),
		 clock => clkout,
		 enable => SYNTHESIZED_WIRE_3,
		 shiftin => gr(7),
		 data => GDFX_TEMP_SIGNAL_2,
		 q => rgshiftleft);


SYNTHESIZED_WIRE_0 <= NOT(y_ALTERA_SYNTHESIZED(0));



b2v_inst18 : ms1
PORT MAP(sel => y_ALTERA_SYNTHESIZED(6),
		 data0x => GDFX_TEMP_SIGNAL_3,
		 data1x => rgshiftleft,
		 result => ms1);

p_ALTERA_SYNTHESIZED(3) <= rgshiftleft(21);



u(1) <= a(10) AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_6 <= rgshiftright(9) OR rgshiftright(10);

p_ALTERA_SYNTHESIZED(0) <= rgshiftright(0);



SYNTHESIZED_WIRE_5 <= rgshiftleft(10) OR rgshiftleft(9);


p_ALTERA_SYNTHESIZED(2) <= NOT(SYNTHESIZED_WIRE_5);



p_ALTERA_SYNTHESIZED(1) <= NOT(SYNTHESIZED_WIRE_6);


p_ALTERA_SYNTHESIZED(4) <= rgshiftright(10);



b2v_inst26 : xor21
PORT MAP(data0x => ms1,
		 data1x => GDFX_TEMP_SIGNAL_4,
		 result => xor21);


b2v_inst27 : sm1
PORT MAP(cin => y_ALTERA_SYNTHESIZED(7),
		 dataa => xor21,
		 datab => rgshiftschp,
		 result => sm1);


SYNTHESIZED_WIRE_4 <= NOT(y_ALTERA_SYNTHESIZED(0));



b2v_inst29 : rgharak
PORT MAP(clock => clkout,
		 enable => y_ALTERA_SYNTHESIZED(2),
		 data => x(14 DOWNTO 10),
		 q => rgharak);


p_ALTERA_SYNTHESIZED(5) <= SYNTHESIZED_WIRE_17 AND SYNTHESIZED_WIRE_18;




SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_9 AND rgshiftschp(20);


p_ALTERA_SYNTHESIZED(9) <= rgshiftschp(20) XOR rgshiftschp(19);


b2v_inst34 : or10rez
PORT MAP(data => rgshiftschp(19 DOWNTO 10),
		 result => SYNTHESIZED_WIRE_9);


rez <= rgshiftschp(20) OR SYNTHESIZED_WIRE_10;


b2v_inst36 : ct2
PORT MAP(sclr => y_ALTERA_SYNTHESIZED(0),
		 sload => y_ALTERA_SYNTHESIZED(8),
		 clock => clkout,
		 cnt_en => y_ALTERA_SYNTHESIZED(5),
		 data => sm,
		 q => CT2);


p_ALTERA_SYNTHESIZED(7) <= NOT(SYNTHESIZED_WIRE_11);



PROCESS(clkout)
VARIABLE synthesized_var_for_prs : STD_LOGIC;
BEGIN
IF (RISING_EDGE(clkout)) THEN
	synthesized_var_for_prs := (NOT(synthesized_var_for_prs) AND y_ALTERA_SYNTHESIZED(9)) OR (synthesized_var_for_prs AND (NOT(y_ALTERA_SYNTHESIZED(0))));
END IF;
	prs <= synthesized_var_for_prs;
END PROCESS;


SYNTHESIZED_WIRE_18 <= CT2(4) AND SYNTHESIZED_WIRE_19;

p_ALTERA_SYNTHESIZED(8) <= ct1(4);



b2v_inst41 : ms1
PORT MAP(sel => y_ALTERA_SYNTHESIZED(5),
		 data0x => sm1,
		 data1x => sh,
		 result => SYNTHESIZED_WIRE_13);


b2v_inst43 : schp
PORT MAP(sclr => y_ALTERA_SYNTHESIZED(0),
		 clock => clkout,
		 enable => SYNTHESIZED_WIRE_12,
		 data => SYNTHESIZED_WIRE_13,
		 q => rgshiftschp);


b2v_inst45 : upavt
PORT MAP(clk => clk,
		 res => reset,
		 xpin => GDFX_TEMP_SIGNAL_5,
		 Z => Z,
		 clkout => clkout,
		 apin => a,
		 ypin => y_ALTERA_SYNTHESIZED);


u(0) <= a(2) OR a(0);


p_ALTERA_SYNTHESIZED(6) <= SYNTHESIZED_WIRE_14 AND SYNTHESIZED_WIRE_18;


SYNTHESIZED_WIRE_12 <= y_ALTERA_SYNTHESIZED(4) OR y_ALTERA_SYNTHESIZED(5) OR y_ALTERA_SYNTHESIZED(0);


SYNTHESIZED_WIRE_14 <= NOT(SYNTHESIZED_WIRE_17);



SYNTHESIZED_WIRE_11 <= SYNTHESIZED_WIRE_19 OR CT2(4);


b2v_inst9 : shifter
PORT MAP(distance => y_ALTERA_SYNTHESIZED(5),
		 data => rgshiftschp,
		 result => sh);

p <= p_ALTERA_SYNTHESIZED;
result(15) <= rgshiftschp(20);
result(14) <= har;
result(13 DOWNTO 10) <= CT2(3 DOWNTO 0);
result(9 DOWNTO 1) <= rgshiftschp(19 DOWNTO 11);
result(0) <= rez;
y <= y_ALTERA_SYNTHESIZED;

END bdf_type;