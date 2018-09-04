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
				start : in std_logic;
			  byte : in  STD_LOGIC_VECTOR (7 downto 0);
           Cathodes : out  STD_LOGIC_VECTOR (7 downto 0);
           Anodes : out  STD_LOGIC_VECTOR (3 downto 0);
			  reset : in std_logic;
           TXD_0 : out  STD_LOGIC := '1';
           RXD_0 : in  STD_LOGIC;
			  error : out std_logic);
end uart_adder_on_board;

architecture Behavioral of uart_adder_on_board is
	
	COMPONENT our_uart_adder
		Port (
				start : in std_logic;
				stop : in  STD_LOGIC;
				clock_t : in  STD_LOGIC;
				clock_r : in  STD_LOGIC;
				byte_in: in	std_logic_vector (7 downto 0);
				TXD_0 : out std_logic := '1';
				RXD_0 : in STD_LOGIC;
				byte_out: out	std_logic_vector (7 downto 0);
				error : out std_logic);
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
	
	COMPONENT my_clock_generator
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKDV_OUT : OUT std_logic;
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;
	
	signal byte_read : std_logic_vector(7 downto 0);
	signal sum: std_logic_vector(3 downto 0);
	signal value : std_logic_vector(15 downto 0);
	signal cout : std_logic;
	signal lock, clock_mul, clock_div: std_logic;
	signal reset_in : std_logic;

begin
	  
	reset_in <= reset;
	
	value <= "00000000000" & cout & sum;
	Inst_uart_adder: our_uart_adder PORT MAP(
		start => start,
		stop => '0',
		clock_t => clock_div,
		clock_r => clock_mul,
		byte_in => byte,
		TXD_0 => TXD_0,
		RXD_0 => RXD_0,
		byte_out => byte_read,
		error => error
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
		clock => clock_mul,
		dots => "0000",
		reset => reset,
		cathodes => Cathodes,
		anodes => Anodes 
	);
	
	Inst_my_clock_generator: my_clock_generator PORT MAP(
		CLKIN_IN => clock,
		RST_IN => reset,
		CLKDV_OUT => clock_div,
		CLKFX_OUT => clock_mul,
		CLKIN_IBUFG_OUT => open,
		CLK0_OUT => open,
		LOCKED_OUT => open
	);


end Behavioral;

