----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:38 01/31/2018 
-- Design Name: 
-- Module Name:    RS_Enabled - Structural 
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

entity RS_Enabled is
    Port ( R : in  STD_LOGIC;
           S : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Q1 : out  STD_LOGIC);
end RS_Enabled;

architecture Structural of RS_Enabled is
	COMPONENT RS_Latch
	PORT(
		R : IN std_logic;
		S : IN std_logic;          
		Q : OUT std_logic;
		Q1 : OUT std_logic
		);
	END COMPONENT;
	
signal r_in, s_in : std_logic;

begin

	rs: RS_Latch PORT MAP(
		R => r_in,
		S => s_in,
		Q => Q,
		Q1 => Q1
	);
	
	r_in <= En and R;
	s_in <= En and S;

end Structural;

