library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gestor_perifericos is
    Port ( pin : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           escr_p : in STD_LOGIC;
           dados_in : out STD_LOGIC_VECTOR (7 downto 0);
           pout : out STD_LOGIC_VECTOR (7 downto 0)
    );
end gestor_perifericos;

architecture Behavioral of gestor_perifericos is

begin
    process (escr_p, pin, clk)
    begin
        if (escr_p = '0') then
            dados_in <= pin;
         
        elsif (escr_p = '1') then
            if rising_edge(clk) then 
                pout<=operando1;
            end if;
        end if; 
end process;
            

end Behavioral;
