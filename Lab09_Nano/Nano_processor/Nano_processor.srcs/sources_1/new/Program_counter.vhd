----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 06:37:22 PM
-- Design Name: 
-- Module Name: Program_counter - Behavioral
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

entity Program_counter is
    Port ( Clk_in : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Memory : out STD_LOGIC_VECTOR (2 downto 0));
end Program_counter;

architecture Behavioral of Program_counter is
component D_FF
    Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       EN : in STD_LOGIC:='1';
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;
begin
D_FF_0: D_FF
    port map(
        D => D(0),
        Res => Res,
        Clk => Clk_in,
        Q => Memory(0)
    );
    
D_FF_1: D_FF
        port map(
            D => D(1),
            Res => Res,
            Clk => Clk_in,
            Q => Memory(1)
        );

D_FF_2: D_FF
    port map(
        D => D(2),
        Res => Res,
        Clk => Clk_in,
        Q => Memory(2)
    );

end Behavioral;
