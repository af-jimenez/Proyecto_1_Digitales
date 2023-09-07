LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY tb_main is
END ENTITY tb_main;

ARCHITECTURE test OF tb_main is

			signal A_t		:			STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
			signal B_t		:			STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
			signal Sel_t	:			STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
			signal Seg_1_t	:			STD_LOGIC_VECTOR(6 DOWNTO 0);
			signal Seg_2_t	:			STD_LOGIC_VECTOR(6 DOWNTO 0);
			signal Seg_3_t	:			STD_LOGIC_VECTOR(6 DOWNTO 0);
			signal Seg_4_t	:			STD_LOGIC_VECTOR(6 DOWNTO 0);
			
BEGIN
	
	dut: ENTITY work.Main
	PORT MAP(
				A => A_t,
				B => B_t,
				Sel => Sel_t,
				Seg_1 => Seg_1_t,
				Seg_2 => Seg_2_t,
				Seg_3 => Seg_3_t,
				Seg_4 => Seg_4_t);
	
	
	A_t <=	"0001" AFTER 5ns, -- +2
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
				"1001" AFTER 245ns,
				
				"0000" AFTER 250ns, -- -2
				"0001" AFTER 255ns, 
				"0010" AFTER 260ns,
				"0011" AFTER 265ns,
				"0100" AFTER 270ns,
				"0101" AFTER 275ns,
				"0110" AFTER 280ns,
				"0111" AFTER 285ns,
				"1000" AFTER 290ns,
				"1001" AFTER 295ns,
				
				"0000" AFTER 300ns,
				"0001" AFTER 305ns,
				"0010" AFTER 310ns,
				"0011" AFTER 315ns,
				"0100" AFTER 320ns,
				"0101" AFTER 325ns,
				"0110" AFTER 330ns,
				"0111" AFTER 335ns,
				"1000" AFTER 340ns,
				"1001" AFTER 345ns,
				
				"0000" AFTER 350ns,
				"0001" AFTER 355ns,
				"0010" AFTER 360ns,
				"0011" AFTER 365ns,
				"0100" AFTER 370ns,
				"0101" AFTER 375ns,
				"0110" AFTER 380ns,
				"0111" AFTER 385ns,
				"1000" AFTER 390ns,
				"1001" AFTER 395ns,
				
				"0000" AFTER 400ns,
				"0001" AFTER 405ns,
				"0010" AFTER 410ns,
				"0011" AFTER 415ns,
				"0100" AFTER 420ns,
				"0101" AFTER 425ns,
				"0110" AFTER 430ns,
				"0111" AFTER 435ns,
				"1000" AFTER 440ns,
				"1001" AFTER 445ns,
				
				"0000" AFTER 450ns,
				"0001" AFTER 455ns,
				"0010" AFTER 460ns,
				"0011" AFTER 465ns,
				"0100" AFTER 470ns,
				"0101" AFTER 475ns,
				"0110" AFTER 480ns,
				"0111" AFTER 485ns,
				"1000" AFTER 490ns,
				"1001" AFTER 495ns,
				
				"0000" AFTER 500ns, -- *2
				"0001" AFTER 505ns, 
				"0010" AFTER 510ns,
				"0011" AFTER 515ns,
				"0100" AFTER 520ns,
				"0101" AFTER 525ns,
				"0110" AFTER 530ns,
				"0111" AFTER 535ns,
				"1000" AFTER 540ns,
				"1001" AFTER 545ns,
				
				"0000" AFTER 550ns,
				"0001" AFTER 555ns,
				"0010" AFTER 560ns,
				"0011" AFTER 565ns,
				"0100" AFTER 570ns,
				"0101" AFTER 575ns,
				"0110" AFTER 580ns,
				"0111" AFTER 585ns,
				"1000" AFTER 590ns,
				"1001" AFTER 595ns,
				
				"0000" AFTER 600ns,
				"0001" AFTER 605ns,
				"0010" AFTER 610ns,
				"0011" AFTER 615ns,
				"0100" AFTER 620ns,
				"0101" AFTER 625ns,
				"0110" AFTER 630ns,
				"0111" AFTER 635ns,
				"1000" AFTER 640ns,
				"1001" AFTER 645ns,
				
				"0000" AFTER 650ns,
				"0001" AFTER 655ns,
				"0010" AFTER 660ns,
				"0011" AFTER 665ns,
				"0100" AFTER 670ns,
				"0101" AFTER 675ns,
				"0110" AFTER 680ns,
				"0111" AFTER 685ns,
				"1000" AFTER 690ns,
				"1001" AFTER 695ns,
				
				"0000" AFTER 700ns,
				"0001" AFTER 705ns,
				"0010" AFTER 710ns,
				"0011" AFTER 715ns,
				"0100" AFTER 720ns,
				"0101" AFTER 725ns,
				"0110" AFTER 730ns,
				"0111" AFTER 735ns,
				"1000" AFTER 740ns,
				"1001" AFTER 745ns;
				
	B_t <=	"0010" AFTER 50ns,
				"0100" AFTER 100ns,
				"0110" AFTER 150ns,
				"1000" AFTER 200ns,
				
				"0000" AFTER 250ns,
				"0010" AFTER 300ns,
				"0100" AFTER 350ns,
				"0110" AFTER 400ns,
				"1000" AFTER 450ns,
				
				"0000" AFTER 500ns,
				"0010" AFTER 550ns,
				"0100" AFTER 600ns,
				"0110" AFTER 650ns,
				"1000" AFTER 700ns;
				
	Sel_t <= "10" AFTER 250ns,
				"11" AFTER 500ns;
				
END ARCHITECTURE test;