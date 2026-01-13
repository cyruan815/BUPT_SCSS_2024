library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(	
		A		:IN 	std_logic;	--输入加数A
		B		:IN 	std_logic;	--输入加数B
		Cin	:IN 	std_logic;	--输入进位
		S		:OUT 	std_logic;	--输出和
		Cout	:OUT 	std_logic	--输出进位
	);
end FullAdder;

architecture arc of FullAdder is
begin
	process(A,B,Cin)
	begin
		S <= A xor B xor Cin;
		Cout <= ((A xor B) and Cin) or (A and B);
	end process;
end arc;
		