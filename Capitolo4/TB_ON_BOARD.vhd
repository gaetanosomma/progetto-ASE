--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:51:54 02/03/2018
-- Design Name:   
-- Module Name:   /home/amanda/Scrivania/elaborato_gruppo2/capitolo07/implementazione/FSM/TB_ON_BOARD.vhd
-- Project Name:  FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Riconoscitore_di_sequenza_on_board
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
 
ENTITY TB_ON_BOARD IS
END TB_ON_BOARD;
 
ARCHITECTURE behavior OF TB_ON_BOARD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Riconoscitore_di_sequenza_on_board
    PORT(
         clock : IN  std_logic;
         start : IN  std_logic;
         x_in : IN  std_logic_vector(7 downto 0);
         x_out : OUT  std_logic;
         x_out_1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal start : std_logic := '0';
   signal x_in : std_logic_vector(7 downto 0) := "00100110";

 	--Outputs
   signal x_out : std_logic;
   signal x_out_1 : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Riconoscitore_di_sequenza_on_board PORT MAP (
          clock => clock,
          start => start,
          x_in => x_in,
          x_out => x_out,
          x_out_1 => x_out_1
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 300 ns;
		start <= '1';

      wait;
   end process;

END;
