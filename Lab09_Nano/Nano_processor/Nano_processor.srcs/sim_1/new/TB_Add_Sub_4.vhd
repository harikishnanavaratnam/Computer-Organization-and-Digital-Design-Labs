----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:41:59 AM
-- Design Name: 
-- Module Name: TB_Add_Sub_4 - Behavioral
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

entity TB_Add_Sub_4 is
--  Port ( );
end TB_Add_Sub_4;

architecture Behavioral of TB_Add_Sub_4 is
component Add_Sub_4 
    Port ( A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
       B : in STD_LOGIC_VECTOR (3 DOWNTO 0);
       Ctrl: in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 DOWNTO 0);
       C_out : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;
SIGNAL A, B, S  : std_logic_vector (3 downto 0);
SIGNAL Ctrl,C_out: std_logic;
begin
UUT: Add_Sub_4 PORT MAP(
 A => A,
 B => B,
 Ctrl => Ctrl,
 S => S,
 C_out => C_out
 );

process
begin
--Index No:- 210206 => 11 0011 0101 0001 1110
--Index No:- 210207 => 11 0011 0101 0001 1111
  A <= "1110";
  B <= "1111";
  Ctrl <= '0';
 
 WAIT FOR 100 ns;
  B <= "0001";
 
 WAIT FOR 100 ns;
  Ctrl <= '1';
  B <= "0101"; 
 
 
 WAIT FOR 100 ns;
 A <= "0101";
 B <= "0001";
 
 WAIT FOR 100 ns;
 Ctrl <= '1';
 A <= "0011";
 B <= "0101";
 
 
 WAIT FOR 100 ns;
 Ctrl <= '0';
 A <= "0011";
 B <= "0101";
 

 
end process;
end Behavioral;
