----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:44 02/07/2018 
-- Design Name: 
-- Module Name:    shift_register - Behavioral 
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

entity shift_register is
	Generic( N : integer);
    Port ( clock : in std_logic;
			  value_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           shift : in  STD_LOGIC;
           value_out : out  STD_LOGIC);
end shift_register;

architecture Behavioral of shift_register is

	signal value : STD_LOGIC_VECTOR (N-1 downto 0);

begin
	
	value_out <= value(N-1);
	
	process ( clock, value_in, shift )
		begin
			if shift = '0' then
			value <= value_in;
			elsif rising_edge(clock) then
				value <= value(N-2 downto 0) & '0';
			end if;
	end process;


end Behavioral;
