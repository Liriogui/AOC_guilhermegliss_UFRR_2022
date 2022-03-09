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

  -- TESTE FIBONACCI
  0 => "01000000", -- ADDI S0 0
  1 => "00010000", -- SW S0
  2 => "01000001", -- ADDI S0 1
  3 => "01000101", -- ADDI S1 1
  4 => "00001100", -- LW S3 00
  5 => "00101101", -- ADD S3 S1
  6 => "00100100", -- ADD S2 S1
  7 => "00000000", -- LW S0 00
  8 => "00100011", -- ADD S0 S3
  9 => "10110100", -- J 0100
  OTHERS => "11111111");

BEGIN
	PROCESS (Clock, input_port)
	BEGIN
		output_port <= memoria_Rom(conv_integer(unsigned(input_port)));
	END PROCESS;
END Behavior;