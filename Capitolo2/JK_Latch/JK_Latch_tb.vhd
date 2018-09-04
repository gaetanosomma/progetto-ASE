--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:14:37 01/31/2018
-- Design Name:   
-- Module Name:   /home/gaetano/Scrivania/Progetti ISE/JK_Latch/JK_Latch_tb.vhd
-- Project Name:  JK_Latch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: JK_Latch
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
 
ENTITY JK_Latch_tb IS
END JK_Latch_tb;
 
ARCHITECTURE behavior OF JK_Latch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT JK_Latch
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         Q : OUT  std_logic;
         Q1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Q1 : std_logic;
   
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JK_Latch PORT MAP (
          J => J,
          K => K,
          Q => Q,
          Q1 => Q1
        );


   -- Stimulus process
   stim_proc: process
   
	variable ErrCnt : integer := 0;	
			begin
			
			wait for 100 ns;
			
			
			--TEST 1
			J <= '1';
			K <= '0';
			
			wait for 10 ns;
			
			assert (Q = '1') report( "Error Q");
			assert (Q1 = '0') report( "Error NOT(Q)");
			if (Q /= '1' or Q1 /= '0') then
					ErrCnt := ErrCnt + 1;
			end if; 
			
			--TEST 2
			J <= '0';
			K <= '1';
			
			wait for 10 ns;
			
			assert (Q = '0') report ("Error Q");
			assert (Q1 = '1') report ("Error NOT(Q)");
			if (Q /= '0' or Q1 /= '1') then
					ErrCnt := ErrCnt + 1;
			end if; 
			
			--TEST 4
			J <= '1';
			K <= '0';
			
			wait for 10 ns;
			
			assert (Q = '1') report ("Error Q");
			assert (Q1 = '0') report ("Error NOT(Q)");
			if (Q /= '1' or Q1 /= '0') then
					ErrCnt := ErrCnt + 1;
			end if; 
			
			
			--TEST 5
			K <= '1';
			
			wait for 10 ns;
			
			assert (Q = '0') report ("Error Q");
			assert (Q1 = '1') report ("Error NOT(Q)");
			if (Q /= '0' or Q1 /= '1') then
					ErrCnt := ErrCnt + 1;
			end if; 
			
			
			--TEST 6
			J <= '0';
			K <= '0';
			
			wait for 10 ns;
			
			assert (Q = '0') report ("Error Q");
			assert (Q1 = '1') report ("Error NOT(Q)");
			if (Q /= '0' or Q1 /= '1') then
					ErrCnt := ErrCnt + 1;
			end if; 
			
			wait for 10 ns;
			
			
			if (ErrCnt = 0) then report ( "0 Errors" );
			else report ("There are some errors");
			end if;
			
			wait;
   end process;

END;
