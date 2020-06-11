----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 11:34:14 PM
-- Design Name: 
-- Module Name: TB_Program_ROM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Program_ROM is
--  Port ( );
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is
component P_ROM
         Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
                Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;
signal Address : STD_LOGIC_VECTOR (2 downto 0);
signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
begin
UUT: P_ROM       
         Port map ( Address => Address,
                    Instruction => Instruction);
process
begin
         --Index No:- 210206 => 110 011 010 100 011 110
         --Index No:- 210207 => 110 011 010 100 011 111 
         Address <= "110";
         wait for 200 ns;
         
         Address <= "111";
         wait for 200 ns;
         
         Address <= "100";
         wait for 200 ns;
         
         Address <= "010";
         wait for 200 ns;

         Address <= "011";
         wait for 200 ns;         
end process;
end Behavioral;
