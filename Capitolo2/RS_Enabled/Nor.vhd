----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:43 01/30/2018 
-- Design Name: 
-- Module Name:    Nor - Behavioral 
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

entity Nor_gate is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end Nor_gate;

architecture Dataflow of Nor_gate is

begin
	Z <= X nor Y;
end Dataflow;

