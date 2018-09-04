----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:06 02/06/2018 
-- Design Name: 
-- Module Name:    our_uart_adder - Behavioral 
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

entity our_uart_adder is
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
end our_uart_adder;

architecture Behavioral of our_uart_adder is

	COMPONENT RX is
	PORT(
			reset : std_logic;
			clock : in std_logic;
			RXD : in std_logic;
			data_out : out std_logic_vector(7 downto 0);
			error : out std_logic
		);
	END COMPONENT;
	
	COMPONENT TX is
	PORT(
			reset : std_logic;
			t_enable : in std_logic;
			clock : in std_logic;
			TXD : out std_logic := '1';
			data_in: in std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
begin
	rx_comp : RX port map(
		reset => stop,
		clock => clock_r,
		RXD => RXD_0,
		data_out => byte_out,
		error => error
		);

	tx_comp : TX port map(
			reset => stop,
			t_enable => start,
			clock => clock_t,
			TXD => TXD_0,
			data_in => byte_in
		);

end Behavioral;

