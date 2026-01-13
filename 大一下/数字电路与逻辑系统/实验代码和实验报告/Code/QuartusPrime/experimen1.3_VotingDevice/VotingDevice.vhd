library ieee;
use ieee.std_logic_1164.all;

entity VotingDevice is
	port(
		vote 		: IN 	std_logic_vector(3 downto 0);	--表示四个独立的表决信号
		result	: OUT std_logic		--表决结果输出
		);
end VotingDevice;

architecture arc of VotingDevice is
begin
	process(vote)
	variable count :integer range 0 to 4;	--计数器，记录高电平的个数
	
	begin
		count := 0;
		for i in 0 to 3 loop
			if vote(i) = '1' then count := count+1;
			end if;
		end loop;
		
		if(count >= 3) then 		--根据计数器数量输出表决结果
				result <= '1';
		else 
				result <= '0';
		end if;
		
		end process;
end arc;
			
		
		
		
		
		
		
		
		
		