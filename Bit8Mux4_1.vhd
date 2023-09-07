LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Bit8Mux4_1 IS

	PORT(	X1		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			X2		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			X3		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			X4		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			sel	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			Y		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
			
END ENTITY Bit8Mux4_1;
--------------------------------------
ARCHITECTURE functional OF Bit8Mux4_1 IS
--------------------------------------
BEGIN

	WITH sel SELECT
		Y	<=	X1	WHEN	"00",
				X2	WHEN	"01",
				X3	WHEN	"10",
				X4	WHEN	OTHERS;
	
END ARCHITECTURE	functional;