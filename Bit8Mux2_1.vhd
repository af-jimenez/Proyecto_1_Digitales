LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Bit8Mux2_1 IS

	PORT(	X1		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			X2		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			sel	:	IN		STD_LOGIC;
			Y		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
			
END ENTITY Bit8Mux2_1;
--------------------------------------
ARCHITECTURE functional OF Bit8Mux2_1 IS
--------------------------------------
BEGIN

	WITH sel SELECT
		Y	<=	X1	WHEN	'0',
				X2	WHEN	OTHERS;
	
END ARCHITECTURE	functional;