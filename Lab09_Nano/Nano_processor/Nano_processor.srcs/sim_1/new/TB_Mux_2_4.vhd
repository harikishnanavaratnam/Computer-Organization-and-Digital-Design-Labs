----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 09:10:42 AM
-- Design Name: 
-- Module Name: TB_Mux_2_4 - Behavioral
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

entity TB_Mux_2_4 is
--  Port ( );
end TB_Mux_2_4;

architecture Behavioral of TB_Mux_2_4 is
component Mux_2_Way_4_Bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       JF : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal A,B,Q : STD_LOGIC_VECTOR (3 downto 0);
signal Jump : STD_LOGIC;
begin
UUT: Mux_2_Way_4_Bit
    port map (
       A => A,
       B => B,
       JF => Jump,
       Q => Q );
process
begin
     --Index No:- 210206 => 11 0011 0101 0001 1110
     --Index No:- 210207 => 11 0011 0101 0001 1111
     A <= "1110";
     B <= "1111";
     Jump <= '1';
     
     wait for 250 ns;
     A <= "0001";
     B <= "0101";
     Jump <= '0';
     
     wait for 250 ns;
     A <= "0011";
     B <= "1110";
     Jump <= '1';
     
     wait for 250 ns;
     A <= "0101";
     B <= "0001";
     Jump <= '0';  
     
     wait;  
end process;
end Behavioral;
