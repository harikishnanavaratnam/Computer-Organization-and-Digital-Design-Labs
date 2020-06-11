----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 09:39:20 AM
-- Design Name: 
-- Module Name: TB_Mux_8_4 - Behavioral
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

entity TB_Mux_8_4 is
--  Port ( );
end TB_Mux_8_4;

architecture Behavioral of TB_Mux_8_4 is
component Mux_8_Way_4_Bit
        Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
               R1 : in STD_LOGIC_VECTOR (3 downto 0);
               R2 : in STD_LOGIC_VECTOR (3 downto 0);
               R3 : in STD_LOGIC_VECTOR (3 downto 0);
               R4 : in STD_LOGIC_VECTOR (3 downto 0);
               R5 : in STD_LOGIC_VECTOR (3 downto 0);
               R6 : in STD_LOGIC_VECTOR (3 downto 0);
               R7 : in STD_LOGIC_VECTOR (3 downto 0);
               Sel_R : in STD_LOGIC_VECTOR (2 downto 0);
               Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal R0,R1,R2,R3,R4,R5,R6,R7,Q : STD_LOGIC_VECTOR (3 downto 0);
signal  Selector : STD_LOGIC_VECTOR (2 downto 0);
begin 
UUT: Mux_8_Way_4_Bit
  Port map(
      R0 => R0,
      R1 => R1,
      R2 => R2,
      R3 => R3,
      R4 => R4,
      R5 => R5,
      R6 => R6,
      R7 => R7,
      Sel_R => Selector,
      Q => Q
      );
process
begin
     --Index No:- 210206 => 11 0011 0101 0001 1110
     --Index No:- 210207 => 1100 1101 0100 0111 11
     R0 <= "0001";
     R1 <= "1110";
     R2 <= "0111";
     R3 <= "0101";
     R4 <= "0011";
     R5 <= "1100";
     R6 <= "1101";
     R7 <= "0100";
     
     --Index No:- 210206 => 110 011 010 100 011 110
     --Index No:- 210207 => 110 011 010 100 011 111
     Selector <= "110";
     wait for 200 ns;
     
     Selector <= "011";
     wait for 200 ns;
     
     Selector <= "010";
     wait for 200 ns;
          
     Selector <= "100";
     wait for 200 ns;
          
     Selector <= "111";
     wait for 200 ns;
          
end process;   
end Behavioral;
