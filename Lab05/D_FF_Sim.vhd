library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity D_FF_Sim is
-- Port ( );
end D_FF_Sim;
architecture Behavioral of D_FF_Sim is
component D_FF 
 Port ( D : in STD_LOGIC;
 Res : in STD_LOGIC;
 Clk : in STD_LOGIC;
 Q : out STD_LOGIC;
 QbaR : out STD_LOGIC);
end component;
signal D,Res : std_logic;
signal Clk : std_logic := '0';
signal Q,Qbar: std_logic;
begin
UUT: D_FF PORT MAP(
D => D,
Res => Res,
Clk => Clk,
Q => Q,
Qbar => Qbar
);
process
begin 
 wait for 30 ns;
 Clk <= not Clk;
end process;
 
process
begin 
D <= '0';
Res <= '1';
wait for 20 ns;
Res <= '0';
 
while now < 1000 ns loop
 D <= not D ;
 wait for 25 ns;
end loop;
end process;
end Behavioral;