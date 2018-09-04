----------------------------------------------------------------------------------
-- Company: ASE1718_02
-- Engineer: 
-- 
-- Create Date:    16:19:01 01/30/2018 
-- Design Name: 
-- Module Name:    RS_Latch - Behavioral 
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

entity RS_Latch is
    Port ( R : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC;
			  Q1:  out  STD_LOGIC);
end RS_Latch;

architecture Structural of RS_Latch is
	COMPONENT Nor_gate
	PORT(
		X : IN std_logic;
		Y : IN std_logic;          
		Z : OUT std_logic
		);
	END COMPONENT;

signal q_in, q_in1 : std_logic;
begin

	Nor_gate_R: Nor_gate PORT MAP(
		X => R,
		Y => q_in1,
		Z => q_in
	);
	
	Nor_gate_S: Nor_gate PORT MAP(
		X => q_in,
		Y => S,
		Z => q_in1
	);
	
	Q <= q_in;
	Q1 <= q_in1;
	
end Structural;

