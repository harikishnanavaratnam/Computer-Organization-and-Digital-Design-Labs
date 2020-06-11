----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 05:59:43 PM
-- Design Name: 
-- Module Name: TB_Add_3 - Behavioral
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

entity TB_Add_3 is
--  Port ( );
end TB_Add_3;

architecture Behavioral of TB_Add_3 is
component Add_3
         Port ( I_In : in STD_LOGIC_VECTOR (2 DOWNTO 0);
                I_Out : out STD_LOGIC_VECTOR (2 DOWNTO 0));
end component;
SIGNAL  I_In, I_Out : std_logic_vector (2 downto 0);
begin
UUT: Add_3
   port map(
             I_In  => I_In,
             I_Out => I_Out); 
             
process 
begin 
    --Index No:- 210206 => 110 011 010 100 011 110
    --Index No:- 210207 => 110 011 010 100 011 111
    I_In <= "110";
    
    wait for 200ns;
    I_In <= "111";

    wait for 200ns;
    I_In <= "100";

    wait for 200ns;
    I_In <= "010";

    wait for 200ns;
    I_In <= "011";

    wait;

end process;
end Behavioral;
