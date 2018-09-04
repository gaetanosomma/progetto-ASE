----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:05 01/31/2018 
-- Design Name: 
-- Module Name:    T_Latch - Behavioral 
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

entity FF_T is
    Port ( T : in  STD_LOGIC;
           Preset : in  STD_LOGIC;
			  Clear : in  STD_LOGIC;
			  Q : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
			  Clock : in STD_LOGIC);
end FF_T;

architecture Structural of FF_T is

	COMPONENT FF_JK
	PORT(
		J : IN std_logic;
		K : IN std_logic;
		Preset : IN std_logic;
		Clear : IN std_logic;
		Clock : IN std_logic;          
		Q : OUT std_logic;
		Q1 : OUT std_logic
		);
	END COMPONENT;

begin

	jk: FF_JK PORT MAP(
		J => T,
		K => T,
		Preset => Preset,
		Clear => Clear,
		Clock => Clock,
		Q => Q,
		Q1 => Q1
	);

end Structural;

