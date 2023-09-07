LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY tb_BinToBCD is
END ENTITY tb_BinToBCD;

ARCHITECTURE test OF tb_BinToBCD is

			signal BinIn_t	:	STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
			signal Signo_t	:	STD_LOGIC := '0';
			signal Sel_t	:	STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
			signal Bin0_t	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
			signal Bin1_t	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
			
BEGIN
	
	dut: ENTITY work.binTo2Bin
	PORT MAP(
				BinIn => BinIn_t,
				Signo => Signo_t,
				Sel => Sel_t,
				Bin0 => Bin0_t,
				Bin1 => Bin1_t);
	
	
	BinIn_t <=	"00000001" AFTER 5ns, 
				"00000111" AFTER 10ns, --7
				"00001100" AFTER 15ns, -- 12
				"00010000" AFTER 20ns, -- 16
				"00010100" AFTER 25ns, --20
				"00100000" AFTER 30ns, -- 32
				"00100100" AFTER 35ns, -- 36
				"00101000" AFTER 40ns, -- 40
				"00101101" AFTER 45ns, -- 45
				"00110010" AFTER 50ns, -- 50
				"00110110" AFTER 55ns, -- 54
				"00111100" AFTER 60ns, -- 60
				"01000000" AFTER 65ns, -- 64
				"01000100" AFTER 70ns, -- 68
				"01001010" AFTER 75ns, -- 73
				"01001111" AFTER 80ns, -- 79
				"01010000" AFTER 85ns, -- 80
				"01010001" AFTER 90ns, -- 81
				
				"00000001" AFTER 100ns,
				"00000010" AFTER 105ns,
				"00000011" AFTER 110ns,
				"00000100" AFTER 115ns,
				"00000101" AFTER 120ns,
				"00000110" AFTER 125ns,
				"00000111" AFTER 130ns,
				"00001000" AFTER 135ns,
				"00001001" AFTER 140ns;
				
				
	Sel_t <=	"11" AFTER 100ns;
	Signo_t <= '1' AFTER 100ns;
	

END ARCHITECTURE test;