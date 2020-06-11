----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 12:03:19 PM
-- Design Name: 
-- Module Name: P_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P_ROM is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end P_ROM;

architecture Behavioral of P_ROM is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    signal Prog_Rom: rom_type := (
--           "100010001010",  -- MOVI R1,10  
  --         "100100000001",  -- MOVI R2,1
    --       "010100000000",  -- NEG R2   
      --     "000010100000",  -- ADD R1,R2
        --   "110010000111",  -- JZR R1,7
          -- "110000000011",  -- JZR R0,3
          -- "101110001001",  -- MOVI R7,9
          -- "000100110000"   -- ADD R2,R3
          
          -- Counting 1 to f
            "100010000001",  -- MOVI R1,1
             "001110010000", -- ADD R7,R1
             "110000000001", -- JZR R0,1
             "001110010000", -- ADD R7,R2  --Below steps are dummy 
             "001110010000", -- ADD R7,R2
             "001110010000", -- ADD R7,R2
             "001110010000", -- ADD R7,R2
             "110000000111"  -- JZR R0,7
             
          -- adding 4,3,2,1......
--            "100010000110",  -- MOVI R1,5
  --           "100100000001",  -- MOVI R2,1
    --         "010100000000",  -- NEG R2
      --       "000010100000", -- ADD R1,R2
        --     "001110010000", -- ADD R7,R1
          --   "110010000101", -- JZR R1,5
            -- "110000000011", -- JZR R0,3   --Below steps are dummy  
            -- "001110010000" -- ADD R7,R2
 
          --backward counting 
--          "101110001111",  -- MOVI R7,F
  --        "100100000001",  -- MOVI R2,1
    --      "010100000000",  -- NEG R2
      --    "001110100000", -- ADD R7,R2
        --  "111110000111", -- JZR R7,7
          --"110000000011", -- JZR R0,3   -- dummy  
          --"001110010000", -- ADD R7,R2  -- dummy  
          --"111110000111"  -- JZR R7,7
            );

begin
  Instruction <= Prog_Rom(to_integer(unsigned(Address)));
end Behavioral;
