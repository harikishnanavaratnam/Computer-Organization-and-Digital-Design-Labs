----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 01:38:51 AM
-- Design Name: 
-- Module Name: TB_7_Seg - Behavioral
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

entity TB_7_Seg is
--  Port ( );
end TB_7_Seg;

architecture Behavioral of TB_7_Seg is
component LUT_16_7
        Port ( Address : in STD_LOGIC_VECTOR (3 downto 0);
               Data : out STD_LOGIC_VECTOR (6 downto 0);
               Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Data_in, Anode : STD_LOGIC_VECTOR (3 downto 0);
signal seg7_out : STD_LOGIC_VECTOR (6 downto 0);
begin
UUT: LUT_16_7
    port map(
         Address => Data_in, 
         Data => seg7_out,
         Anode => Anode
    );

process
begin
      --Index No:- 210206 => 11 0011 0101 0001 1110
      --Index No:- 210207 => 11 0011 0101 0001 1111
      Data_in <= "1110";
      wait for 200 ns;
      
      Data_in <= "1111";
      wait for 200 ns;
      
      Data_in <= "0101";
      wait for 200 ns;
            
      Data_in <= "0011";
      wait for 200 ns;
            
      Data_in <= "0001";
      wait for 200 ns;
            
end process;
end Behavioral;
