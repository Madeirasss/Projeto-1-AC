---------------------------------------------------------------------------------- 
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2025 11:07:36
-- Design Name: 
-- Module Name: placa_mae_teste - Behavioral
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

entity placa_mae_teste is
end placa_mae_teste;

architecture Behavioral of placa_mae_teste is

    -- Declaração do componente placa_mae
    component placa_mae
        Port ( reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               pin : in STD_LOGIC_VECTOR (7 downto 0);
               pout : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Declaração de sinais
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal pin : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal pout : STD_LOGIC_VECTOR (7 downto 0);

    -- Período do clock
    constant clk_period : time := 10 ns;

begin
    -- Instanciação do Unit Under Test (UUT)
    uut: placa_mae PORT MAP (
        reset => reset,
        clk => clk,
        pin => pin,
        pout => pout
    );

       -- Clock process definitions
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2; 
   end process;

 
   -- Stimulus process
 stim_proc: process 
   begin
       reset <= '1';
       wait for 100 ns;
       reset <= '0';    
       PIN <= "00001111";
       wait for 1000 ns;
   end process;
end Behavioral;
