----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:56 02/02/2018 
-- Design Name: 
-- Module Name:    scan_chain_on_board - structural 
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

entity scan_chain_on_board is
	generic (N : integer := 8);
    Port ( scan_en : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           D_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           D_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           D1_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           scan_out : out  STD_LOGIC);
end scan_chain_on_board;

architecture structural of scan_chain_on_board is

COMPONENT scan_chain
generic (N : integer := 8);
	PORT(
		scan_en : IN std_logic;
		clock : IN std_logic;
		D_in : IN std_logic_vector(N-1 downto 0);
		scan_in : IN std_logic;          
		D_out : OUT std_logic_vector(N-1 downto 0);
		D1_out : OUT std_logic_vector(N-1 downto 0);
		scan_out : OUT std_logic
		);
	END COMPONENT;

		COMPONENT counter_mod_P
	generic (P : integer := 8);
	PORT(
		clock : IN std_logic;
		enable : IN std_logic;          
		counter_hit : OUT std_logic
		);
	END COMPONENT;

	COMPONENT shift_register
	Generic (N : integer);
	PORT(
		clock : IN std_logic;
		value_in : IN STD_LOGIC_VECTOR (N-1 downto 0);
		shift : IN std_logic;          
		value_out : OUT std_logic
		);
	END COMPONENT;

signal out_counter_mod_P : std_logic := '0';
signal clock_in : std_logic := '0';
signal register_out : std_logic := '0';

begin

clock_in <= clock and not out_counter_mod_P;

	Inst_scan_chain: scan_chain
	generic map (N => N)
	PORT MAP(
			scan_en => scan_en,
			clock => clock_in,
			D_in => "00000000",
			D_out => D_out,
			D1_out => D1_out,
			scan_out => scan_out,
			scan_in => register_out
		);

	Inst_counter_mod_P: counter_mod_P 
	generic map (P => N)
	PORT MAP(
		clock => clock,
		counter_hit => out_counter_mod_P ,
		enable => scan_en
	);
	
	Inst_shift_register: shift_register
		generic map (N => N)
		PORT MAP(
		clock => clock_in,
		value_in => D_in,
		shift => scan_en,
		value_out => register_out
	);

end structural;

