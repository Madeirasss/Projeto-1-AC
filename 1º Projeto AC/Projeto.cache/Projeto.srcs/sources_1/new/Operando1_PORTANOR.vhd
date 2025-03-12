library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Operando1_PORTANOR is
Port ( Operando1_0: in std_logic;
    Operando1_1: in std_logic;
    Operando1_2: in std_logic;
    Operando1_3: in std_logic;
    Operando1_4: in std_logic;
    Operando1_5: in std_logic;
    Operando1_6: in std_logic;
    Operando1_7: in std_logic;
    Operando1_NOR: out std_logic);
end Operando1_PORTANOR;

architecture Behavioral of Operando1_PORTANOR is
begin
process (Operando1_0,Operando1_1,Operando1_2,Operando1_3,Operando1_4,Operando1_5,Operando1_6, Operando1_7  )
begin

Operando1_NOR <= not (Operando1_0 or Operando1_1 or Operando1_2 or Operando1_3 or Operando1_4 or Operando1_5 or Operando1_6 or Operando1_7);

end process;

end Behavioral;
