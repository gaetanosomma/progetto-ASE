----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:48 02/02/2018 
-- Design Name: 
-- Module Name:    Riconoscitore_di__sequenza_on_board - structural 
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

entity Riconoscitore_di_sequenza_on_board is
    Port ( clock : in  STD_LOGIC;
			  start : in STD_LOGIC;
           x_in : in  STD_LOGIC_VECTOR (7 downto 0);
           x_out : out  STD_LOGIC;
			  x_out_1: out STD_LOGIC);
end Riconoscitore_di_sequenza_on_board;

architecture structural of Riconoscitore_di_sequenza_on_board is
	COMPONENT Riconoscitore_di_sequenza
	PORT(
		clock : IN std_logic;
		x_in : IN std_logic;
		start : IN std_logic;          
		x_out : OUT std_logic
		);
	END COMPONENT;
	
		COMPONENT scan_chain
	PORT(
		scan_en : IN std_logic;
		clock : IN std_logic;
		D_in : IN std_logic_vector(7 downto 0);
		scan_in : IN std_logic;          
		scan_out : OUT std_logic
		);
	END COMPONENT;

	COMPONENT mux2_1
	PORT(
		D_in : IN std_logic;
		scan_in : IN std_logic;
		scan_en : IN std_logic;          
		D : OUT std_logic
		);
	END COMPONENT;

	
SIGNAL bit_seq : STD_LOGIC := '0';
SIGNAL x_out_control: STD_LOGIC := '0';
SIGNAL enable: STD_LOGIC := '0';
begin
	
	x_out_1 <= x_out_control;
	
	Inst_Riconoscitore_di_sequenza: Riconoscitore_di_sequenza PORT MAP(
		clock =>clock ,
		x_in => bit_seq,
		x_out => x_out_control,
		start => start
	);
	
	Inst_scan_chain: scan_chain PORT MAP(
		scan_en => start,
		clock => clock,
		D_in => x_in,
		scan_out => bit_seq,
		scan_in => '1'
	);

	mux_for_x_out: mux2_1 PORT MAP(
		D_in => '0',
		scan_in => '1',
		scan_en => enable,
		D => x_out
	);
	control: process(x_out_control)
	begin
		if(x_out_control = '1' and x_out_control'event) then
			enable <= '1';
		end if;
	end process control;
		
end structural;

