library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
	port(
		clk	: IN std_logic;		--时钟信号
		reset	: IN std_logic;		--复位信号
		count	: OUT std_logic_vector(3 downto 0)	--四为计数
	);
end counter;

architecture arch of counter is
	signal temp :	std_logic_vector(3 downto 0);
begin
	process(clk, reset)
	begin
		if rising_edge(clk) then
		if(reset = '1') then		--同步复位
				temp <= (others => '0');
			else 
				temp <= temp + 1;
			end if;
		end if;
	end process;
	
	count <= temp;
end arch;