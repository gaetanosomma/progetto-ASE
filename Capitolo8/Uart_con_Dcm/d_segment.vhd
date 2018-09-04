-- Segmento D del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_segment is
    Port ( 	
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
   );
end d_segment;

architecture dataflow of d_segment is

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
	component b_segment is
		Port (

			Xin : in std_logic_vector(3 downto 0);
			--(x,0) (y,1) (z,2) (v,3)
			Xout : out std_logic
	);
	end component;

	signal e_out, f_out, b_out: std_logic := '0';

begin

		inst_e: e_segment port map(
						Xin => Xin,
						Xout => e_out
					);
					
		inst_f: f_segment port map(
						Xin => Xin,
						Xout => f_out
					);

		inst_b: b_segment port map(
						Xin => Xin,
						Xout => b_out
					);	
					
	Xout <= not(
		( not(Xin(2)) and Xin(1) and f_out) 
		or (Xin(0) and not(f_out) and e_out) 
		or (not(Xin(1)) and not(e_out)) 
		or (b_out and not(Xin(0))) 
		or (not(Xin(2)) and b_out)
		);

end dataflow;
