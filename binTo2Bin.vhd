LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY binTo2Bin IS
	
	PORT(	BinIn	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Signo	:	IN		STD_LOGIC;
			Sel	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			Bin0	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			Bin1	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0));
			
			
END ENTITY binTo2Bin;
--------------------------------------
ARCHITECTURE functional OF binTo2Bin IS

	TYPE subsArray IS	ARRAY (0 TO 15) OF	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Subs		:	subsArray;
	SIGNAL	coef		:	subsArray;
	SIGNAL	Comps		:	STD_LOGIC_VECTOR(15 DOWNTO 0)	:=	"0000000000000000";
	SIGNAL	p0			:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	p00		:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL	p1			:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	p1X		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	p01		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	ndaSubed	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	gnd		:	STD_LOGIC;
--------------------------------------
BEGIN
	
	Subs(0)	<=	BinIn;
	
	coef(0)	<=	"00001010";
	coef(1)	<=	"00010100";
	coef(2)	<=	"00011110";
	coef(3)	<=	"00101000";
	coef(4)	<=	"00110010";
	coef(5)	<=	"00111100";
	coef(6)	<=	"01000110";
	coef(7)	<=	"01010000";
	coef(8)	<=	"01011010";
	coef(9)	<=	"01100100";
	coef(10)	<=	"01101110";
	coef(11)	<=	"01111000";
	coef(12)	<=	"10000010";
	coef(13)	<=	"10001100";
	coef(14)	<=	"10010110";
	coef(15)	<=	"10100000";
	
	subsGenerate: FOR i IN 0 TO 9 GENERATE
		
		compComp: ENTITY work.nBitComparator
			GENERIC MAP( nBits	=>	8)
			PORT MAP(A		=>	Subs(i),
						B		=>	"00001010",
						Sel	=>	'0',
						eq		=>	gnd,
						lg		=>	gnd,
						ls		=>	Comps(i));
		
		subComp: ENTITY work.Subtractor8Bit
			PORT MAP(A		=>	Subs(0),
						B		=>	coef(i),
						Res	=>	Subs(i+1));
			
	END GENERATE subsGenerate;
	
	encoder:	ENTITY work.Encoder16_4
	PORT MAP(X		=>	Comps,
				Y		=>	p1);
	
	p00(0)	<=	(Sel(0) AND Signo);
	p00(1)	<=	(Sel(1) AND Signo);
	
	p1X <= ("0000"&p1);
	
	mux1:	ENTITY work.Bit8Mux4_1
		PORT MAP(X1	=>	p1X,
					X2	=>	p1X,
					X3	=>	"00001010",
					X4	=>	p1X,
					sel	=>	p00,
					Y	=>	p01);

	Bin1	<=	p01(3 DOWNTO 0);
	
	mux16_1:	ENTITY work.Bit8Mux16_1
	PORT MAP(X1		=>	Subs(0),
				X2		=>	Subs(1),
				X3		=>	Subs(2),
				X4		=>	Subs(3),
				X5		=>	Subs(4),
				X6		=>	Subs(5),
				X7		=>	Subs(6),
				X8		=>	Subs(7),
				X9		=>	Subs(8),
				X10	=>	Subs(9),
				X11	=>	Subs(10),
				X12	=>	Subs(11),
				X13	=>	Subs(12),
				X14	=>	Subs(13),
				X15	=>	Subs(14),
				X16	=>	Subs(15),
				sel	=>	p1,
				Y		=>	p0);
	
	Bin0	<=	p0(3 DOWNTO 0);
	
END ARCHITECTURE	functional;