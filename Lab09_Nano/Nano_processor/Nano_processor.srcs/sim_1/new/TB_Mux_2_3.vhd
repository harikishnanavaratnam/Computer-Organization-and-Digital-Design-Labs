----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 08:51:10 AM
-- Design Name: 
-- Module Name: TB_Mux_2_3 - Behavioral
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

entity TB_Mux_2_3 is
--  Port ( );
end TB_Mux_2_3;

architecture Behavioral of TB_Mux_2_3 is
component Mux_2_Way_3_Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       JF : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal A,B,Q : STD_LOGIC_VECTOR (2 downto 0);
signal Jump : STD_LOGIC;
begin
UUT: Mux_2_Way_3_Bit
    port map (
       A => A,
       B => B,
       JF => Jump,
       Q => Q );
process
begin 
    --Index No:- 210206 => 110 011 010 100 011 110
    --Index No:- 210207 => 110 011 010 100 011 111
    A <= "110";
    B <= "111";
    Jump <= '1';
    
    wait for 250 ns;
    A <= "011";
    B <= "100";
    Jump <= '0';
    
    wait for 250 ns;
    A <= "010";
    B <= "011";
    Jump <= '1';
    
    wait for 250 ns;
    A <= "100";
    B <= "110";
    Jump <= '0';
    
    wait;
    
end process;
end Behavioral;
