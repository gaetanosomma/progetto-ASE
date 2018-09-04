----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:48 02/27/2018 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( en : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(7 downto 0));
end counter;

architecture Behavioral of counter is

signal count : std_logic_vector(7 downto 0) := (others => '0');

begin

q <= count;

	process(clock, reset_n)
	begin
		if reset_n = '0' then
			count <= (others => '0');
		elsif clock = '1' and clock'event then
			if en = '1' then
				count <= std_logic_vector(unsigned(count)+1);
			end if;
		end if;
	end process;


end Behavioral;

