----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:01:17 02/07/2018 
-- Design Name: 
-- Module Name:    gpio - Behavioral 
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

entity single_pad is
    Port ( Sin : in  STD_LOGIC;
			  Enable : in STD_LOGIC;	
           Sout : out  STD_LOGIC;
           PAD : inout  STD_LOGIC);
end single_pad;

architecture Dataflow of single_pad is

begin
	Sout <= PAD;
	
	with Enable select
				PAD <= Sin when '1', 'Z' when others;

end Dataflow;

