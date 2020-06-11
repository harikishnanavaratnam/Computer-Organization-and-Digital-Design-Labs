----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2023 12:14:01 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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
-- N.Harikishna
-- 210206B
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

entity Mux_8_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
COMPONENT Decoder_3_to_8
 PORT (
 I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
 EN: IN STD_LOGIC;
 Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
 );
END COMPONENT;
signal O:std_logic_vector(7 downto 0);
signal a: std_logic_vector(7 downto 0);
begin
Decoder_3_8: Decoder_3_to_8
 PORT MAP(
 Y => O,
 EN => EN,
 I => S
 );
a <= O and D;
Y <= (a(7) or a(6) or a(5) or a(4) or a(3) or a(2) or a(1) or a(0)) and EN;
end Behavioral;

