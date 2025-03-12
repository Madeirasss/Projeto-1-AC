library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_decod is
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
end rom_decod;

architecture Behavioral of rom_decod is
begin   
        process (opcode)
    begin
        case opcode is
            -- LDP Ri
            when "00000" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "01";
                           escr_r <= '1'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- STP Ri
            when "00001" => sel_alu <= "XXXX"; escr_p <= '1'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- LD Ri, constante
            when "00010" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "11";
                           escr_r <= '1'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- LD Ri, [constante]
            when "00011" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "10";
                           escr_r <= '1'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- ST [constante], Ri
            when "00100" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '1'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- ADD Ri, Rj
            when "00101" => sel_alu <= "0000"; escr_p <= '0'; sel_r <= "00";
                           escr_r <= '1'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- SUB Ri, Rj
            when "00110" => sel_alu <= "0001"; escr_p <= '0'; sel_r <= "00";
                           escr_r <= '1'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- AND Ri, Rj
            when "00111" => sel_alu <= "0010"; escr_p <= '0'; sel_r <= "00";
                           escr_r <= '1'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- OR Ri, Rj
            when "01001" => sel_alu <= "0100"; escr_p <= '0'; sel_r <= "00";
                           escr_r <= '1'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
            -- CMP Ri, Rj
            when "01101" => sel_alu <= "1000"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "000"; escr_f <= '1'; sel_f <= "XXX";
            -- JE constante
            when "01110" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "010"; escr_f <= '0'; sel_f <= "010";
            -- JL constante
            when "01111" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "010"; escr_f <= '0'; sel_f <= "000";
            -- JLE constante
            when "10000" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "010"; escr_f <= '0'; sel_f <= "001";
            -- JGE constante
            when "10001" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "010"; escr_f <= '0'; sel_f <= "011";
            -- JG constante
            when "10010" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "010"; escr_f <= '0'; sel_f <= "100";
            -- JMP constante
            when "10011" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "001"; escr_f <= '0'; sel_f <= "XXX";
            -- JZ Ri, constante
            when "10100" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "011"; escr_f <= '0'; sel_f <= "XXX";
            -- JN Ri, constante
            when "10101" => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "100"; escr_f <= '0'; sel_f <= "XXX";
            -- NOP
            when others  => sel_alu <= "XXXX"; escr_p <= '0'; sel_r <= "XX";
                           escr_r <= '0'; wr <= '0'; sel_pc <= "000"; escr_f <= '0'; sel_f <= "XXX";
        end case;
    end process;

end Behavioral;
