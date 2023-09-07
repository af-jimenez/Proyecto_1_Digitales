LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Subtractor8Bit IS

	PORT(	A		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			B		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Res	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
			
END ENTITY Subtractor8Bit;
--------------------------------------
ARCHITECTURE gateLevel OF Subtractor8Bit IS

	SIGNAL	B_a2			:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	gnd			:	STD_LOGIC;
	SIGNAL	pRes			:	STD_LOGIC_VECTOR(7 DOWNTO 0);
--------------------------------------
BEGIN

	B_a2	<=	NOT(B);

	adder: ENTITY work.Adder8Bit
	PORT MAP(	A		=>	A,
					B		=>	B_a2,
					Cin	=>	'1',
					Res	=>	Res,
					Cout	=>	gnd);
	
END ARCHITECTURE	gateLevel;