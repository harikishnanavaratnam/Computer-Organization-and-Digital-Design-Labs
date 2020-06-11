----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 09:51:53 AM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           Seg_7 : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is
component Slow_Clk
 Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component P_ROM
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction : out STD_LOGIC_VECTOR (11 downto 0)); 
end component;

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

component Program_counter
     Port ( Clk_in : in STD_LOGIC;
       Res : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR (2 downto 0);
       Memory : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_Way_3_Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       JF : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Add_3
    Port ( I_In : in STD_LOGIC_VECTOR (2 DOWNTO 0);
           I_Out : out STD_LOGIC_VECTOR (2 DOWNTO 0));
end component;

component Mux_8_Way_4_Bit
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
       R1 : in STD_LOGIC_VECTOR (3 downto 0);
       R2 : in STD_LOGIC_VECTOR (3 downto 0);
       R3 : in STD_LOGIC_VECTOR (3 downto 0);
       R4 : in STD_LOGIC_VECTOR (3 downto 0);
       R5 : in STD_LOGIC_VECTOR (3 downto 0);
       R6 : in STD_LOGIC_VECTOR (3 downto 0);
       R7 : in STD_LOGIC_VECTOR (3 downto 0);
       Sel_R : in STD_LOGIC_VECTOR (2 downto 0);
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux_2_Way_4_Bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       JF : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub_4
    Port ( A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
       B : in STD_LOGIC_VECTOR (3 DOWNTO 0);
       Ctrl: in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 DOWNTO 0);
       C_out : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;

component LUT_16_7
        Port ( Address : in STD_LOGIC_VECTOR (3 downto 0);
               Data : out STD_LOGIC_VECTOR (6 downto 0);
               Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

signal S_Clk, Load_Selector, Add_sub_EN, JUMP_flag : STD_LOGIC;
signal Mem_Sel, Register_En, R_Sel_M1, R_Sel_M0, Add_3_out, Address_to_JUMP, Address : STD_LOGIC_VECTOR (2 DOWNTO 0);
signal Instruction_Bus : STD_LOGIC_VECTOR (11 DOWNTO 0);
signal Data_Reg, Immediate_Value, Add_sub_out, Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 : STD_LOGIC_VECTOR (3 DOWNTO 0);
signal Mux_8_4_1_Out, Mux_8_4_0_Out : STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
Slow_Clock : Slow_Clk
 Port map ( Clk_in => Clk,
            Clk_out => S_Clk);

ProgramCounter : Program_counter
     Port map ( Clk_in => S_Clk,
                Res => Reset,
                D => Address,
                Memory => Mem_Sel );
                
Programe_ROM :  P_ROM
    Port map ( Address => Mem_Sel,
               Instruction => Instruction_Bus); 

Instruction_Decoder : Ins_Decoder
    Port map ( Ins => Instruction_Bus,
           Reg_Jum => Mux_8_4_0_Out,
           Reg_EN => Register_En,
           Load_Sel => Load_Selector,
           Input_Value => Immediate_Value,
           Reg_Sel_0 => R_Sel_M0,
           Reg_Sel_1 => R_Sel_M1,
           ADD_Sub_Sel => Add_sub_EN,
           JMP_Flag => JUMP_flag,
           Jmp_Value => Address_to_JUMP );     
 
RegisterBank :  Register_Bank
          Port map ( Da_In => Data_Reg,
                 Clk => S_Clk,
                 S_Reg => Register_En,
                 Res => Reset,
                 R0_out => Reg0,
                 R1_out => Reg1,
                 R2_out => Reg2,
                 R3_out => Reg3,
                 R4_out => Reg4,
                 R5_out => Reg5,
                 R6_out => Reg6,
                 R7_out => Reg7);         

Mux_2_4 :  Mux_2_Way_4_Bit
           Port map ( A => Add_sub_out,
                      B => Immediate_Value,
                      JF => Load_Selector,
                      Q => Data_Reg );

Add_Sub_4_Unit :  Add_Sub_4
           Port map ( A => Mux_8_4_1_Out,
                  B => Mux_8_4_0_Out,
                  Ctrl => Add_sub_EN,
                  S => Add_sub_out,
                  C_out => Overflow,
                  Zero => Zero);
                  
Mux_8_4_0 : Mux_8_Way_4_Bit
         Port map( 
               R0 => Reg0,
               R1 => Reg1,
               R2 => Reg2,
               R3 => Reg3,
               R4 => Reg4,
               R5 => Reg5,
               R6 => Reg6,
               R7 => Reg7,
               Sel_R => R_Sel_M0,
               Q => Mux_8_4_0_Out); 
              
Mux_8_4_1 : Mux_8_Way_4_Bit
                        Port map ( 
                              R0 => Reg0,
                              R1 => Reg1,
                              R2 => Reg2,
                              R3 => Reg3,
                              R4 => Reg4,
                              R5 => Reg5,
                              R6 => Reg6,
                              R7 => Reg7,
                              Sel_R => R_Sel_M1,
                              Q => Mux_8_4_1_Out );  
Adder_3_Bit :  Add_3
                  Port map ( I_In => Mem_Sel,
                             I_Out => Add_3_out);    

Mux_2_3 : Mux_2_Way_3_Bit
        Port map( A => Add_3_out,
               B => Address_to_JUMP,
               JF => JUMP_flag,
               Q => Address); 

Seg_7_dis : LUT_16_7
        Port map ( Address => Reg7,
                  Data => Seg_7, 
                  Anode => Anode );
               
LED <= Reg7;                                      
end Behavioral;
