LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Encoder16_4 IS

	PORT(	X		:	IN		STD_LOGIC_VECTOR(15 DOWNTO 0);
			Y		:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0));
			
END ENTITY Encoder16_4;
--------------------------------------
ARCHITECTURE functional OF Encoder16_4 IS
--------------------------------------
BEGIN

		Y	<=	"1111"	WHEN	X(15)='1' ELSE
				"1110"	WHEN	X(14)='1' ELSE
				"1101"	WHEN	X(13)='1' ELSE
				"1100"	WHEN	X(12)='1' ELSE
				"1011"	WHEN	X(11)='1' ELSE
				"1010"	WHEN	X(10)='1' ELSE
				"1001"	WHEN	X(9)='1' ELSE
				"1000"	WHEN	X(8)='1' ELSE
				"0111"	WHEN	X(7)='1' ELSE
				"0110"	WHEN	X(6)='1' ELSE
				"0101"	WHEN	X(5)='1' ELSE
				"0100"	WHEN	X(4)='1' ELSE
				"0011"	WHEN	X(3)='1' ELSE
				"0010"	WHEN	X(2)='1' ELSE
				"0001"	WHEN	X(1)='1' ELSE
				"0000";
	
END ARCHITECTURE	functional;