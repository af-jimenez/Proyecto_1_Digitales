LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Subtractor4Bit IS

	PORT(	A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			Res	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Signo	:	OUT	STD_LOGIC);
			
END ENTITY Subtractor4Bit;
--------------------------------------
ARCHITECTURE gateLevel OF Subtractor4Bit IS

	SIGNAL	B_a2			:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	BbiggA		:	STD_LOGIC;
	SIGNAL	gnd			:	STD_LOGIC;
	SIGNAL	pRes			:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	p2sRes		:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	pResX			:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	p2sResX		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
--------------------------------------
BEGIN

	comparator:	ENTITY work.nBitComparator
	GENERIC MAP(	nBits	=> 4)
	PORT MAP(	A		=>	A,
					B		=>	B,
					sel	=>	'0',
					eq		=>	gnd,
					lg		=>	gnd,
					ls		=> BbiggA);
	
	Signo	<=	BbiggA;

	B_a2	<=	NOT(B);

	adder: ENTITY work.Adder4Bit
	PORT MAP(	A		=>	A,
					B		=>	B_a2,
					Cin	=>	'1',
					Res	=>	pRes,
					Cout	=>	gnd);
	
	atwosRes: ENTITY work.Adder4Bit
	PORT MAP(	A		=>	"not"(pRes),
					B		=>	"0001",
					Cin	=>	'0',
					Res	=>	p2sRes,
					Cout	=>	gnd);
					
	pResX <= ("0000" & pRes);
	p2sResX <= ("0000" & p2sRes);
	
	muxOut: ENTITY work.Bit8Mux2_1
		PORT MAP(X1		=>	pResX,
					X2		=>	p2sResX,
					sel	=>	BbiggA,
					Y		=>	Res);
	
END ARCHITECTURE	gateLevel;