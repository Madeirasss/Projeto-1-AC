library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

entity alu is
    Port ( sel_alu : in STD_LOGIC_VECTOR (3 downto 0);
           operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           operando2 : in STD_LOGIC_VECTOR (7 downto 0);
           resultado : out STD_LOGIC_VECTOR (7 downto 0);
           comp_flag : out STD_LOGIC_VECTOR (4 downto 0)
    );
end alu;

architecture Behavioral of alu is 
begin
    process(operando1, operando2, sel_alu)
    begin
        case sel_alu is
            when "0000" => resultado <= operando1 + operando2;
            when "0001" => resultado <= operando1 - operando2;
            when "0010" => resultado <= operando1 and operando2;
            when "0011" => resultado <= not (operando1 and operando2);
            when "0100" => resultado <= operando1 or operando2;
            when "0101" => resultado <= not (operando1 or operando2);
            when "0110" => resultado <= operando1 xor operando2;
            when "0111" => resultado <= not (operando1 xor operando2);
            when "1000" =>
                if (operando1 < operando2) then
                    comp_flag(0) <= '1';
                else
                    comp_flag(0) <= '0';
                end if;
    
                if (operando1 <= operando2) then
                    comp_flag(1) <= '1';
                else
                    comp_flag(1) <= '0';
                end if;
    
                if (operando1 = operando2) then
                    comp_flag(2) <= '1';
                else
                    comp_flag(2) <= '0';
                end if;
    
                if (operando1 >= operando2) then
                    comp_flag(3) <= '1';
                else
                    comp_flag(3) <= '0';
                end if;
    
                if (operando1 > operando2) then
                    comp_flag(4) <= '1';
                else
                    comp_flag(4) <= '0';
                end if;

                resultado <= (others => '0');
            
            when others =>  
                resultado <= (others => 'X');
                comp_flag <= (others => 'X');
        end case;
    end process;


end Behavioral;
