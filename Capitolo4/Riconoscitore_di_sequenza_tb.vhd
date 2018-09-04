--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:01:14 02/01/2018
-- Design Name:   
-- Module Name:   /home/amanda/Scrivania/elaborato_gruppo2/capitolo07/implementazione/FSM/Riconoscitore_di_sequenza_tb.vhd
-- Project Name:  FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Riconoscitore_di_sequenza
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
 
ENTITY Riconoscitore_di_sequenza_tb IS
END Riconoscitore_di_sequenza_tb;
 
ARCHITECTURE behavior OF Riconoscitore_di_sequenza_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Riconoscitore_di_sequenza
    PORT(
         clock : IN  std_logic;
         x_in : IN  std_logic;
         x_out : OUT  std_logic;
			 start : in STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal x_in : std_logic := '0';

 	--Outputs
   signal x_out : std_logic;

   -- Clock period definitions
   constant clock_period : time := 70 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Riconoscitore_di_sequenza PORT MAP (
          clock => clock,
          x_in => x_in,
          x_out => x_out
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
		variable ErrCnt : integer := 0;
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
				--TEST 1
				x_in <= '1';
				wait for 70 ns;
				assert (x_out = '0') report( "Error x_out1");
				if (x_out /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				x_in <= '0';
				wait for 70 ns;
				assert (x_out = '0') report( "Error x_out2");
				if (x_out /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				x_in <= '0';
				wait for 70 ns;
				assert (x_out = '0') report( "Error x_out3");
				if (x_out /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				x_in <= '1';
				wait for 70 ns;
				assert (x_out = '0') report( "Error x_out4");
				if (x_out /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				
				x_in <= '1';
				wait for 70 ns;
				assert (x_out = '0') report( "Error x_out5");
				if (x_out /= '0') then
						ErrCnt := ErrCnt + 1;
				end if;
				x_in <= '0';
				wait for 70 ns;
				assert (x_out = '1') report( "Error x_out5");
				if (x_out /= '1') then
						ErrCnt := ErrCnt + 1;
				end if;

				if (ErrCnt = 0) then report ( "0 Errors" );
				else report ("There are some errors");
				end if;
				
      wait;
   end process;

END;
