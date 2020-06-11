library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity Slow_Clk_Sim is
-- Port ( );
end Slow_Clk_Sim;
architecture Behavioral of Slow_Clk_Sim is
component Slow_Clk
Port ( Clk_in : in STD_LOGIC;
 Clk_out : out STD_LOGIC);
end component;
signal Clk_in : STD_LOGIC := '0';
signal Clk_out : STD_LOGIC;
begin
uut : Slow_Clk port map (
 Clk_in => Clk_in,
 Clk_out => Clk_out
 );
process
begin 
 wait for 20 ns;
 Clk_in <= not Clk_in;
end process;
end Behavioral;