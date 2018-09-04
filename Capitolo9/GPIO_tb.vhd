--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:28:15 02/07/2018
-- Design Name:   
-- Module Name:   /home/gaetano/Scrivania/Progetti ISE/GPIO/GPIO_tb.vhd
-- Project Name:  GPIO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GPIO
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY GPIO_tb IS
END GPIO_tb;
 
ARCHITECTURE behavior OF GPIO_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GPIO
    PORT(
         PADS : INOUT  std_logic_vector(7 downto 0);
         Sin : IN  std_logic_vector(7 downto 0);
         Sout : OUT  std_logic_vector(7 downto 0);
         Enable : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sin : std_logic_vector(7 downto 0) := (others => '0');
   signal Enable : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal PADS : std_logic_vector(7 downto 0);

 	--Outputs
   signal Sout : std_logic_vector(7 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GPIO PORT MAP (
          PADS => PADS,
          Sin => Sin,
          Sout => Sout,
          Enable => Enable
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		wait for 100 ns;
		Enable <= "11111111";
		wait for 100 ns;	
		Sin <= "01010101";
		wait for 100 ns;
		Enable <= "00000000";
		

      -- insert stimulus here 

      wait;
   end process;

END;
