LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Multiplier4Bit IS

	PORT(	A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			Res	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
			
END ENTITY Multiplier4Bit;
--------------------------------------
ARCHITECTURE gateLevel OF Multiplier4Bit IS

	SIGNAL	A_A0	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	A_A1	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	A_A2	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	SIGNAL	B_A0	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	B_A1	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	B_A2	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	B_A3	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	SIGNAL	S_A0	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	S_A1	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	S_A2	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	SIGNAL	p0		:	STD_LOGIC;
	SIGNAL	p1		:	STD_LOGIC;
	SIGNAL	p2		:	STD_LOGIC;
--------------------------------------
BEGIN
	
	B_A0(0)		<=	(B(0) AND A(0));
	B_A0(1)		<=	(B(0) AND A(1));
	B_A0(2)		<=	(B(0) AND A(2));
	B_A0(3)		<=	(B(0) AND A(3));
	B_A1(0)		<=	(B(1) AND A(0));
	B_A1(1)		<=	(B(1) AND A(1));
	B_A1(2)		<=	(B(1) AND A(2));
	B_A1(3)		<=	(B(1) AND A(3));
	B_A2(0)		<=	(B(2) AND A(0));
	B_A2(1)		<=	(B(2) AND A(1));
	B_A2(2)		<=	(B(2) AND A(2));
	B_A2(3)		<=	(B(2) AND A(3));
	B_A3(0)		<=	(B(3) AND A(0));
	B_A3(1)		<=	(B(3) AND A(1));
	B_A3(2)		<=	(B(3) AND A(2));
	B_A3(3)		<=	(B(3) AND A(3));
	Res(0)		<=	B_A0(0);

	A_A0		<=	('0' & B_A0(3) & B_A0(2) & B_A0(1));

	firstStageAdder: ENTITY work.Adder4Bit
	PORT MAP(	A		=>	A_A0,
					B		=>	B_A1,
					Cin	=>	'0',
					Res	=>	S_A0,
					Cout	=>	p0);
					
	Res(1)	<=	S_A0(0);
	A_A1		<=	(p0 & S_A0(3) & S_A0(2) & S_A0(1));
					
	secondsStageAdder: ENTITY work.Adder4Bit
	PORT MAP(	A		=>	A_A1,
					B		=>	B_A2,
					Cin	=>	'0',
					Res	=>	S_A1,
					Cout	=>	p1);

	Res(2)	<=	S_A1(0);
	A_A2		<=	(p1 & S_A1(3) & S_A1(2) & S_A1(1));
					
	thirdStageAdder: ENTITY work.Adder4Bit
	PORT MAP(	A		=>	A_A2,
					B		=>	B_A3,
					Cin	=>	'0',
					Res	=>	S_A2,
					Cout	=>	p2);
					
	Res(3)	<=	S_A2(0);
	Res(4)	<=	S_A2(1);
	Res(5)	<=	S_A2(2);
	Res(6)	<=	S_A2(3);
	Res(7)	<=	p2;
	
END ARCHITECTURE	gateLevel;