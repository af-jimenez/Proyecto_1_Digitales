LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Calculator4Bit IS

	PORT(	A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			Sel	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			Res	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Signo	:	OUT	STD_LOGIC);
			
END ENTITY Calculator4Bit;
--------------------------------------
ARCHITECTURE functional OF Calculator4Bit IS

	SIGNAL	p0		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	p00	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	p01	:	STD_LOGIC;
	SIGNAL	p1		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	p2		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	p3		:	STD_LOGIC_vector(7 DOWNTO 0);
--------------------------------------
BEGIN
	
	adder: ENTITY work.Adder4Bit
	PORT MAP(	A		=>	A,
					B		=>	B,
					Cin	=>	'0',
					Res	=>	p00,
					Cout	=>	p01);
	
	p0	<=	("000"	&	p01	&	p00);
	
	subtractor: ENTITY work.Subtractor4Bit
	PORT MAP(	A		=>	A,
					B		=>	B,
					Res	=>	p1,
					Signo	=>	Signo);
	
	multiplier:	ENTITY work.Multiplier4Bit
	PORT MAP(	A		=>	A,
					B		=>	B,
					Res	=>	p2);
	
	fourTo1Mux:	ENTITY work.Bit8Mux4_1
	PORT MAP(	X1		=>	p2,
					X2		=>	p2,
					X3		=>	p1,
					X4		=>	p0,
					sel	=>	Sel,
					Y		=>	Res);
	
END ARCHITECTURE	functional;