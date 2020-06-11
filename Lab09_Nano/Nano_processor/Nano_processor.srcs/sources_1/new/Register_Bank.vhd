----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 11:41:46 AM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
end Register_Bank;

architecture Behavioral of Register_Bank is
component Reg
    Port ( D_in: in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           D_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC:='1';
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal Reg_En : STD_LOGIC_VECTOR (7 downto 0);

begin
Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        I => S_Reg,
        Y => Reg_En
        );

Reg_0: Reg
     port map(
              D_in => "0000",
              Enable => Reg_En(0),
              Clk => Clk,
              Res => Res,
              D_out => R0_out
              );
Reg_1: Reg
     port map(
              D_in => Da_in,
              Enable => Reg_En(1),
              Clk => Clk,
              Res => Res,
              D_out => R1_out
              );
Reg_2: Reg
     port map(
              D_in => Da_in,
              Enable => Reg_En(2),
              Clk => Clk,
              Res => Res,
              D_out => R2_out
              );
Reg_3: Reg
     port map(
              D_in => Da_in,
              Enable => Reg_En(3),
              Clk => Clk,
              Res => Res,
              D_out => R3_out
              );
Reg_4: Reg
     port map(
              D_in => Da_in,
              Enable => Reg_En(4),
              Clk => Clk,
              Res => Res,
              D_out => R4_out
              );
Reg_5: Reg
     port map(
              D_in => Da_in,
              Enable => Reg_En(5),
              Clk => Clk,
              Res => Res,
              D_out => R5_out
              );
Reg_6: Reg
     port map(
              D_in => Da_in,
              Enable => Reg_En(6),
              Clk => Clk,
              Res => Res,
              D_out => R6_out
              );
Reg_7: Reg
     port map(
              D_in => Da_in,
              Enable => Reg_En(7),
              Clk => Clk,
              Res => Res,
              D_out => R7_out
              );


end Behavioral;
