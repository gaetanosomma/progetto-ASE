----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:47 02/26/2018 
-- Design Name: 
-- Module Name:    Firma_digitale_on_board - Structural 
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

entity Firma_digitale_on_board is
    Port ( byte : in  STD_LOGIC_VECTOR (7 downto 0);
           b_3 : in  STD_LOGIC ;
           b_2 : in  STD_LOGIC ;
           b_1 : in  STD_LOGIC ;
           b_0 : in  STD_LOGIC ;
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
        --   messaggio_out : out  STD_LOGIC_VECTOR (31 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0);
			  Comparation : out std_logic;
           clock : in  STD_LOGIC);
end Firma_digitale_on_board;

architecture Structural of Firma_digitale_on_board is

	COMPONENT Display_administrator
	PORT(
		Counter : IN std_logic_vector(7 downto 0);
		Character_in : IN std_logic_vector(7 downto 0);
		Clock : IN std_logic;
		Hash1 : IN std_logic_vector(31 downto 0);
		Hash2 : IN std_logic_vector(31 downto 0);
		Sign : IN std_logic_vector(31 downto 0);
		Mode : IN std_logic_vector(2 downto 0);
		Change : IN std_logic;
		MSB_LSB : IN std_logic;          
		Cathodes : OUT std_logic_vector(7 downto 0);
		Anodes : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT cu_Firma_Digitale
	PORT(
		button_0 : IN std_logic;
		button_1 : IN std_logic;
		button_2 : IN std_logic;
		button_3 : IN std_logic;
		byte : IN std_logic_vector(7 downto 0);
		clock : IN std_logic;          
		messaggio : OUT std_logic_vector(31 downto 0);
		Hash1 : OUT std_logic_vector(31 downto 0);
		Hash2 : OUT std_logic_vector(31 downto 0);
		Comparation : out std_logic;
		Mode : OUT std_logic_vector(2 downto 0);
		reset_all : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Press_counter
	PORT(
		button : IN std_logic;
		reset : IN std_logic;
		clock : IN std_logic;          
		count : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	signal reset_all : std_logic := '0';
	signal button_0, button_1, button_2, button_3 : std_logic := '0';
	signal mode : std_logic_vector(2 downto 0);
	signal count : std_logic_vector(7 downto 0);
	signal messaggio, Hash1, Hash2: std_logic_vector(31 downto 0) := (others => '0');
	signal Messaggio_Start, Messaggio_Stop, Ins_M_Start, Ins_M_Stop, Ins_F_Start, Ins_F_Stop, Comparator_Start, Comparator_Stop : std_logic := '0';

begin

	button_0 <= b_0;
	button_1 <= b_1;  
	button_2 <= b_2;
	button_3 <= b_3;

	Inst_cu_Firma_Digitale: cu_Firma_Digitale PORT MAP(
		button_0 => button_0,
		button_1 => button_1,
		button_2 => button_2,
		button_3 => button_3,
		byte => byte,
		messaggio => messaggio,
		Hash1 => Hash1,
		Hash2 => Hash2,
		Comparation => Comparation,
		clock => clock,
		Mode => mode,
		reset_all => reset_all 
	);
	
	Inst_Press_counter: Press_counter PORT MAP(
		button => button_3,
		reset => button_2,
		clock => clock,
		count => count
	);
	
	Inst_Display_administrator: Display_administrator PORT MAP(
		Counter => count,
		Character_in => byte,
		Clock => clock,
		Hash1 => Hash1,
		Hash2 => Hash2,
		Sign => messaggio,
		Mode => mode,
		Change => button_2,
		MSB_LSB => button_1,
		Cathodes => cathodes,
		Anodes => anodes
	);
	
end Structural;

