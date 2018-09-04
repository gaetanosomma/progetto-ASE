-- Descriviamo un contatore modulo 4
-- per utilizzarlo per l'accensione delle cifre
-- del display a 7 segmenti

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_mod4 is
	port (
		en : in std_logic;
		reset_n : in std_logic;
		clk : in std_logic;
		q : out std_logic_vector(1 downto 0)
	);
end counter_mod4;

architecture behavioral of counter_mod4 is 

signal count : std_logic_vector(1 downto 0) := (others => '0');
begin

q <= count;

process(clk, reset_n)
begin
	if reset_n = '0' then
		count <= (others => '0');
	elsif clk = '1' and clk'event then
		if en = '1' then
			count <= std_logic_vector(unsigned(count)+1);
		end if;
	end if;
end process;

end behavioral;
