----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:26 02/06/2018 
-- Design Name: 
-- Module Name:    uart_adder_on_board - Behavioral 
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

entity uart_adder_on_board is
    Port ( clock : in STD_LOGIC;
			  byte : in  STD_LOGIC_VECTOR (7 downto 0);
           Cathodes : out  STD_LOGIC_VECTOR (7 downto 0);
           Anodes : out  STD_LOGIC_VECTOR (3 downto 0);
			  reset : in std_logic;
           TXD_0 : out  STD_LOGIC;
           RXD_0 : in  STD_LOGIC);
end uart_adder_on_board;

architecture Behavioral of uart_adder_on_board is
	
	COMPONENT uart_adder
	PORT(
		stop : IN std_logic;
		clock : IN std_logic;
		byte_in : IN std_logic_vector(7 downto 0);
		RXD_0 : IN std_logic;          
		TXD_0 : OUT std_logic;
		byte_out : OUT std_logic_vector(7 downto 0)
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
	
	COMPONENT RCA
	PORT(
		X : IN std_logic_vector(3 downto 0);
		Y : IN std_logic_vector(3 downto 0);
		cin : IN std_logic;          
		cout : OUT std_logic;
		S : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	signal byte_read : std_logic_vector(7 downto 0);
	signal sum: std_logic_vector(3 downto 0);
	signal value : std_logic_vector(15 downto 0);
	signal cout : std_logic;
begin
	
	value <= "00000000000" & cout & sum;
	Inst_uart_adder: uart_adder PORT MAP(
		stop => reset,
		clock => clock,
		byte_in => byte,
		TXD_0 => TXD_0,
		RXD_0 => RXD_0,
		byte_out => byte_read
	);
	
	Inst_RCA: RCA PORT MAP(
		X => byte_read(7 downto 4),
		Y => byte_read(3 downto 0),
		cin => '0',
		cout => cout,
		S => sum
	);
	
	Inst_display_7_segments: display_7_segments PORT MAP(
		value => value,
		enable => "0011",
		clock => clock,
		dots => "0000",
		reset => reset,
		cathodes => Cathodes,
		anodes => Anodes 
	);

end Behavioral;

