LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Adder4Bit IS

	PORT (	A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				Cin	:	IN		STD_LOGIC;
				Res	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
				Cout	:	OUT	STD_LOGIC);

END ENTITY Adder4Bit;
--------------------------------------
ARCHITECTURE functional OF Adder4Bit IS

	SIGNAL	p0		:	STD_LOGIC;
	SIGNAL	pA		:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	p1		:	STD_LOGIC;
	SIGNAL	pB		:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	p2		:	STD_LOGIC;
	SIGNAL	pRes	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
--------------------------------------
BEGIN

	pA	<=	A;
	pB	<=	B;

	firstStageAdder:	ENTITY work.fullAdder
	PORT MAP(	A		=>	pA(0),
					B		=>	pB(0),
					Cin	=>	Cin,
					S		=>	pRes(0),
					Cout	=>	p0);
					
	secondStageAdder:	ENTITY work.fullAdder
	PORT MAP(	A		=>	pA(1),
					B		=>	pB(1),
					Cin	=>	p0,
					S		=>	pRes(1),
					Cout	=>	p1);
	
	thirdStageAdder:	ENTITY work.fullAdder
	PORT MAP(	A		=>	pA(2),
					B		=>	pB(2),
					Cin	=>	p1,
					S		=>	pRes(2),
					Cout	=>	p2);
	
	fourthStageAdder:	ENTITY work.fullAdder
	PORT MAP(	A		=>	pA(3),
					B		=>	pB(3),
					Cin	=>	p2,
					S		=>	pRes(3),
					Cout	=>	Cout);

	Res	<=	pRes;

END ARCHITECTURE	functional;