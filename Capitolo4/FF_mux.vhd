----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:54 02/01/2018 
-- Design Name: 
-- Module Name:    FF_mux - structural 
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

entity FF_mux is
    Port ( D_in : in  STD_LOGIC;
           scan_in : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           D_out : out  STD_LOGIC;
           scan_en : in  STD_LOGIC);
end FF_mux;

architecture structural of FF_mux is

signal dato : STD_LOGIC;

COMPONENT FF_D
	PORT(
		D : IN std_logic;
		Clock : IN std_logic;          
		Q : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT mux2_1
	PORT(
		D_in : IN std_logic;
		scan_in : IN std_logic;
		scan_en : IN std_logic;          
		D : OUT std_logic
		);
	END COMPONENT;

begin

	Inst_FF_D: FF_D PORT MAP(
		D => dato,
		Clock => clock,
		Q => D_out
	);


	Inst_mux2_1: mux2_1 PORT MAP(
		D_in => D_in,
		scan_in => scan_in,
		scan_en => scan_en,
		D => dato
	);

end structural;

