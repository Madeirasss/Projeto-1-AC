library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memoria_dados is
    Port ( clk : in STD_LOGIC;
           wr : in STD_LOGIC;
           constante : in STD_LOGIC_VECTOR (7 downto 0);
           operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           dados_m : out STD_LOGIC_VECTOR (7 downto 0)
           );
end memoria_dados;

architecture Behavioral of memoria_dados is
    type mem_type is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0); -- Memória de 256 posições de 8 bits
    signal memoria : mem_type := (others => (others => '0'));          -- Inicializa a memória com 0
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if wr = '1' then
                -- Modo de escrita: escreve operando1 na posição constante
                memoria(to_integer(unsigned(constante))) <= operando1;
            end if;
        end if;
    end process;

    -- Modo de leitura: atribui o valor da posição constante a dados_m
    dados_m <= memoria(to_integer(unsigned(constante)));
end Behavioral; 
