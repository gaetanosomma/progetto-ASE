-- Segmento A del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_segment is
	Port(
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0), (y,1), (z,2), (v,3)
		Xout : out std_logic
	);
end a_segment;

architecture dataflow of a_segment is

	component b_segment is
		Port(
			Xin : in std_logic_vector(3 downto 0);
			-- (x,0), (y,1), (z,2), (v,3)
			Xout : out std_logic
		);
	end component;

	component d_segment is
		Port(
			Xin : in std_logic_vector(3 downto 0);
			-- (x,3), (y,2), (z,1), (v,0)
			Xout : out std_logic
		);
	end component;

signal b_out, d_out: std_logic := '0';

begin
	inst_b: b_segment port map(
					Xin => Xin,
					Xout => b_out
				);
	inst_d: d_segment port map(
					Xin => Xin,
					Xout => d_out
				);

	Xout <= not( 
			(not(Xin(2)) and not(b_out) and not(d_out)) 
			or (Xin(2) and b_out) 
			or (Xin(2) and Xin(1))
			or (Xin(1) and not(Xin(0)))
		 );


end dataflow;

