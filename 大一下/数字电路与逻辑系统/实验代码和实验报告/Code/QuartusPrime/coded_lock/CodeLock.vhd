LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- 实体声明：定义模块的输入和输出端口
ENTITY CodeLock IS
    PORT (
        clk        : IN  std_logic;  -- 时钟信号
        reset      : IN  std_logic;  -- 复位信号 (高电平有效, 异步)
        data_in    : IN  std_logic;  -- 数据输入 (密码位或待设置位)
        set_mode   : IN  std_logic;  -- 模式选择: '1' 为设置模式, '0' 为验证模式
        unlocked   : OUT std_logic   -- 输出: '1' 表示解锁, '0' 表示锁定
    );
END ENTITY CodeLock;

-- 架构实现：描述模块内部的逻辑
ARCHITECTURE Behavioral OF CodeLock IS

    -- 定义 FSM 的状态类型
    TYPE state_type IS (
        S_IDLE,        -- 初始状态, 等待密码或进入设置模式
        S_P1_OK,       -- 验证模式: 第1位正确, 等待第2位
        S_P2_OK,       -- 验证模式: 第2位正确, 等待第3位
        S_UNLOCKED,    -- 验证模式: 所有位正确, 解锁

        S_SET_INIT,    -- 设置模式: 进入设置模式, 准备接收第1位
        S_SET_P1,      -- 设置模式: 第1位已接收, 准备接收第2位
        S_SET_P2,      -- 设置模式: 第2位已接收, 准备接收第3位
        S_SET_DONE     -- 设置模式: 所有位已接收, 密码更新完成
    );

    -- 内部信号用于保存当前状态和下一个状态
    SIGNAL current_state : state_type;
    SIGNAL next_state    : state_type;

    -- 内部信号用于存储 3 位密码。默认初始密码是 "101"。
    SIGNAL stored_password : std_logic_vector(2 downto 0) := "101";

BEGIN

    -- 同步进程: 状态寄存器和密码存储寄存器
    -- 负责在时钟上升沿更新 'current_state' 和在设置模式下更新 'stored_password'
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN                 -- 异步复位 (高电平有效)
            current_state <= S_IDLE;        -- 强制回到 IDLE 状态
            stored_password <= "101";       -- 复位密码到默认值
        ELSIF rising_edge(clk) THEN         -- 在时钟上升沿时
            current_state <= next_state;    -- 更新 FSM 状态

            -- 根据当前状态在设置模式下存储密码位
            CASE current_state IS
                WHEN S_SET_INIT =>          -- 存储第1位 (最高位)
                    IF set_mode = '1' THEN -- 确保仍然在设置模式下才存储
                        stored_password(2) <= data_in; 
                    END IF;
                WHEN S_SET_P1 =>            -- 存储第2位
                    IF set_mode = '1' THEN
                        stored_password(1) <= data_in;
                    END IF;
                WHEN S_SET_P2 =>            -- 存储第3位 (最低位)
                    IF set_mode = '1' THEN
                        stored_password(0) <= data_in;
                    END IF;
                WHEN OTHERS =>
                    NULL; -- 其他状态不修改密码
            END CASE;
        END IF;
    END PROCESS;

    -- 组合逻辑进程: 下一个状态逻辑和输出逻辑
    -- 根据 'current_state' 和输入信号计算 'next_state' 和 'unlocked'
    PROCESS (current_state, data_in, set_mode, stored_password)
    BEGIN
        -- 组合逻辑的默认赋值
        next_state <= current_state; -- 默认情况下, 保持在当前状态
        unlocked   <= '0';           -- 默认情况下, 密码锁是关闭的

        -- FSM 状态转移逻辑
        CASE current_state IS

            -- 验证模式状态
            WHEN S_IDLE =>
                IF set_mode = '1' THEN                 -- 如果 'set_mode' 激活
                    next_state <= S_SET_INIT;          -- 进入密码设置模式
                ELSIF data_in = stored_password(2) THEN -- 检查密码第1位 (最高位)
                    next_state <= S_P1_OK;             -- 第1位正确, 进入下一状态
                ELSE
                    next_state <= S_IDLE;              -- 第1位不正确, 保持在 IDLE
                END IF;

            WHEN S_P1_OK =>
                IF set_mode = '1' THEN                 -- 如果在验证中途激活 'set_mode'
                    next_state <= S_IDLE;              -- 中止验证, 回到 IDLE (安全考虑)
                ELSIF data_in = stored_password(1) THEN -- 检查密码第2位
                    next_state <= S_P2_OK;             -- 第2位正确, 进入下一状态
                ELSE
                    next_state <= S_IDLE;              -- 不正确, 回到 IDLE
                END IF;

            WHEN S_P2_OK =>
                IF set_mode = '1' THEN                 -- 如果在验证中途激活 'set_mode'
                    next_state <= S_IDLE;              -- 中止验证, 回到 IDLE
                ELSIF data_in = stored_password(0) THEN -- 检查密码第3位 (最低位)
                    next_state <= S_UNLOCKED;          -- 所有位正确, 解锁!
                ELSE
                    next_state <= S_IDLE;              -- 不正确, 回到 IDLE
                END IF;

            WHEN S_UNLOCKED =>
                unlocked <= '1';                       -- 密码已解锁, 输出为 '1'
                IF set_mode = '1' THEN                 -- 如果从解锁状态进入设置模式
                    next_state <= S_IDLE;              -- 先重新锁定 (回到 IDLE) 再设置新密码
                ELSE
                    next_state <= S_UNLOCKED;          -- 否则, 保持解锁状态
                END IF;
            
            -- 设置模式状态
            WHEN S_SET_INIT =>
                unlocked <= '0';                       -- 设置模式下始终锁定
                IF set_mode = '0' THEN                 -- 如果中途退出设置模式
                    next_state <= S_IDLE;              -- 回到验证模式的 IDLE
                ELSE
                    next_state <= S_SET_P1;            -- 继续设置, 准备接收第2位
                END IF;

            WHEN S_SET_P1 =>
                unlocked <= '0';
                IF set_mode = '0' THEN
                    next_state <= S_IDLE;
                ELSE
                    next_state <= S_SET_P2;            -- 继续设置, 准备接收第3位
                END IF;

            WHEN S_SET_P2 => 
                unlocked <= '0';
                IF set_mode = '0' THEN
                    next_state <= S_IDLE;
                ELSE
                    next_state <= S_SET_DONE;          -- 所有新密码位已接收
                END IF;

            WHEN S_SET_DONE =>
                unlocked <= '0';
                next_state <= S_IDLE;                  -- 设置完成, 自动返回验证模式的 IDLE 状态 (新密码已激活)
            
            -- 默认处理任何未预期的状态 
            WHEN OTHERS =>
                next_state <= S_IDLE;
                unlocked   <= '0';

        END CASE;
    END PROCESS;

END ARCHITECTURE Behavioral;