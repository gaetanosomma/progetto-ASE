--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:49:02 02/02/2018
-- Design Name:   
-- Module Name:   /home/marco/Scrivania/Esercizi ASE/Progetti ISE/Scan_Chain/Scan_tb.vhd
-- Project Name:  Scan_Chain
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: scan_chain_on_board
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
 
ENTITY Scan_tb IS
Generic( N : integer := 8);
END Scan_tb;
 
ARCHITECTURE behavior OF Scan_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT scan_chain_on_board
    PORT(
         scan_en : IN  std_logic;
         clock : IN  std_logic;
         D_in : IN  std_logic_vector(7 downto 0);
         D_out : OUT  std_logic_vector(7 downto 0);
         D1_out : OUT  std_logic_vector(7 downto 0);
         scan_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal scan_en : std_logic := '0';
   signal clock : std_logic := '0';
   signal D_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal D_out : std_logic_vector(7 downto 0);
   signal D1_out : std_logic_vector(7 downto 0);
   signal scan_out : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: scan_chain_on_board 
	PORT MAP (
          scan_en => scan_en,
          clock => clock,
          D_in => D_in,
          D_out => D_out,
          D1_out => D1_out,
          scan_out => scan_out
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
	
	 -- insert stimulus here 
		D_in <= "11010001";
		wait for 10 ns;
		scan_en <= '1';
		wait for 10 ns;

      wait for clock_period*10;
		assert(D_out(N-1) = '1') report("Error D_out(N)");
		assert(D1_out(N-1) = '0') report("Error D_out(N)");
		if (D_out(N-1) /= '1' or D1_out(N-1) /= '0') then
				ErrCnt := ErrCnt + 1;
		end if;
		if (ErrCnt = 0) then report ( "0 Errors" );
				else report ("There are some errors");
		end if;
		
      wait;
   end process;

END;
