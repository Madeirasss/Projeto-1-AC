library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_r is
    Port ( resultado : in STD_LOGIC_VECTOR (7 downto 0);
           dados_in : in STD_LOGIC_VECTOR (7 downto 0);
           dados_m : in STD_LOGIC_VECTOR (7 downto 0);
           constante_in : in STD_LOGIC_VECTOR (7 downto 0);
           sel_r : in STD_LOGIC_VECTOR (1 downto 0);
           dados_r : out STD_LOGIC_VECTOR(7 downto 0)
    );
end mux_r;

architecture Behavioral of mux_r is
begin
    process (sel_r, resultado, dados_in, dados_m, constante_in)
    begin
        case sel_r is
            when "00" => dados_r <= resultado;
            when "01" => dados_r <= dados_in; 
            when "10" => dados_r <= dados_m;
            when "11" => dados_r <= constante_in; 
            when others => dados_r <= (others => 'X');
        end case;
    end process;
end Behavioral;
