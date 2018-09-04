----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:08 11/28/2017 
-- Design Name: 
-- Module Name:    Inverter - Dataflow 
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

entity Inverter is
	 Generic(N: integer := 32);
    Port ( value_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           value_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
           invert : in  STD_LOGIC);
end Inverter;

architecture Dataflow of Inverter is

begin

	with invert select
		value_out <= not value_in when '1',
						 value_in when others;

end Dataflow;

