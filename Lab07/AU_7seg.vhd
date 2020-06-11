library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity AU_7_seg is
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 Clk : in STD_LOGIC;
 RegSel : in STD_LOGIC;
 S_LED : out STD_LOGIC_VECTOR (3 downto 0);
 S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
 Carry : out STD_LOGIC;
 Zero : out STD_LOGIC;
 Anode : out STD_LOGIC_VECTOR (3 downto 0)
 );
end AU_7_seg;
architecture Behavioral of AU_7_seg is
component AU
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 RegSel : in STD_LOGIC;
 Clk : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (3 downto 0);
 Zero : out STD_LOGIC;
 Carry : out STD_LOGIC);
 
end component;
component LUT_16_7
 Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
 data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component Slow_Clk
 Generic(count_max:integer);
 Port ( Clk_in : in STD_LOGIC;
 Clk_out : out STD_LOGIC); 
end component;
signal S: STD_LOGIC_VECTOR (3 downto 0);
signal S_7s : STD_LOGIC_VECTOR (6 downto 0):= "0000000";
signal C, Clk_7seg: STD_LOGIC;
signal selected_7seg : integer := 0;
begin
AU_0: AU
 Port map ( 
 A => A,
 RegSel => RegSel,
 Clk => Clk_7seg,
 S => S,
 Zero => Zero,
 Carry => C);
LUT_16_7_0: LUT_16_7
 Port map (
 address => S,
 data => S_7s );
 
Slow_Clk_7seg: Slow_Clk
 
 Generic map(count_max => 100000)
 Port map (
 Clk_in => Clk,
 Clk_out => Clk_7seg); 
 
S_LED <= S;
Carry <= C;
Anode <="1110";
end Behavioral;