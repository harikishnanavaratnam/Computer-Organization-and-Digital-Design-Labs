library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity AU_Sim is
-- Port ( );
end AU_Sim;
architecture Behavioral of AU_Sim is
component AU
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 RegSel : in STD_LOGIC;
 Clk : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (3 downto 0);
 Zero : out STD_LOGIC;
 Carry : out STD_LOGIC);
end component;
signal A, S : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal RegSel , Clk, Zero, Carry : STD_LOGIC :='0';
begin
UUT :AU
 PORT MAP (
 A => A,
 RegSel => RegSel,
 Clk => Clk,
 S => S,
 Zero => Zero,
 Carry => Carry
 );
process 
begin
 Clk <= NOT(Clk);
 wait for 2ns;
end process;
 process 
begin
 --My index No:- 210206B
 A <= "1110" ;
 
 wait for 50ns;
 RegSel <= '1';
 A <= "0001" ;
 
 wait for 50ns;
 RegSel <= '0';
 A <= "0101" ;
 
 wait for 50ns;
 RegSel <= '1';
 A <= "0011" ;
 wait for 50ns;
 
end process;
end Behavioral;
