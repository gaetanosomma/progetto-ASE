library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cathodes_manager is
    Port (			
	Xin: in std_logic_vector(4 downto 0);
	-- (x,0) , (y,1) , (z,2) , (v,3)	
	Cathodes: out std_logic_vector(7 downto 0)	
   );
end cathodes_manager;

architecture structural of cathodes_manager is

	component a_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
  	 );
	end component;

	component b_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
  	 );
	end component;

	component c_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
  	 );
	end component;

		component d_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
  	 );
	end component;
	
	component e_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
  	 );
	end component;

	component f_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
  	 );
	end component;

	component g_segment is
    	Port( 
		Xin : in std_logic_vector(3 downto 0);
		-- (x,0) , (y,1) , (z,2) , (v,3)	
		Xout : out  std_logic
  	 );
	end component;

begin


	inst_a: a_segment port map(
					   Xin => Xin(3 downto 0),
					   Xout => Cathodes(0)
					   );
	inst_b: b_segment port map(
					   Xin => Xin(3 downto 0),
					   Xout => Cathodes(1)
					   );
	inst_c: c_segment port map(
					   Xin => Xin(3 downto 0),
					   Xout => Cathodes(2)
					   );
	inst_d: d_segment port map(
					   Xin => Xin(3 downto 0),
					   Xout => Cathodes(3)
					   );
	inst_e: e_segment port map(
					   Xin => Xin(3 downto 0),
					   Xout => Cathodes(4)
					   );
	inst_f: f_segment port map(
					   Xin => Xin(3 downto 0),
					   Xout => Cathodes(5)
					   );
	inst_g: g_segment port map(
					   Xin => Xin(3 downto 0),
					   Xout => Cathodes(6)
					   );
						
	Cathodes(7) <= not(Xin(4));

end structural;

