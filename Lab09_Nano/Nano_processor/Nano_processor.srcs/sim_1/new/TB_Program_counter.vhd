----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 06:47:10 PM
-- Design Name: 
-- Module Name: TB_Program_counter - Behavioral
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

entity TB_Program_counter is
--  Port ( );
end TB_Program_counter;

architecture Behavioral of TB_Program_counter is
component Program_counter
    Port ( Clk_in : in STD_LOGIC;
       Res : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR (2 downto 0);
       Memory : out STD_LOGIC_VECTOR (2 downto 0));
end component; 
signal Clk_in : std_logic:='0';
signal Res : std_logic;
signal D, Memory : std_logic_vector (2 downto 0);
begin
UUT: Program_counter
    port map(
       Clk_in => Clk_in,
       Res => Res,
       D => D,
       Memory => Memory
    );

process begin
      wait for 50 ns;
      Clk_in <= not (Clk_in);
end process;

process begin
    --Index No:- 210206 => 110 011 010 100 011 110
    --Index No:- 210207 => 110 011 010 100 011 111
    wait for 100 ns;
    Res <= '1';
    D <= "110";
    
    wait for 100 ns;
    Res <= '0';
    D <= "111";
    
    wait for 200 ns;
    D <= "011";
    
    wait for 200 ns;
    Res <= '1';
    D <= "100";

    wait for 200 ns;
    Res <= '0';
    D <= "010";
    
    wait;
end process;


end Behavioral;
