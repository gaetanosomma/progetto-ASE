--anodes_manager del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity anodes_manager is
	port(
		EN : in STD_LOGIC_VECTOR(3 downto 0);
		SEL : in STD_LOGIC_VECTOR(1 downto 0);
		Xout : out STD_LOGIC_VECTOR(3 downto 0)
	);

end anodes_manager;

architecture behavioral of anodes_manager is

signal anodes : STD_LOGIC_VECTOR(3 downto 0);

begin 

Xout <= not anodes or not EN;

	process(SEL, EN)

		begin
				if( SEL = "00") then
					anodes <= "0001";
				elsif( SEL = "01") then
					anodes <= "0010";
				elsif( SEL = "10") then
					anodes <= "0100";
				else 
					anodes <= "1000";
				end if;
	end process;
end architecture;
