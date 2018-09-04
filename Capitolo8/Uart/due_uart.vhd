----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:45 02/06/2011 
-- Design Name: 
-- Module Name:    due_uart - Behavioral 
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

entity uart_adder is
Port (stop : in  STD_LOGIC;
		clock : in  STD_LOGIC;
		byte_in: in	std_logic_vector (7 downto 0);
		TXD_0 : out std_logic;
		RXD_0 : in STD_LOGIC;
		byte_out: out	std_logic_vector (7 downto 0));
end uart_adder;

architecture Structural of uart_adder is
component RS232RefCompTX
   Port (  	TXD 	: out	std_logic	:= '1';
		 	RXD 	: in	std_logic;					
  		 	CLK 	: in	std_logic;							
			DBIN 	: in	std_logic_vector (7 downto 0);
			DBOUT 	: out	std_logic_vector (7 downto 0);
			RDA		: inout	std_logic;							
			TBE		: inout	std_logic 	:= '0';				
			RD		: in	std_logic;							
			WR		: in	std_logic;							
			PE		: out	std_logic;							
			FE		: out	std_logic;							
			OE		: out	std_logic;											
			RST		: in	std_logic	:= '0');				
end component;	
for all: RS232RefCompTX use entity WORK.RS232RefComp(Behavioral);

component RS232RefCompRX
   Port (  	TXD 	: out	std_logic	:= '1';
		 	RXD 	: in	std_logic;					
  		 	CLK 	: in	std_logic;							
			DBIN 	: in	std_logic_vector (7 downto 0);
			DBOUT 	: out	std_logic_vector (7 downto 0);
			RDA		: inout	std_logic:='1';							
			TBE		: inout	std_logic 	:= '1';				
			RD		: in	std_logic;							
			WR		: in	std_logic;							
			PE		: out	std_logic;							
			FE		: out	std_logic;							
			OE		: out	std_logic;											
			RST		: in	std_logic	:= '0');				
end component;	
for all: RS232RefCompRX use entity WORK.RS232RefComp(Behavioral);

signal DBOUT,DBOUT2,DBIN,DBIN2 	:std_logic_vector (7 downto 0);
signal rdaSig,tbeSig,PE,FE,OE,rdaSig2,tbeSig2,PE2,FE2,OE2,WR,WR2,RD,RD2,TXD2:	std_logic:= '0';

begin

WR <= not stop;

tx: RS232RefCompTX port map(TXD_0, '1', clock, byte_in, DBOUT, rdaSig, tbeSig, '1', '1', PE,FE,OE,'0');
rx: RS232RefCompRX port map(TXD2, RXD_0, clock, DBIN2, byte_out, rdaSig2, tbeSig2, '0', '0', PE2,FE2,OE2,'0');

end Structural;

