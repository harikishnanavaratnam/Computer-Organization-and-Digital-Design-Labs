----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 11:21:52 AM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D_in: in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           D_out : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is
component D_FF
    Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       EN : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;
begin
D_FF_0: D_FF
    port map(
        D =>D_in(0),
        Res =>Res,
        EN =>Enable,
        Clk =>Clk,
        Q => D_out(0)
    );

D_FF_1: D_FF
    port map(
        D =>D_in(1),
        Res =>Res,
        EN =>Enable,
        Clk =>Clk,
        Q => D_out(1)
    );

D_FF_2: D_FF
    port map(
        D =>D_in(2),
        Res =>Res,
        EN =>Enable,
        Clk =>Clk,
        Q => D_out(2)
    );

D_FF_3: D_FF
    port map(
        D =>D_in(3),
        Res =>Res,
        EN =>Enable,
        Clk =>Clk,
        Q => D_out(3)
    );


end Behavioral;
