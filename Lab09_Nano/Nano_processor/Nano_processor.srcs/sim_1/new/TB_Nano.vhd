----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 02:16:53 AM
-- Design Name: 
-- Module Name: TB_Nano - Behavioral
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

entity TB_Nano is
--  Port ( );
end TB_Nano;

architecture Behavioral of TB_Nano is
component Nano_Processor
    Port ( Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Zero : out STD_LOGIC;
       Overflow : out STD_LOGIC;
       LED : out STD_LOGIC_VECTOR (3 downto 0);
       Seg_7 : out STD_LOGIC_VECTOR (6 downto 0);
       Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Clk : STD_LOGIC:= '0';
signal Reset, Zero, Overflow : STD_LOGIC;
signal Led_out, Anode : STD_LOGIC_VECTOR (3 downto 0);
signal To_7_seg : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT: Nano_Processor
    port map(
          Clk => Clk,
          Reset => Reset,
          Zero => Zero,
          Overflow => Overflow,
          LED => Led_out,
          Seg_7 => To_7_seg,
          Anode => Anode
    );
process 
begin 
     wait for 5 ns;
     Clk <= NOT(Clk);
end process;
process  
begin
     wait for 95 ns;
     Reset <= '1';
     
     wait for 5 ns;
     Reset <= '0'; 
     wait;
end process;
end Behavioral;
