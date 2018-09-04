--segmento F del display a 7 segmenti
-- creato dal gruppo 2 del corso di ASE 2017/2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity f_segment is

	Port (

		Xin : in std_logic_vector(3 downto 0);
		--(x,0) (y,1) (z,2) (v,3)
		Xout : out std_logic
	);

end f_segment;

architecture dataflow of f_segment is

	component b_segment is
		Port (

			Xin : in std_logic_vector(3 downto 0);
			--(x,0) (y,1) (z,2) (v,3)
			Xout : out std_logic
	);
	
	end component;

	signal b_out : std_logic := '0';
	begin

		inst_b: b_segment port map(
						Xin => Xin,
						Xout => b_out
					);
	
		Xout <= not(	
				(not(Xin(1)) and not(Xin(0))) 
				 or (Xin(3) and not(Xin(2)))
				 or b_out
			);


end dataflow;
