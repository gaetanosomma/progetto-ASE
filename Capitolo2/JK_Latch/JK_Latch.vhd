----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:40 01/31/2018 
-- Design Name: 
-- Module Name:    JK_Latch - Behavioral 
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

entity JK_Latch is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Q1 : out  STD_LOGIC);
end JK_Latch;

architecture Behavioral of JK_Latch is

signal state : std_logic;

begin

	process(J , K)
	begin
		if(J = '1') then
			if(K = '0') then
				state <= '1';
			else
				state <= not state;
			end if;
		else if(K = '1') then
					state <= '0';
				end if;
		end if;
		end process;
	Q <= state;
	Q1 <= not state;
end Behavioral;

