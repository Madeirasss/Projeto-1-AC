----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 12:22:14
-- Design Name: 
-- Module Name: tb_gestor_perifericos - Behavioral
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

entity tb_gestor_perifericos is
--  Port ( );
end tb_gestor_perifericos;

architecture Behavioral of tb_gestor_perifericos is
    signal clk      : STD_LOGIC := '0';
    signal escr_p   : STD_LOGIC := '0';
    signal pin      : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal operando1: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal dados_in : STD_LOGIC_VECTOR (7 downto 0);
    signal pout     : STD_LOGIC_VECTOR (7 downto 0);

begin
    -- Instância do Gestor de Periféricos
    uut: entity work.gestor_perifericos
        port map (
            clk => clk,
            escr_p => escr_p,
            pin => pin,
            operando1 => operando1,
            dados_in => dados_in,
            pout => pout
        );

    -- Geração do sinal de relógio
    clk_process: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Processo de teste
    stim_proc: process
    begin
        -- Teste de leitura (escr_p = '0')
        pin <= "10101010";  -- Dados de entrada
        escr_p <= '0';
        wait for 10 ns;
        -- Verifique se dados_in = "10101010"

        -- Teste de escrita (escr_p = '1')
        operando1 <= "11001100";  -- Dados para escrita
        escr_p <= '1';
        wait for 10 ns;
        -- Verifique se pout = "11001100"

        wait;
    end process;
end Behavioral;