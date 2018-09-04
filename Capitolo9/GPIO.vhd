----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:09:01 02/07/2018 
-- Design Name: 
-- Module Name:    GPIO - Behavioral 
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

entity GPIO is
	Generic ( N : integer := 8 );
    Port ( PADS : inout  STD_LOGIC_VECTOR(N-1 downto 0);
           Sin : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Sout : out  STD_LOGIC_VECTOR (N-1 downto 0);
           Enable : in  STD_LOGIC_VECTOR (N-1 downto 0));
end GPIO;

architecture Structural of GPIO is

	COMPONENT single_pad is
	   Port ( Sin : in  STD_LOGIC;
			  Enable : in STD_LOGIC;	
           Sout : out  STD_LOGIC;
           PAD : inout  STD_LOGIC);
	END COMPONENT;
	
begin

	gen_pads : for i in 0 to N-1 generate
		Inst_single_pad: single_pad port map(
			Sin => Sin(i),
			Enable => Enable(i),
			Sout => Sout(i),
			PAD => PADS(i)
		);
	end generate;
	
end Structural;

