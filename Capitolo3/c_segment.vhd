--segmento C del display a 7 segmenti
-- creato dal gruppo 2 del corso di ASE 2017/2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c_segment is

	Port (

		Xin : in std_logic_vector(3 downto 0);
		--(x,0) (y,1) (z,2) (v,3)
		Xout : out std_logic
	);

end c_segment;

architecture dataflow of c_segment is

	component e_segment is
		Port (

			Xin : in std_logic_vector(3 downto 0);
			--(x,0) (y,1) (z,2) (v,3)
			Xout : out std_logic
	);
	end component;
		component f_segment is
		Port (

			Xin : in std_logic_vector(3 downto 0);
			--(x,0) (y,1) (z,2) (v,3)
			Xout : out std_logic
	);
	end component;

	component a_segment is
		Port (

			Xin : in std_logic_vector(3 downto 0);
			--(x,0) (y,1) (z,2) (v,3)
			Xout : out std_logic
	);
	end component;


	signal a_out,e_out,f_out : std_logic := '0';

	begin

		inst_e: e_segment port map(
						Xin => Xin,
						Xout => e_out
					);
		inst_f: f_segment port map(
						Xin => Xin,
						Xout => f_out
					);
		inst_a: a_segment port map(
						Xin => Xin,
						Xout => a_out
					);

		Xout <= not( 
				(not(f_out) and not(Xin(2)))
				 or (not(Xin(3)) and not(f_out))
				 or (e_out)
				 or (a_out)
			);


end dataflow;
