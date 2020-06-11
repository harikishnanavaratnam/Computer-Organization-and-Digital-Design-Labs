----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 08:03:50 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
component Register_Bank
    Port ( Da_In : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           S_Reg : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal D, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (3 downto 0);
signal R0 : STD_LOGIC_VECTOR (3 downto 0) :="0000";
signal Clk : STD_LOGIC:= '0';
signal Res : STD_LOGIC;
signal Sel : STD_LOGIC_VECTOR (2 downto 0);
begin
UUT: Register_Bank
   Port map(
       Da_in => D,
       Clk => Clk,
       S_Reg => Sel,
       Res => Res,
       R0_out => R0,
       R1_out => R1,
       R2_out => R2,
       R3_out => R3,
       R4_out => R4,
       R5_out => R5,
       R6_out => R6,
       R7_out => R7
   );
process begin
         wait for 50 ns;
         Clk <= not(Clk);
end process;

process
begin 
        --Index No:- 210206 => 11 0011 0101 0001 1110 (For Data_in)
        --Index No:- 210207 => 110 011 010 100 011 111 (For Register Selection)
        D <= "1110";
        Sel <= "111";
        wait for 100 ns;
        
        D <= "0001";
        Sel <= "011";
        wait for 100 ns;
        
        D <= "0101";
        Sel <= "100";
        wait for 100 ns;
        
        Res <= '1';
        wait for 100 ns;
        
        Res <= '0';
        D <= "0011";
        Sel <= "010";
        wait for 100 ns;
        
        D <= "1100";
        Sel <= "110";
        wait for 100 ns;
        
end process;
end Behavioral;
