----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:22:15 11/03/2015 
-- Design Name: 
-- Module Name:    IF_ID - Behavioral 
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

entity IF_ID is
generic	(	
				address_width : integer := 32;
				instruction_width : integer := 32
			);
	
	port(
			pc_in 				: in std_logic_vector(address_width - 1 downto 0) := (others => '0');
			pc_out 				: out std_logic_vector(address_width - 1 downto 0) := (others => '0');
			instruction_in		: in std_logic_vector(instruction_width - 1 downto 0) := (others => '0');
			instruction_out	: out std_logic_vector(instruction_width - 1 downto 0) := (others => '0');
			clk					: in std_logic := '0';
			rst 					: in std_logic := '0';
			flush					: in std_logic := '0';
			reg_en				: in std_logic := '0'
		);
end IF_ID;

architecture Behavioral of IF_ID is

begin
if_id : process(clk)
	begin
		if rising_edge(clk) then
			if reg_en = '1' then
				pc_out <= pc_in;
				instruction_out <= instruction_in;
			end if;
			
			if rst = '1' or flush = '1' then
				pc_out <= (others => '0');
				instruction_out <= (others => '0');
			end if;
		end if;
	end process if_id;
end Behavioral;

