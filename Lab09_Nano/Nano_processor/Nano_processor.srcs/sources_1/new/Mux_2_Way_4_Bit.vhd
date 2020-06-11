----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 09:08:12 AM
-- Design Name: 
-- Module Name: Mux_2_Way_4_Bit - Behavioral
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

entity Mux_2_Way_4_Bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           JF : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_Way_4_Bit;

architecture Behavioral of Mux_2_Way_4_Bit is
component Mux_2_to_1
   Port ( A : in STD_LOGIC;
          B : in STD_LOGIC;
          Sel : in STD_LOGIC;
          Y : out STD_LOGIC);
end component;
begin
Mux_0: Mux_2_to_1
     Port map(
          A => A(0),
          B => B(0),
          Sel => JF,
          Y => Q(0));
 
Mux_1: Mux_2_to_1
     Port map(
          A => A(1),
          B => B(1),
          Sel => JF,
          Y => Q(1));   

Mux_2: Mux_2_to_1
     Port map(
          A => A(2),
          B => B(2),
          Sel => JF,
          Y => Q(2));

Mux_3: Mux_2_to_1
     Port map(
          A => A(3),
          B => B(3),
          Sel => JF,
          Y => Q(3));

end Behavioral;
