library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Gray8421 is
	port (z:IN STD_LOGIC_VECTOR(3 downto 0);	--输入8421码
			f:OUT STD_LOGIC_VECTOR(3 downto 0));--输出：格雷码
end Gray8421;

architecture arch of Gray8421 is
	signal temp:STD_LOGIC_VECTOR(3 downto 0);	--中间信号，存储转换结果
	begin
	process(z)
	begin
		temp(3)<=z(3);			--最高位
		for i in 2 downto 0 loop
			temp(i)<=z(i+1) xor z(i);	--其余位依次异或
		end loop;
		f<=temp;		--输出
	end process;
end arch;
