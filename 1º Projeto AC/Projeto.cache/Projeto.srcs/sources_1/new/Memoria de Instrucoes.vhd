library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria_instrucoes is
    Port ( endereco : in STD_LOGIC_VECTOR (7 downto 0);
           opcode : out STD_LOGIC_VECTOR (4 downto 0);
           sel_reg1 : out STD_LOGIC_VECTOR (2 downto 0);
           sel_reg2 : out STD_LOGIC_VECTOR (2 downto 0);
           constante : out STD_LOGIC_VECTOR (7 downto 0)
    );
end memoria_instrucoes;

architecture Behavioral of memoria_instrucoes is
begin
    process (endereco)
  begin
   case endereco is 
    
    -- LDP, R1
    when "00000000" => opcode <= "00000"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "XXXXXXXX";
    
    --ST[0], R1
    when "00000001" => opcode <= "00100"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "00000000";
    
    --LD R5, 0
    when "00000010" => opcode <= "00010"; sel_reg1 <= "101"; sel_reg2 <= "XXX"; constante <= "00000000";
    
    --LD, R4, 1
    when "00000011" => opcode <= "00010"; sel_reg1 <= "100"; sel_reg2 <= "XXX"; constante <= "00000001";
    
    --CMP R1 R5
    when "00000100" => opcode <= "01101"; sel_reg1 <= "001"; sel_reg2 <= "101"; constante <= "XXXXXXXX";
    
    --JL 21
    when "00000101" => opcode <= "01111"; sel_reg1 <= "XXX"; sel_reg2 <= "XXX"; constante <= "00010101";
    
    --LD R2 42
    when "00000110" => opcode <= "00010"; sel_reg1 <= "010"; sel_reg2 <= "XXX"; constante <= "00101010";
    
    -- LD R1 [0]
    when "00000111" => opcode <= "00011"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "00000000";
    
    --CMP R1 R2
    when "00001000" => opcode <= "01101"; sel_reg1 <= "001"; sel_reg2 <= "010"; constante <= "XXXXXXXX";
    
    --JG 18
    when "00001001" => opcode <= "10010"; sel_reg1 <= "XXX"; sel_reg2 <= "XXX"; constante <= "00010010";
    
    --LD R3 [0]
    when "00001010" => opcode <= "00011"; sel_reg1 <= "011"; sel_reg2 <= "XXX"; constante <= "00000000";
    
    --LD R1 [0]
    when "00001011" => opcode <= "00011"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "00000000";
    
    --ADD R1 R3
    when "00001100" => opcode <= "00101"; sel_reg1 <= "001"; sel_reg2 <= "011"; constante <= "XXXXXXXX";
    
    --ADD R1 R3
    when "00001101" => opcode <= "00101"; sel_reg1 <= "001"; sel_reg2 <= "011"; constante <= "XXXXXXXX";
    
    --JZ R1 16
    when "00001110" => opcode <= "10100"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "00010000";
    
    --ADD R1 R4
    when "00001111" => opcode <= "00101"; sel_reg1 <= "001"; sel_reg2 <= "100"; constante <= "XXXXXXXX";
    
    --STP R1
    when "00010000" => opcode <= "00001"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "XXXXXXXX";
    
    --JMP 17
    when "00010001" => opcode <= "10011"; sel_reg1 <= "XXX"; sel_reg2 <= "XXX"; constante <= "00010001";
    
    --LD R1 [0]
    when "00010010" => opcode <= "00011"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "00000000";
    
    --SUB R1 R2
    when "00010011" => opcode <= "00110"; sel_reg1 <= "001"; sel_reg2 <= "010"; constante <= "XXXXXXXX";
    
    --JMP 16
    when "00010100" => opcode <= "10011"; sel_reg1 <= "XXX"; sel_reg2 <= "XXX"; constante <= "00010000";
    
    --LD R1 [0]
    when "00010101" => opcode <= "00011"; sel_reg1 <= "001"; sel_reg2 <= "XXX"; constante <= "00000000";
    
    --LD R3 -1
    when "00010110" => opcode <= "00010"; sel_reg1 <= "011"; sel_reg2 <= "XXX"; constante <= "11111111";
    
    --XOR R1 R3
    when "00010111" => opcode <= "01011"; sel_reg1 <= "001"; sel_reg2 <= "011"; constante <= "XXXXXXXX";
    
   --JMP 15
    when "00011000" => opcode <= "10011"; sel_reg1 <= "XXX"; sel_reg2 <= "XXX"; constante <= "00001111";
    
   --outros 
    when others => opcode <= "XXXXX"; sel_reg1 <= "XXX"; sel_reg2 <= "XXX"; constante <= "XXXXXXXX";
        end case;
    end process;
end Behavioral;
