-- Bit Selector del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bit_selector is
	Port( SEL : in std_logic_vector (1 downto 0);
		Xin : in std_logic_vector (15 downto 0);
		dots: std_logic_vector (3 downto 0);
		Xout : out std_logic_vector (4 downto 0)
	);
end bit_selector;
architecture behavioral of bit_selector is

begin
	process(SEL, dots, Xin)
		begin
			if(SEL = "00") then
				Xout(3 downto 0) <= Xin(3 downto 0);
			elsif( SEL = "01" ) then
				Xout(3 downto 0) <= Xin(7 downto 4);
			elsif( SEL = "10" ) then
				Xout(3 downto 0) <= Xin(11 downto 8);
			else
				Xout(3 downto 0) <= Xin(15 downto 12);
			end if;
			
			Xout(4) <= dots(to_integer(unsigned(SEL)));
			
	end process;

end behavioral;

		
