LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY memoriaRom IS
	PORT (
		Clock : IN STD_LOGIC;
		input_port : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		output_port : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END memoriaRom;

ARCHITECTURE Behavior OF memoriaRom IS
	TYPE InstructionMemory IS ARRAY (0 TO 255) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
	CONSTANT memoria_Rom : InstructionMemory := (

--	Teste addi, add, subi, li e jump
	0 => "01000010", -- addi S0 2 -- S0 == 2
	1 => "01000111", -- addi S1 3 -- S1 == 3
	2 => "00100001", -- add S0 S1 -- S0 == 5
	3 => "01000011", -- addi S0 3 -- S0 == 8
	4 => "01010010", -- subi S0 2 -- S0 == 6
	5 => "01110000", -- li S0 0
	6 => "01110100", -- li S1 0
	7 => "10110000", -- jump 0000
	OTHERS => "11111111");

BEGIN
	PROCESS (Clock, input_port)
	BEGIN
		output_port <= memoria_Rom(conv_integer(unsigned(input_port)));
	END PROCESS;
END Behavior;