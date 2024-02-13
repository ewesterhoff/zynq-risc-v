----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 03:03:58 PM
-- Design Name: 
-- Module Name: pipeline - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipeline is
    Port ( clk : in STD_LOGIC;
           led0 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC);
end pipeline;

architecture Behavioral of pipeline is
    -- Define pipeline stages
    type stage_type is (F, ID, EX, MEM, WB);
    signal pipeline_register : stage_type;

    -- Define pipeline registers
    signal IF_ID_reg : STD_LOGIC_VECTOR(31 downto 0);
    signal ID_EX_reg : STD_LOGIC_VECTOR(31 downto 0);
    signal EX_MEM_reg : STD_LOGIC_VECTOR(31 downto 0);
    signal MEM_WB_reg : STD_LOGIC_VECTOR(31 downto 0);
    
    -- Define test registers
    signal count : unsigned(24 downto 0) := (others => '0');

begin
    -- Pipeline stages
    process(clk)
    begin
        if rising_edge(clk) then
            count <= count + 1;
            -- Pipeline stages implementation
            case pipeline_register is
                when F =>
                    -- Implement instruction fetch logic
                    -- Update pipeline register
                    if count(24) = '1' then
                        pipeline_register <= ID;
                        led0 <= '1';
                        led1 <= '0';
                        led2 <= '0';
                        led3 <= '0';
                        count <= (others => '0');
                    end if;
                when ID =>
                    -- Implement instruction decode logic
                    -- Update pipeline register
                    if count(24) = '1' then
                        pipeline_register <= EX;
                        led0 <= '0';
                        led1 <= '1';
                        led2 <= '0';
                        led3 <= '0';
                        count <= (others => '0');
                    end if;
                when EX =>
                    -- Implement execute logic
                    -- Update pipeline register
                    if count(24) = '1' then
                        pipeline_register <= MEM;
                        led0 <= '0';
                        led1 <= '0';
                        led2 <= '1';
                        led3 <= '0';
                        count <= (others => '0');
                    end if;
                when MEM =>
                    -- Implement memory access logic
                    -- Update pipeline register
                    if count(24) = '1' then
                        pipeline_register <= WB;
                        led0 <= '0';
                        led1 <= '0';
                        led2 <= '0';
                        led3 <= '1';
                        count <= (others => '0');
                    end if;
                when WB =>
                    -- Implement write-back logic
                    -- Update pipeline register
                    if count(24) = '1' then
                        pipeline_register <= F;
                        led0 <= '0';
                        led1 <= '0';
                        led2 <= '0';
                        led3 <= '0';
                        count <= (others => '0');
                    end if;
                when others =>
                    null; -- Should not occur
            end case;
        end if;
    end process;

    -- Output result based on WB stage

end Behavioral;
