----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 01:46:46 PM
-- Design Name: 
-- Module Name: Ins_Decoder - Behavioral
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

 entity Ins_Decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
       Reg_Jum : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
       Load_Sel : out STD_LOGIC;
       Input_Value : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_Sel_0 : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
       ADD_Sub_Sel : out STD_LOGIC;
       JMP_Flag : out STD_LOGIC;
       Jmp_Value : out STD_LOGIC_VECTOR (2 downto 0));
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is
component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
       EN : in STD_LOGIC;
       Y : OUT STD_LOGIC_VECTOR (3 downto 0));
end component;
signal ADD,NEG,MOV,JZR: std_logic;
begin
Decoder_2_4_0: Decoder_2_to_4
    port map(
        I => Ins(11 downto 10),
        EN => '1',
        Y(0) => ADD,
        Y(1) => NEG,
        Y(2) => MOV,
        Y(3) => JZR
    );

Reg_EN <= Ins(9 downto 7);

Reg_Sel_0 <= Ins(9 downto 7);
Reg_Sel_1 <= Ins(6 downto 4);

ADD_Sub_Sel <= NEG;

Load_Sel <= MOV; 
Input_Value <= Ins(3 downto 0);

JMP_Flag <= JZR and not(Reg_Jum(3) or Reg_Jum(2) or Reg_Jum(1) or Reg_Jum(0));
Jmp_Value <= Ins(2 downto 0);


end Behavioral;       
        