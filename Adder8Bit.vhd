LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Adder8Bit IS

	PORT (	A		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
				B		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
				Cin	:	IN		STD_LOGIC;
				Res	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				Cout	:	OUT	STD_LOGIC);

END ENTITY Adder8Bit;
--------------------------------------
ARCHITECTURE functional OF Adder8Bit IS

	SIGNAL	pCin	:	STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL	pA		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	pB		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	pRes	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
--------------------------------------
BEGIN

	pA	<=	A;
	pB	<=	B;
	
	pCin(0)	<=	Cin;
	
	addGenerate: FOR i IN 0 TO 7 GENERATE
		comp:	ENTITY work.fullAdder
		PORT MAP(	A		=>	pA(i),
						B		=>	pB(i),
						Cin	=>	pCin(i),
						S		=>	pRes(i),
						Cout	=>	pCin(i+1));
	END GENERATE;

	Res	<=	pRes;
	Cout	<=	pCin(8);

END ARCHITECTURE	functional;