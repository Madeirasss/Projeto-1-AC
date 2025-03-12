library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity banco_registos is
    Port ( clk : in STD_LOGIC;
           escr_r : in STD_LOGIC;
           sel_reg1 : in STD_LOGIC_VECTOR (2 downto 0);
           sel_reg2 : in STD_LOGIC_VECTOR (2 downto 0);
           dados_r : in STD_LOGIC_VECTOR (7 downto 0);
           operando1 : out STD_LOGIC_VECTOR (7 downto 0);
           operando2 : out STD_LOGIC_VECTOR (7 downto 0)
    );
end banco_registos;

architecture Behavioral of banco_registos is
type RegArray is array (0 to 5) of STD_LOGIC_VECTOR(7 downto 0);
    signal Regs : RegArray := (others => (others => '0'));

begin
	
	process(ESCR_R, Dados_R, sel_reg1, sel_reg2, clk)
		
	variable R0 : STD_LOGIC_VECTOR (7 downto 0);
	variable R1 : STD_LOGIC_VECTOR (7 downto 0);
	variable R2 : STD_LOGIC_VECTOR (7 downto 0);
	variable R3 : STD_LOGIC_VECTOR (7 downto 0);
	variable R4 : STD_LOGIC_VECTOR (7 downto 0);
	variable R5 : STD_LOGIC_VECTOR (7 downto 0);
	
		begin
			
			if ESCR_R = '1' then
				if sel_reg1 <= "000" then
					R0 := Dados_R;
					Operando1 <= R0;
				elsif sel_reg1 <= "001" then
					R1 := Dados_R;
					Operando1 <= R1;
				elsif sel_reg1 <= "010" then
					R2 := Dados_R;
					Operando1 <= R2;
				elsif sel_reg1 <= "011" then
					R3 := Dados_R;
					Operando1 <= R3;
				elsif sel_reg1 <= "100" then
					R4 := Dados_R;
					Operando1 <= R4;
				elsif  sel_reg1 <= "101" then
					R5 := Dados_R;
					Operando1 <= R5;
				end if;
			end if;
			end process;

end Behavioral; 