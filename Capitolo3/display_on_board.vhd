----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:58:23 11/20/2017 
-- Design Name: 
-- Module Name:    display_on_board - Behavioral 
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

entity display_on_board is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load_lsb : in  STD_LOGIC;
           load_msb : in  STD_LOGIC;
           load_dots_en : in  STD_LOGIC;
           byte : in  STD_LOGIC_VECTOR (7 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end display_on_board;

architecture Structural of display_on_board is

COMPONENT c_unit
	PORT(
		clock : IN std_logic;
		reset_n : IN std_logic;
		load_lsb : IN std_logic;
		load_msb : IN std_logic;
		load_dots_en : IN std_logic;
		byte : IN std_logic_vector(7 downto 0);          
		value : OUT std_logic_vector(15 downto 0);
		dots : OUT std_logic_vector(3 downto 0);
		enable : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT display_7_segments
	PORT(
		value : IN std_logic_vector(15 downto 0);
		enable : IN std_logic_vector(3 downto 0);
		clock : IN std_logic;
		dots : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;          
		cathodes : OUT std_logic_vector(7 downto 0);
		anodes : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

signal value : std_logic_vector(15 downto 0);
signal dots : std_logic_vector(3 downto 0);
signal enable : std_logic_vector(3 downto 0);


begin

	Inst_c_unit: c_unit PORT MAP(
		clock => clock,
		reset_n => not reset,
		load_lsb => load_lsb,
		load_msb => load_msb,
		load_dots_en => load_dots_en,
		byte => byte,
		value => value,
		dots => dots,
		enable => enable
	);
	
	Inst_display_7_segments: display_7_segments PORT MAP(
		value => value,
		enable => enable,
		clock => clock,
		dots => dots,
		reset => reset,
		cathodes => cathodes,
		anodes => anodes
	);


end Structural;

