library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity placa_mae is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           pin : in STD_LOGIC_VECTOR (7 downto 0);
           pout : out STD_LOGIC_VECTOR (7 downto 0)
    );
end entity placa_mae;

architecture Behavioral of placa_mae is

component processador 
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           pin : in STD_LOGIC_VECTOR (7 downto 0);
           opcode : in STD_LOGIC_VECTOR (4 downto 0);
           sel_reg1 : in STD_LOGIC_VECTOR (2 downto 0);
           sel_reg2 : in STD_LOGIC_VECTOR (2 downto 0);
           constante_in : in STD_LOGIC_VECTOR (7 downto 0);
           dados_m : in STD_LOGIC_VECTOR (7 downto 0);
           constante_out : out STD_LOGIC_VECTOR (7 downto 0);
           pout : out STD_LOGIC_VECTOR (7 downto 0);
           endereco : out STD_LOGIC_VECTOR (7 downto 0);
           operando1 : out STD_LOGIC_VECTOR (7 downto 0);
           wr : out STD_LOGIC
    );
end component;

component memoria_dados
    port ( clk : in STD_LOGIC;
           wr : in STD_LOGIC;
           constante : in STD_LOGIC_VECTOR (7 downto 0);
           operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           dados_m : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

component memoria_instrucoes
    port ( endereco : in STD_LOGIC_VECTOR (7 downto 0);
           opcode : out STD_LOGIC_VECTOR (4 downto 0);
           sel_reg1 : out STD_LOGIC_VECTOR (2 downto 0);
           sel_reg2 : out STD_LOGIC_VECTOR (2 downto 0);
           constante : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

signal endereco : STD_LOGIC_VECTOR (7 downto 0);
signal operando1 : STD_LOGIC_VECTOR (7 downto 0);
signal opcode_sig : STD_LOGIC_VECTOR (4 downto 0);
signal sel_reg1_sig : STD_LOGIC_VECTOR (2 downto 0);
signal sel_reg2_sig : STD_LOGIC_VECTOR (2 downto 0);
signal constante_in : STD_LOGIC_VECTOR (7 downto 0);
signal constante_out : STD_LOGIC_VECTOR (7 downto 0);
signal dados_m_sig : STD_LOGIC_VECTOR (7 downto 0);
signal wr_sig : STD_LOGIC;

begin

process_pm: processador port map (reset, clk, pin, opcode_sig, sel_reg1_sig, sel_reg2_sig, constante_in, dados_m_sig, constante_out, pout, endereco, operando1, wr_sig);
memory_dados: memoria_dados port map (clk, wr_sig, constante_out, operando1, dados_m_sig); 
memory_instructions: memoria_instrucoes port map (endereco, opcode_sig, sel_reg1_sig, sel_reg2_sig, constante_in);  

end Behavioral;  
