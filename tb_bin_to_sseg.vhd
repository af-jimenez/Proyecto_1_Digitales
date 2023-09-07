LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY tb_bin_to_sseg is
END ENTITY tb_bin_to_sseg;

ARCHITECTURE test OF tb_bin_to_sseg is

			signal bin_t	:			STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
			signal sseg_t	:			STD_LOGIC_VECTOR(6 DOWNTO 0);
			
BEGIN
	
	dut: ENTITY work.bin_to_sseg
	PORT MAP(
				bin => bin_t,
				sseg => sseg_t);
	
	
	bin_t <=	"0001" AFTER 5ns,
				"0010" AFTER 10ns,
				"0011" AFTER 15ns,
				"0100" AFTER 20ns,
				"0101" AFTER 25ns,
				"0110" AFTER 30ns,
				"0111" AFTER 35ns,
				"1000" AFTER 40ns,
				"1001" AFTER 45ns;
				
END ARCHITECTURE test;