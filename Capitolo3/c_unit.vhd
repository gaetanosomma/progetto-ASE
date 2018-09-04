----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:59:27 10/23/2012 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

entity c_unit is
    Port ( 
			  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load_lsb : in  STD_LOGIC;
           load_msb : in  STD_LOGIC;
           load_dots_en : in  STD_LOGIC;
			  byte : in STD_LOGIC_VECTOR(7 downto 0);
           value : out  STD_LOGIC_VECTOR(15 downto 0);
           dots : out  STD_LOGIC_VECTOR(3 downto 0);
           enable : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end c_unit;

architecture Behavioral of c_unit is

signal reg_value : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal reg_dots, reg_enable : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal reset : std_logic;

begin

reset <= not reset_n;

value <= reg_value;
dots <= reg_dots;
enable <= reg_enable;

process(clock, reset, load_lsb, load_msb, load_dots_en)
begin

	if reset = '1' then
		reg_value <= (others => '0');
		reg_dots <= (others => '0');
		reg_enable <= (others => '0');
	elsif clock'event and clock = '1' then
		if load_lsb = '1' then
			reg_value(7 downto 0) <= byte;
		elsif load_msb = '1' then
			reg_value(15 downto 8) <= byte;
		elsif load_dots_en = '1' then
			reg_dots <= byte(7 downto 4);
			reg_enable <= byte(3 downto 0);
		end if;
	end if;

end process;


end Behavioral;

