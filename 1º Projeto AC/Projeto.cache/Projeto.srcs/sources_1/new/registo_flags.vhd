library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registo_flags is
    Port ( clk : in STD_LOGIC;
           sel_f : in STD_LOGIC_VECTOR (2 downto 0);
           escr_f : in STD_LOGIC;
           comp_flag : in STD_LOGIC_VECTOR (4 downto 0);
           s_flag : out STD_LOGIC
    );
end registo_flags;
 
architecture Behavioral of registo_flags is
    signal Flags : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
begin
    process (clk, escr_f, comp_flag)
    begin
        if rising_edge(clk) then
            if escr_f = '1' then 
                Flags <= comp_flag;
            end if;
        end if;
    end process;

    process (sel_f, Flags)
    begin
        case sel_f is
            when "000" => s_flag <= Flags(0); -- Menor que (<)
            when "001" => s_flag <= Flags(1); -- Menor ou igual (<=)
            when "010" => s_flag <= Flags(2); -- Igual (=)
            when "011" => s_flag <= Flags(3); -- Maior ou igual (>=)
            when "100" => s_flag <= Flags(4); -- Maior que (>)
            when others => s_flag <= 'X';
        end case;
    end process;

end Behavioral;
