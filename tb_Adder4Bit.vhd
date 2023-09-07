LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY tb_Adder4Bit is
END ENTITY tb_Adder4Bit;

ARCHITECTURE test OF tb_Adder4Bit is

			signal A_t		:			STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
			signal B_t		:			STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
			signal Cin_t	:			STD_LOGIC := '0';
			signal Res_t	:			STD_LOGIC_VECTOR(3 DOWNTO 0);
			signal Cout_t	:			STD_LOGIC;
			
BEGIN
	
	dut: ENTITY work.Adder4Bit
	PORT MAP(
				A => A_t,
				B => B_t,
				Cin => Cin_t,
				Res => Res_t,
				Cout => Cout_t);
	
	
	A_t <=	"0001" AFTER 5ns,
				"0010" AFTER 10ns,
				"0011" AFTER 15ns,
				"0100" AFTER 20ns,
				"0101" AFTER 25ns,
				"0110" AFTER 30ns,
				"0111" AFTER 35ns,
				"1000" AFTER 40ns,
				"1001" AFTER 45ns,
				
				"0000" AFTER 50ns,
				"0001" AFTER 55ns,
				"0010" AFTER 60ns,
				"0011" AFTER 65ns,
				"0100" AFTER 70ns,
				"0101" AFTER 75ns,
				"0110" AFTER 80ns,
				"0111" AFTER 85ns,
				"1000" AFTER 90ns,
				"1001" AFTER 95ns,
				
				"0000" AFTER 100ns,
				"0001" AFTER 105ns,
				"0010" AFTER 110ns,
				"0011" AFTER 115ns,
				"0100" AFTER 120ns,
				"0101" AFTER 125ns,
				"0110" AFTER 130ns,
				"0111" AFTER 135ns,
				"1000" AFTER 140ns,
				"1001" AFTER 145ns,
				
				"0000" AFTER 150ns,
				"0001" AFTER 155ns,
				"0010" AFTER 160ns,
				"0011" AFTER 165ns,
				"0100" AFTER 170ns,
				"0101" AFTER 175ns,
				"0110" AFTER 180ns,
				"0111" AFTER 185ns,
				"1000" AFTER 190ns,
				"1001" AFTER 195ns,
				
				"0000" AFTER 200ns,
				"0001" AFTER 205ns,
				"0010" AFTER 210ns,
				"0011" AFTER 215ns,
				"0100" AFTER 220ns,
				"0101" AFTER 225ns,
				"0110" AFTER 230ns,
				"0111" AFTER 235ns,
				"1000" AFTER 240ns,
				"1001" AFTER 245ns;
				
	B_t <=	"0010" AFTER 50ns,
				"0100" AFTER 100ns,
				"0110" AFTER 150ns,
				"1000" AFTER 200ns;
	
	

END ARCHITECTURE test;