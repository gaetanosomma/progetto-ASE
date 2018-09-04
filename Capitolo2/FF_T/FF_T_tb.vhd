--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:58 01/31/2018
-- Design Name:   
-- Module Name:   /home/gaetano/Scrivania/Progetti ISE/FF_T/FF_T_tb.vhd
-- Project Name:  FF_T
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FF_T
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
 
ENTITY FF_T_tb IS
END FF_T_tb;
 
ARCHITECTURE behavior OF FF_T_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FF_T
    PORT(
         T : IN  std_logic;
         Preset : IN  std_logic;
         Clear : IN  std_logic;
         Q : OUT  std_logic;
         Q1 : OUT  std_logic;
         Clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal Preset : std_logic := '0';
   signal Clear : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Q1 : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 60 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FF_T PORT MAP (
          T => T,
          Preset => Preset,
          Clear => Clear,
          Q => Q,
          Q1 => Q1,
          Clock => Clock
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
		variable ErrCnt : integer := 0;
		begin		
				wait for 100 ns;
				--TEST 1
				T <= '1';
				wait for 70 ns;
				assert (Q = '1') report( "Error Q");
				assert (Q1 = '0') report( "Error NOT(Q)");
				if (Q /= '1' or Q1 /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				T <= '0';
				wait for 30 ns;
				assert (Q = '1') report( "Error Q");
				assert (Q1 = '0') report( "Error NOT(Q)");
				if (Q /= '1' or Q1 /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				T <= '1';
				wait for 50 ns;
				assert (Q = '0') report( "Error Q");
				assert (Q1 = '1') report( "Error NOT(Q)");
				if (Q /= '0' or Q1 /= '1') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				T <= '0';
				wait for 60 ns;
				assert (Q = '0') report( "Error Q");
				assert (Q1 = '1') report( "Error NOT(Q)");
				if (Q /= '0' or Q1 /= '1') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				T <= '1';
				wait for 50 ns;
				assert (Q = '1') report( "Error Q");
				assert (Q1 = '0') report( "Error NOT(Q)");
				if (Q /= '1' or Q1 /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				T <= '0';
				
				if (ErrCnt = 0) then report ( "0 Errors" );
				else report ("There are some errors");
				end if;
				
				wait;
   end process;

END;
