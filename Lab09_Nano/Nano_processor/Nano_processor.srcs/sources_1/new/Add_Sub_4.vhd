----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 02:49:42 AM
-- Design Name: 
-- Module Name: Add_Sub_4 - Behavioral
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

entity Add_Sub_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           B : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Ctrl: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is
component FA
     port (
      A: in std_logic;
      B: in std_logic;
      C_in: in std_logic;
      S: out std_logic;
      C_out: out std_logic);
end component;

SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C,B_0,B_1,B_2,B_3: std_logic;
SIGNAL S_In : STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
B_0 <= B(0) XOR Ctrl;
B_1 <= B(1) XOR Ctrl;
B_2 <= B(2) XOR Ctrl;
B_3 <= B(3) XOR Ctrl;

 FA_0 : FA
  port map (
   A => A(0),
   B => B_0,
   C_in => Ctrl, 
   S => S_In(0),
   C_Out => FA0_C);
   
 FA_1 : FA
  port map (
   A => A(1),
   B => B_1,
   C_in => FA0_C,
   S => S_In(1),
   C_Out => FA1_C);
 
 FA_2 : FA
  port map (
   A => A(2),
   B => B_2,
   C_in => FA1_C,
   S => S_In(2),
   C_Out => FA2_C);
   
 FA_3 : FA
  port map (
   A => A(3),
   B => B_3,
   C_in => FA2_C,
   S => S_In(3),
   C_Out => C_out);
S <= S_In;
Zero <= NOT (S_In(0) OR S_In(1) OR S_In(2) OR S_In(3)); 
end Behavioral;
