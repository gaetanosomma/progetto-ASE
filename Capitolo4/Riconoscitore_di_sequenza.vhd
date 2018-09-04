----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:48 02/01/2018 
-- Design Name: 
-- Module Name:    Riconoscitore_di_sequenza - Behavioral 
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

entity Riconoscitore_di_sequenza is
    Port ( clock : in  STD_LOGIC;
           x_in : in  STD_LOGIC;
           x_out : out  STD_LOGIC;
			  start : in STD_LOGIC);
end Riconoscitore_di_sequenza;

architecture Behavioral of Riconoscitore_di_sequenza is

	TYPE state_seq IS (S0, S1, S2, S3, S4, S5, S6);
	SIGNAL curr_state, next_state : state_seq;
	
begin
--	att: PROCESS(start)
--		begin
--			IF (start= '1') THEN start_s <= '1';
--			END IF;
--	END PROCESS att;
	
	clk: PROCESS(clock)
		begin
			IF( clock'event and clock='1' and start = '1') THEN
			curr_state <= next_state;
			END IF;
		END PROCESS clk;
		
	comb: PROCESS(curr_state,x_in)
		begin
			x_out <= '0';
			CASE curr_state IS
				WHEN S0 =>
					IF x_in = '1' THEN next_state <= S1;
					ELSE next_state <= S0;
					END IF;
				WHEN S1 => 
					IF x_in = '0' THEN next_state <= S2;
					ELSE next_state <= S1;
					END IF;
				WHEN S2 =>
					IF x_in = '0' THEN next_state <= S3;
					ELSE next_state <= S1;
					END IF;
				WHEN S3 =>
					IF x_in = '1' THEN next_state <= S4;
					ELSE next_state <= S0;	
					END IF;
				WHEN S4 =>
					IF x_in = '1' THEN next_state <= S5;
					ELSE next_state <= S2;	
					END IF;
				WHEN S5 =>
					IF x_in = '0' THEN next_state <= S6;
					ELSE next_state <= S1;	
					END IF;
				WHEN S6 =>
					x_out <='1';
					IF x_in = '1' THEN next_state <= S1;
					ELSE next_state <= S0;	
					END IF;		
			END CASE;
	END PROCESS comb;
	
END Behavioral;

