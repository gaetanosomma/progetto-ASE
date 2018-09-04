----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:41 11/15/2017 
-- Design Name: 
-- Module Name:    display_7_segments - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_7_segments is
generic(
				frequency_in : integer := 50000000;
				frequency_out : integer := 5000000
				);
    Port ( value : in  STD_LOGIC_VECTOR (15 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           clock : in  STD_LOGIC;
           dots : in  STD_LOGIC_VECTOR (3 downto 0);
			  reset: in STD_LOGIC;
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
end display_7_segments;

architecture structural of display_7_segments is

	COMPONENT anodes_manager
	PORT(
		EN : IN std_logic_vector(3 downto 0);
		SEL : IN std_logic_vector(1 downto 0);          
		Xout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT bit_selector
	PORT(
		SEL : IN std_logic_vector(1 downto 0);
		Xin : IN std_logic_vector(15 downto 0);
		dots : IN std_logic_vector(3 downto 0);
		Xout : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	
	COMPONENT cathodes_manager
	PORT(
		Xin : IN std_logic_vector(4 downto 0);          
		Cathodes : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT counter_mod4
	PORT(
		en : IN std_logic;
		reset_n : IN std_logic;
		clk : IN std_logic;          
		q : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT clock_filter
	generic(
				frequency_in : integer := 50000000;
				frequency_out : integer := 5000000
				);
	PORT(
		clock_in : IN std_logic;
		reset_n : IN std_logic;          
		clock_out : OUT std_logic
		);
	END COMPONENT;

signal SEL: std_logic_vector(1 downto 0);
signal bits_selected: std_logic_vector(4 downto 0);
signal clock_f: std_logic;

begin 

	Inst_clock_filter: clock_filter 
		GENERIC MAP(
			frequency_in => frequency_in,
			frequency_out => 400
		)
		
		PORT MAP(
		clock_in => clock,
		reset_n => not reset,
		clock_out => clock_f
	);

	Inst_anodes_manager: anodes_manager PORT MAP(
		EN => enable,
		SEL => SEL,
		Xout => anodes
	);
	
		Inst_bit_selector: bit_selector PORT MAP(
		SEL => SEL,
		Xin => value,
		Xout => bits_selected,
		dots => dots
	);
	
		Inst_cathodes_manager: cathodes_manager PORT MAP(
		Xin => bits_selected,
		Cathodes => cathodes
	);
	
		Inst_counter_mod4: counter_mod4 PORT MAP(
		en => clock_f,
		reset_n => not reset,
		clk => clock ,
		q => SEL
	);

end structural;

