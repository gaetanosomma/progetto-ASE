----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:48:56 02/02/2018 
-- Design Name: 
-- Module Name:    counter_mod_P - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_mod_P is
	Generic( P : integer := 8);
    Port ( clock : in  STD_LOGIC;
           counter_hit : out  STD_LOGIC;
           enable : in  STD_LOGIC);
end counter_mod_P;

architecture Behavioral of counter_mod_P is

begin

	process(clock, enable)
	variable count : integer := 0;
	begin
		if(rising_edge(clock) and enable = '1') then
			if(count = P - 1) then
				counter_hit <= '1';
			else count := count + 1;
				counter_hit <= '0';
			end if;
		end if;
	end process;
end Behavioral;

