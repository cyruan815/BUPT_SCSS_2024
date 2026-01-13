library ieee;
use ieee.std_logic_1164.all;

-- 定义 74374 寄存器的实体
entity Register74374 is
    port (
        D   : in  std_logic_vector(7 downto 0); -- 8位数据输入
        CLK : in  std_logic;                    -- 时钟信号
        OE  : in  std_logic;                    -- 输出控制 (高电平有效)
        Q   : out std_logic_vector(7 downto 0)  -- 8位数据输出
    );
end Register74374;

-- 定义 74374 寄存器的结构体
architecture behavioral of Register74374 is
    -- 内部信号，用于存储寄存器中的数据
    signal temp : std_logic_vector(7 downto 0) := (others => '0');
begin
    process (CLK,OE)
    begin
		if OE = '1'	then 
			Q <= (others => 'Z');		--OE为1，输出高阻态
		elsif rising_edge(CLK)	then		--否则将输入数据存入中间信号
			temp <= D;
		end if;
		
		if OE = '0'	then 
			Q <= temp;		--输出
		end if;
    end process;


end architecture behavioral;