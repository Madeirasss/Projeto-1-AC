----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2025 08:53:49
-- Design Name: 
-- Module Name: teste_rom - Behavioral
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

entity teste_rom is

end teste_rom;

architecture Behavioral of teste_rom is
    component rom_decod 
            Port ( opcode : in STD_LOGIC_VECTOR (4 downto 0);
           wr : out STD_LOGIC;
           escr_p : out STD_LOGIC;
           sel_r : out STD_LOGIC_VECTOR (1 downto 0);
           escr_r : out STD_LOGIC;
           sel_alu : out STD_LOGIC_VECTOR (3 downto 0);
           escr_f : out STD_LOGIC;
           sel_f : out STD_LOGIC_VECTOR (2 downto 0);
           sel_pc : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;
begin


end Behavioral;
