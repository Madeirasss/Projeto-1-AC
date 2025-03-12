library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           constante_in : in STD_LOGIC_VECTOR (7 downto 0);
           escr_pc : in STD_LOGIC;
           endereco : out STD_LOGIC_VECTOR (7 downto 0)
    );
end pc;

architecture Behavioral of pc is

begin
    process (clk, reset, constante_in, escr_pc)
    variable contagem: STD_LOGIC_VECTOR (7 downto 0):="00000000";
    begin
        if rising_edge(clk) then
            if reset = '0' then
                if escr_pc='0' then
                    contagem:=contagem+"00000001";
                else
                    contagem:=constante_in;
                end if;
            else
                contagem:="00000000";
            end if;
            endereco<=contagem;
        end if;
    end process;
end Behavioral;
