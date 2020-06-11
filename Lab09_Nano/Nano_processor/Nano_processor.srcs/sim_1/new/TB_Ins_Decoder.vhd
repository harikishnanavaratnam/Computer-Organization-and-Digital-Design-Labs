----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 12:55:46 AM
-- Design Name: 
-- Module Name: TB_Ins_Decoder - Behavioral
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

entity TB_Ins_Decoder is
--  Port ( );
end TB_Ins_Decoder;

architecture Behavioral of TB_Ins_Decoder is
component Ins_Decoder
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
end component;
signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_to_JUMP, Imm_Value : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_EN, J_V, Reg_M0, Reg_M1 : STD_LOGIC_VECTOR (2 downto 0);
signal Load_Selector, ALU_EN, J_F : STD_LOGIC ;
begin
UUT: Ins_Decoder
        Port map ( Ins => Instruction,
               Reg_Jum => Reg_to_JUMP,
               Reg_EN => Reg_EN,
               Load_Sel => Load_Selector,
               Input_Value => Imm_Value,
               Reg_Sel_0 => Reg_M0,
               Reg_Sel_1 => Reg_M1,
               ADD_Sub_Sel => ALU_EN,
               JMP_Flag => J_F,
               Jmp_Value => J_V);
process
begin
    --Index No:- 210206 => 11 0011 0101 0001 1110
    --Index No:- 210207 => 11 0011 0101 0001 1111
    Instruction <= "100100001110"; -- MOV R2,14
    wait for 100 ns;
    
    Instruction <= "010100011110"; -- NEG R2
    wait for 125 ns;
    
    Instruction <= "101100000001"; -- MOV R6,1
    wait for 100 ns;
    
    Instruction <= "101010001010"; -- MOV R5,10
    wait for 100 ns;
    
    Instruction <= "001101010000"; -- ADD R6,R5
    wait for 125 ns;
    
    Instruction <= "110010000100"; -- JZR R1,4
    wait for 125 ns;
    
    Instruction <= "111010001001"; -- JZR R5,9
    wait for 100 ns;
    
    Reg_to_JUMP <= "1110";
    wait for 125 ns;
    
    Reg_to_JUMP <= "0000";
    wait for 100 ns;
    

    
end process;


end Behavioral;
