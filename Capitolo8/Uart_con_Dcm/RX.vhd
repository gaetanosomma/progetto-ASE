----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:22:02 02/06/2018 
-- Design Name: 
-- Module Name:    RX - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RX is
	PORT(
		reset : std_logic;
		clock : in std_logic;
		RXD : in std_logic;
		data_out : out std_logic_vector(7 downto 0);
		error : out std_logic
	);
end RX;

architecture Behavioral of RX is
	
	type r_state is (
		idle,
		wait_8,
		read_data,
		wait_16,
		read_stop
		);
		
		signal current_state, next_state : r_state := idle;	
		
		signal counter : std_logic_vector(3 downto 0) := "0000";
		signal counter_data : std_logic_vector(3 downto 0) := "0000";
		signal enable_counter : std_logic;
		signal enable_counter_data : std_logic;
		signal reset_counter : std_logic;
		signal reset_counter_data: std_logic;
		signal shift_register : std_logic_vector ( 9 downto 0);
		signal parity_error : std_logic := '0';
		signal shift : std_logic := '0';
begin
	--parity_error <= not ( shift_register(8) xor (((shift_register(0) xor shift_register(1)) xor (shift_register(2) xor shift_register(3))) xor ((shift_register(4) xor shift_register(5)) xor (shift_register(6) xor shift_register(7)))) );

		change_state : process(clock)
		begin
			if rising_edge(clock) then
				if reset = '1' then
					current_state <= idle;
				else
					current_state <= next_state;
				end if;
			end if;
		end process;

	
	counter_increment : process (clock, enable_counter, reset_counter)
		begin 
			if(clock'event and clock = '1') then
				if(reset_counter = '1') then 
					counter <= "0000" ;
				elsif (enable_counter = '1') then
					counter <= std_logic_vector(unsigned(counter) + 1);
				end if;
			end if;
		end process;	
		
	counter_data_increment : process (clock, enable_counter_data, reset_counter_data)
		begin 
			if(clock'event and clock = '1') then
				if( zreset_counter_data = '1') then 
					counter_data <= "0000" ;
				elsif (enable_counter_data = '1') then
					counter_data <= std_logic_vector(unsigned(counter_data) + 1);
				end if;
			end if;
		end process;
		
	shift_data : process (clock, shift)
	begin
		if rising_edge(clock) then
			if shift = '1' then
				shift_register <= (RXD & shift_register(9 downto 1));
			end if;
		end if;
	end process;
		
	calculate_state : process (clock, current_state, counter, counter_data, reset)
		begin
		
			shift <= '0';
			reset_counter <= '0';
			enable_counter <= '0';
			reset_counter_data <= '0';
			enable_counter_data <= '0';

			case current_state is
				when idle =>
						reset_counter <= '1';
						reset_counter_data <= '1';
					if reset = '1' or RXD = '1' then
						next_state <= idle;
					else 
						next_state <= wait_8;
					end if;
					
				when wait_8 =>
						enable_counter <= '1';
					if counter(2 downto 0) = "111" then
						next_state <= read_data;
					else
						next_state <= wait_8;
					end if;
					
				when read_data =>
					enable_counter_data <= '1';
					shift <= '1';
					if counter_data = "1010" then
						next_state <= read_stop ;
					else
						next_state <= wait_16;
					end if;
					
				when wait_16  =>
					enable_counter <= '1';
					if counter = "1111" then
						next_state <= read_data;
					else
						next_state <= wait_16;
					end if;
					
				when read_stop  =>
					if RXD /= '1' or parity_error = '1' then
						error <= '1';
					end if;			
					data_out <= shift_register(7 downto 0);
					next_state <= idle;
			
			end case;
		
		end process;
			
end Behavioral;

