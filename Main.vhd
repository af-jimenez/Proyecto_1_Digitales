LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------
ENTITY Main IS

	PORT(	A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			Sel	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			Seg_1	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			Seg_2	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			Seg_3	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			Seg_4	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0));

END ENTITY Main;
--------------------------------------
ARCHITECTURE functional OF Main IS

	SIGNAL	pCalc	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	gnd	:	STD_LOGIC;
	SIGNAL	C00	:	STD_LOGIC;
	SIGNAL	C01	:	STD_LOGIC;
	SIGNAL	C0		:	STD_LOGIC;
	SIGNAL	sig_0	:	STD_LOGIC;
	SIGNAL	bin_A	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	bin_B	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	A_sig	:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL	B_sig	:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL	Dig0	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	Dig1	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	bin_0	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	bin_1	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	Out1_sig	:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL	Out2_sig	:	STD_LOGIC_VECTOR(6 DOWNTO 0);
--------------------------------------
BEGIN

	errorAin: ENTITY work.nBitComparator
	GENERIC MAP( nBits => 4 )
	PORT MAP(	A		=>	A,
					B		=> "1001",
					Sel	=>	'0',
					eq		=>	gnd,
					lg		=>	C00,
					ls		=>	gnd);

	muxAerr: ENTITY work.Bit4Mux2_1
	PORT MAP(	X1		=>	A,
					X2		=>	"1110",
					sel	=>	C00,
					Y		=>	bin_A);
	
	binAsseg: ENTITY work.bin_to_sseg
	PORT MAP(	bin	=>	bin_A,
					sseg	=>	A_sig);
	
	errorBin: ENTITY work.nBitComparator
	GENERIC MAP( nBits => 4 )
	PORT MAP(	A		=>	B,
					B		=> "1001",
					Sel	=>	'0',
					eq		=>	gnd,
					lg		=>	C01,
					ls		=>	gnd);
	
	muxBerr: ENTITY work.Bit4Mux2_1
	PORT MAP(	X1		=>	B,
					X2		=>	"1110",
					sel	=>	C01,
					Y		=>	bin_B);
	
	binBsseg: ENTITY work.bin_to_sseg
	PORT MAP(	bin	=>	bin_B,
					sseg	=>	B_sig);
	
	Seg_1	<=	A_sig;
	Seg_2	<=	B_sig;
	C0	<=	(C00 OR C01);
	
	calc:	ENTITY work.Calculator4Bit
	PORT MAP(	A		=> A,
					B		=> B,
					Sel	=> Sel,
					Res	=> pCalc,
					Signo	=>	sig_0);
	
	binSeparate: ENTITY work.binTo2bin
	PORT MAP(	BinIn	=>	pCalc,
					Signo	=>	sig_0,
					Sel	=>	Sel,
					Bin0	=>	Dig0,
					Bin1	=>	Dig1);
	
	muxOut1err: ENTITY work.Bit4Mux2_1
	PORT MAP(	X1		=>	Dig0,
					X2		=>	"1110",
					sel	=>	C0,
					Y		=>	bin_0);
	
	binOut1sseg: ENTITY work.bin_to_sseg
	PORT MAP(	bin	=>	bin_0,
					sseg	=>	Out1_sig);
	
	muxOut2err: ENTITY work.Bit4Mux2_1
	PORT MAP(	X1		=>	Dig1,
					X2		=>	"1110",
					sel	=>	C0,
					Y		=>	bin_1);
	
	binOut2sseg: ENTITY work.bin_to_sseg
	PORT MAP(	bin	=>	bin_1,
					sseg	=>	Out2_sig);
	
	Seg_3	<=	Out2_sig;	
	Seg_4	<=	Out1_sig;
	
END ARCHITECTURE	functional;