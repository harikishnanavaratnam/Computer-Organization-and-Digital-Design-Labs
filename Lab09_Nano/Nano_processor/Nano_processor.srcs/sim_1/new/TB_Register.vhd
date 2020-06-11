----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 07:45:41 PM
-- Design Name: 
-- Module Name: TB_Register - Behavioral
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

entity TB_Register is
--  Port ( );
end TB_Register;

architecture Behavioral of TB_Register is
component Reg
    Port ( D_in: in STD_LOGIC_VECTOR (3 downto 0);
       Enable : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       D_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Res : STD_LOGIC;
signal D_in, D_out : STD_LOGIC_VECTOR (3 downto 0);
signal Clk, En: std_logic:= '0';
begin
UUT: Reg
    Port map(
         D_in => D_in,
         Enable => En,
         Res => Res,
         Clk => Clk,
         D_out => D_out
    );
process begin
      wait for 50 ns;
      Clk <= not(Clk);
end process;

process 
begin 
     En <= '1';
     Res <= '1';
     wait for 60 ns;
     
     --Index No:- 210206 => 11 0011 0101 0001 1110
     --Index No:- 210207 => 11 0011 0101 0001 1111
     Res <= '0';
     D_in <= "1110";
     wait for 100 ns;
     
     D_in <= "0001";
     wait for 100 ns;
     
     En <= '0';
     D_in <= "0101";
     wait for 100 ns;
     
     Res <= '1';
     wait for 100 ns;
     
     En <= '1';
     Res <= '0';
     D_in <= "0011";
     wait for 100 ns;     
     
     D_in <= "1111";
     wait for 100 ns;
end process;
end Behavioral;
