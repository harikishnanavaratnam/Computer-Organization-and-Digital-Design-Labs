architecture Behavioral of Circuit2sim is
COMPONENT Lab2
 PORT( A, B, C : IN STD_LOGIC;
 LD0, LD1, LD2 : OUT STD_LOGIC);
END COMPONENT;
SIGNAL A, B, C : std_logic;
SIGNAL LD0, LD1, LD2 : std_logic;
begin
UUT: Lab2 PORT MAP(
A => A,
B => B,
C => C,
LD0 => LD0,
LD1 => LD1,
LD2 => LD2);
process
 begin
 A <= '0'; -- set initial values
 B <= '0';
 C <= '0';
 WAIT FOR 100 ns; -- after 100 ns change inputs
 C <= '1';
 WAIT FOR 100 ns; --change again
 B <= '1';
 C <= '0';
 WAIT FOR 100 ns; --change again
 C <= '1';
 WAIT FOR 100 ns; --change again
 A <= '1';
 B <= '0';
 C <= '0';
 WAIT FOR 100 ns; --change again
 C <= '1';
 WAIT FOR 100 ns; --change again
 B <= '1';
 C <= '0';
 WAIT FOR 100 ns; --change again
 C <= '1';
 WAIT; -- will wait forever
end process;
end Behavioral;
