----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:03 02/07/2018 
-- Design Name: 
-- Module Name:    c_unit - Behavioral 
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

entity c_unit is
    Port ( control_input : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           stop : out  STD_LOGIC;
           start : out  STD_LOGIC);
end c_unit;

architecture Behavioral of c_unit is
	type state is (
			operative,
			idle
		);
	current, next_state : state := idle
begin

		change_state : process (clock, reset)
		begin
			if rising_edge(clock) then
					current_state <= next_state;
			end if;
		end process;
		
		calculate_state : process (control_input, current_state)
		begin
			case current_state is
				when idle =>
				if countol_input'event
			
				when read_stop  =>
	
			end case;
		
		end process;

end Behavioral;

