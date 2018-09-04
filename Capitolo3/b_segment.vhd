-- Segmento B del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity b_segment is
    Port ( 	
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)
		Xout : out  std_logic
   );
end b_segment;

architecture dataflow of b_segment is

	component e_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,3) , (y,2) , (z,1) , (v,0)	
		Xout : out  std_logic
  	 );
	end component;

signal e_out : std_logic := '0';

begin

	inst_e: e_segment port map(
					   Xin => Xin,
					   Xout => e_out
					   );


	Xout <= not(
			(not(Xin(3)) and not(Xin(1)) and not(Xin(0)))
			or (Xin(3) and not(Xin(1)) and Xin(0))
			or (Xin(1) and e_out) 
			or(not(Xin(2)) and e_out)
			or (not(Xin(2)) and not(Xin(0)))
		);

end dataflow;

