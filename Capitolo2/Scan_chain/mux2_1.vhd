----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:10 02/01/2018 
-- Design Name: 
-- Module Name:    mux2_1 - dataflow 
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

entity mux2_1 is
    Port ( D_in : in  STD_LOGIC;
           scan_in : in  STD_LOGIC;
           scan_en : in  STD_LOGIC;
           D : out  STD_LOGIC);
end mux2_1;

architecture dataflow of mux2_1 is

begin

	D <= (scan_in and scan_en) or (D_in and (not scan_en));

end dataflow;

