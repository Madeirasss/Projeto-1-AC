library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_pc is
    Port ( zero : in std_logic;
           um : in std_logic;
           s_flag : in STD_LOGIC;
           operando1_7 : in STD_LOGIC;
           operando1_nor : in std_logic;
           sel_pc : in STD_LOGIC_VECTOR (2 downto 0);
           escr_pc : out STD_LOGIC
    );
end mux_pc;

architecture Behavioral of mux_pc is

begin
    process (zero, um, s_flag, operando1_7, sel_pc, operando1_nor)
    begin
        case sel_pc is
            when "000" => escr_pc <= zero;
            when "001" => escr_pc <= um;
            when "010" => escr_pc <= s_flag; 
            when "011" => escr_pc <= operando1_nor; 
            when "100" => escr_pc <= operando1_7;
            when others => escr_pc <= 'X';
        end case;
    end process;
end Behavioral;
 