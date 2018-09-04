-- Clock Filter del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_filter is

	generic(
				frequency_in : integer := 50000000;
				frequency_out : integer := 5000000
				);
	Port( clock_in : in std_logic;
		reset_n : in std_logic;
		clock_out : out std_logic
	);
end clock_filter;

architecture Behavioral of clock_filter is

constant hit_value : integer := (frequency_in/frequency_out) -1;

begin

	process(clock_in, reset_n)
	variable count : integer range 0 to hit_value := 0;
	
	begin
	
		if(reset_n = '0') then
			count := 0;
			clock_out <= '0';
		elsif(clock_in = '1' and clock_in'event) then
			if count = hit_value then
				clock_out <= '1';
				count := 0;
			else
				clock_out <= '0';
				count := count +1;
			end if;
		end if;
	end process;
	
end Behavioral;
	
	









