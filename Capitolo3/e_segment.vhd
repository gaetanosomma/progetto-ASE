-- Segmento E del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity e_segment is
	Port(
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0), (y,1), (z,2), (v,3)
		Xout : out std_logic
	);
end e_segment;

architecture dataflow of e_segment is

begin

	Xout <= not( 
			(Xin(1) and not(Xin(0))) 
			or (not(Xin(2)) and not(Xin(0))) 
			or (Xin(3) and Xin(2))
			or (Xin(3) and Xin(1))
		 );
		 
end dataflow;

