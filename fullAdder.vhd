LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY fullAdder IS
	
	PORT(	A		:	IN		STD_LOGIC;
			B		:	IN		STD_LOGIC;
			Cin	:	IN		STD_LOGIC;
			S		:	OUT	STD_LOGIC;
			Cout	:	OUT	STD_LOGIC);
			
END ENTITY fullAdder;
--------------------------------------
ARCHITECTURE gateLevel OF fullAdder IS

	SIGNAL	p0	:	STD_LOGIC;
	SIGNAL	p1	:	STD_LOGIC;
	SIGNAL	p2	:	STD_LOGIC;
--------------------------------------
BEGIN

	S		<=	(A XOR B XOR Cin);
	Cout	<=	(p0 OR p1 OR p2);
	p0		<=	(A AND B);
	p1		<=	(A AND Cin);
	p2		<=	(B AND Cin);
	
END ARCHITECTURE	gateLevel;