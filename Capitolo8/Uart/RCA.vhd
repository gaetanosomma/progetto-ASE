----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:20 11/28/2017 
-- Design Name: 
-- Module Name:    RCA - Behavioral 
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

entity RCA is
	Generic ( N : integer := 4);
    Port ( X : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (N-1 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (N-1 downto 0));
end RCA;

architecture Structural of RCA is

	COMPONENT Full_Adder
	PORT(
		x : IN std_logic;
		y : IN std_logic;
		cin : IN std_logic;          
		s : OUT std_logic;
		cout : OUT std_logic
		);
	END COMPONENT;
	
signal carries : STD_LOGIC_VECTOR(N downto 0);

begin

carries(0) <= cin;

rca: for i in 0 to N-1 generate
	Inst_Full_Adder: Full_Adder PORT MAP(
		x => X(i),
		y => Y(i),
		cin => carries(i),
		s => S(i),
		cout => carries(i+1)
	);
end generate;

cout <= carries(N);


end Structural;

