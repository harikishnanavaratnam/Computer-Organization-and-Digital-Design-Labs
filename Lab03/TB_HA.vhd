library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity TB_HA is
-- Port ( );
end TB_HA;
architecture Behavioral of TB_HA is
COMPONENT HA
 PORT(A ,B: IN STD_LOGIC;
 S, C : OUT STD_LOGIC);
END COMPONENT;
SIGNAL A ,B : std_logic;
SIGNAL S, C : std_logic;
begin
UUT: HA PORT MAP(
A => A,
B => B,
S => S,
C => C
);
process
begin
A <= '0';
B <= '0';
 
WAIT FOR 250 ns;
B <= '1';
 
WAIT FOR 250 ns;
A <= '1';
B <= '0';
 
WAIT FOR 250 ns;
B <= '1';
 
WAIT;
end process;
end Behavioral;