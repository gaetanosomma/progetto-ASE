----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:10 02/01/2018 
-- Design Name: 
-- Module Name:    scan_chain - structural 
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

entity scan_chain is
	generic (N : integer := 8);
    Port ( scan_en : in  STD_LOGIC;
           clock : in  STD_LOGIC;
			  En : std_logic;
           D_in : in  STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
           D_out : out  STD_LOGIC_VECTOR (N-1 downto 0);
			  D1_out : out STD_LOGIC_VECTOR (N-1 downto 0);
			  scan_out: out STD_LOGIC;
           scan_in : in  STD_LOGIC);
end scan_chain;

architecture structural of scan_chain is
COMPONENT FF_mux
	PORT(
		D_in : IN std_logic;
		scan_in : IN std_logic;
		clock : IN std_logic;
		En : in std_logic;
		scan_en : IN std_logic;          
		D_out : OUT std_logic;
		D1_out : OUT std_logic
		);
	END COMPONENT;

signal signalD_out : std_logic_vector(N-1 downto 0);
signal scanin : std_logic_vector(N downto 0);
begin

scanin(0) <= scan_in;
scan_out <= scanin(N);

chain : for i in 0 to N-1 generate

	Inst_FF_mux: FF_mux 
	PORT MAP(
		D_in => D_in(i) ,
		scan_in => scanin(i),
		clock => clock,
		En => En,
		D_out => signalD_out(i),
		D1_out => D1_out(i),
		scan_en => scan_en
	);
	
	scanin(i+1) <= signalD_out(i);
	D_out(i) <= signalD_out(i);
	
	end generate;
end structural;

