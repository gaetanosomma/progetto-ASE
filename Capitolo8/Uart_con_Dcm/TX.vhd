----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:21:52 02/06/2018 
-- Design Name: 
-- Module Name:    TX - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TX is
	PORT(
		reset : std_logic;
		t_enable : in std_logic;
		clock : in std_logic;
		TXD : out std_logic := '1';
		data_in: in std_logic_vector(7 downto 0)
		);
end TX;

architecture Behavioral of TX is
	type t_state is (
		idle,
		start,
		send_bit,
		send_stop
	);
		
	signal current_state, next_state : t_state := idle;	
	signal shift_register : std_logic_vector ( 10 downto 0) := (others => '1');
	signal counter : std_logic_vector(3 downto 0) := "0000";
	signal parity_bit, enable_counter : std_logic;
	signal shift : std_logic := '0';
	signal load_data : std_logic := '0';
begin

	parity_bit <=  not ( ((data_in(0) xor data_in(1)) xor (data_in(2) xor data_in(3))) xor ((data_in(4) xor data_in(5)) xor (data_in(6) xor data_in(7))) );
	--	parity_bit <= '1';
			--with current_state select
		--		stato <= "00" when idle, "01" when start, "10" when send_bit, "11" when send_stop;
	--		counter_ctrl <= counter;
	change_state : process (clock)
		begin
			if rising_edge(clock) then
					current_state <= next_state;
				else
					current_state <= current_state;
			end if;
		end process;

	counter_increment : process (clock, enable_counter, reset)
		begin 
			if(clock'event and clock = '1') then
				if( reset = '1' or enable_counter = '0') then 
					counter <= "0000" ;
				else
					counter <= std_logic_vector(unsigned(counter) + 1);
				end if;
			end if;
		end process;
		
	calculate_state : process (reset, current_state, t_enable, counter, clock, data_in)
		begin
						
					shift <= '0';
					load_data <= '0';
						
			case current_state is

				when idle =>
					if reset = '1' or t_enable = '0' then
						next_state <= idle;
					else 
						next_state <= start;
					end if;
					
				when start =>
					load_data <= '1';
					next_state <= send_bit;
					
				when send_bit =>
					shift <= '1';
					enable_counter <= '1';
					if counter = "1101" then
						next_state <= send_stop;
					else 
						next_state <= send_bit;
					end if;
				
				when send_stop =>
					enable_counter <= '0';
					next_state <= idle;
			
			end case;
		
		end process;
					
					
					
				
	shift_data : process (clock, shift, load_data, shift_register)
		begin
			TXD <= shift_register(0);
			if rising_edge(clock) then
				if shift = '1' then
					shift_register <= '1' & shift_register(10 downto 1);
				end if;
				if load_data = '1' then
					shift_register <= '1' & parity_bit & data_in & '0';
				end if;
			end if;
		end process;

end Behavioral;

