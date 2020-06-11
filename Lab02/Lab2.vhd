library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity Lab2 is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 C : in STD_LOGIC;
 LD0 : out STD_LOGIC;
 LD1 : out STD_LOGIC;
 LD2 : out STD_LOGIC);
end Lab2;
architecture Behavioral of Lab2 is
begin
 LD0 <= A AND B AND C;
 LD1 <= ((NOT A) AND B AND C) OR ( A AND (NOT B) AND C) OR (A AND B AND (NOT C));
 LD2 <= ((NOT A) AND (NOT B)) OR ((NOT A) AND (NOT C)) OR ((NOT B) AND (NOT C)); 
 
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity Circuit2sim is
-- Port ( );
end Circuit2sim;