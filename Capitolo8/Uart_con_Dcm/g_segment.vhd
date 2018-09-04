-- Segmento G del display a 7 segmenti
-- Creato dal gruppo 2 corso ASE 2017_2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity g_segment is
	Port(
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0), (y,1), (z,2), (v,3)
		Xout : out std_logic
	);
end g_segment;

architecture dataflow of g_segment is

	component c_segment is
		Port(
			Xin : in std_logic_vector(3 downto 0);
			-- (x,0), (y,1), (z,2), (v,3)
			Xout : out std_logic
		);
	end component;

	component d_segment is
		Port(
			Xin : in std_logic_vector(3 downto 0);
			-- (x,0), (y,1), (z,2), (v,3)
			Xout : out std_logic
		);
	end component;

	component e_segment is
		Port(
			Xin : in std_logic_vector(3 downto 0);
			-- (x,0), (y,1), (z,2), (v,3)
			Xout : out std_logic
		);
	end component;

	component f_segment is
		Port(
			Xin : in std_logic_vector(3 downto 0);
			-- (x,0), (y,1), (z,2), (v,3)
			Xout : out std_logic
		);
	end component;

signal c_out, d_out, e_out, f_out: std_logic := '0';

begin
	
	inst_c: c_segment port map(
					Xin => Xin,
					Xout => c_out
				);

	inst_d: d_segment port map(
					Xin => Xin,
					Xout => d_out
				);

	inst_e: e_segment port map(
					Xin => Xin,
					Xout => e_out
				);

	inst_f: f_segment port map(
					Xin => Xin,
					Xout => f_out
				);

	Xout <= not( 
			(e_out and not(f_out)) 
			or (Xin(1) and not(d_out)) 
			or (Xin(1) and c_out) 
			or (Xin(3) and not(c_out))
		);


end dataflow;

