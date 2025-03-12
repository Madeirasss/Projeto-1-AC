library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processador is
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
           wr : out STD_LOGIC);
end entity processador;

architecture Behavioral of processador is

component gestor_perifericos 
    Port ( pin : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           escr_p : in STD_LOGIC;
           dados_in : out STD_LOGIC_VECTOR (7 downto 0);
           pout : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

component registo_flags
    Port ( clk : in STD_LOGIC;
           sel_f : in STD_LOGIC_VECTOR (2 downto 0);
           escr_f : in STD_LOGIC;
           comp_flag : in STD_LOGIC_VECTOR (4 downto 0);
           s_flag : out STD_LOGIC
    );
end component;

component mux_pc
    Port ( zero : in std_logic;
           um : in std_logic;
           s_flag : in STD_LOGIC;
           operando1_7 : in STD_LOGIC;
           operando1_nor : in std_logic;
           sel_pc : in STD_LOGIC_VECTOR (2 downto 0);
           escr_pc : out STD_LOGIC
    );
end component;

component alu 
    Port ( sel_alu : in STD_LOGIC_VECTOR (3 downto 0);
           operando1 : in STD_LOGIC_VECTOR (7 downto 0);
           operando2 : in STD_LOGIC_VECTOR (7 downto 0);
           resultado : out STD_LOGIC_VECTOR (7 downto 0);
           comp_flag : out STD_LOGIC_VECTOR (4 downto 0)
    );
end component;

component banco_registos
    Port ( clk : in STD_LOGIC;
           escr_r : in STD_LOGIC;
           sel_reg1 : in STD_LOGIC_VECTOR (2 downto 0);
           sel_reg2 : in STD_LOGIC_VECTOR (2 downto 0); 
           dados_r : in STD_LOGIC_VECTOR (7 downto 0);
           operando1 : out STD_LOGIC_VECTOR (7 downto 0);
           operando2 : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

component mux_r
    Port ( resultado : in STD_LOGIC_VECTOR (7 downto 0);
           dados_in : in STD_LOGIC_VECTOR (7 downto 0);
           dados_m : in STD_LOGIC_VECTOR (7 downto 0);
           constante_in : in STD_LOGIC_VECTOR (7 downto 0);
           sel_r : in STD_LOGIC_VECTOR (1 downto 0);
           dados_r : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

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

component pc
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           constante_in : in STD_LOGIC_VECTOR (7 downto 0);
           escr_pc : in STD_LOGIC;
           endereco : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

component Operando1_PORTANOR is
    Port ( Operando1_0: in std_logic;
    Operando1_1: in std_logic;
    Operando1_2: in std_logic;
    Operando1_3: in std_logic;
    Operando1_4: in std_logic;
    Operando1_5: in std_logic;
    Operando1_6: in std_logic;
    Operando1_7: in std_logic;
    Operando1_NOR: out std_logic);

end component;

signal dados_m_sig : STD_LOGIC_VECTOR (7 downto 0);
signal escr_p : STD_LOGIC;
signal escr_r_sig : STD_LOGIC;
signal escr_f_sig : STD_LOGIC;  
signal escr_pc_sig : STD_LOGIC;
signal s_flag_sig : STD_LOGIC;
signal sel_f_sig : STD_LOGIC_VECTOR (2 downto 0);
signal sel_pc_sig : STD_LOGIC_VECTOR (2 downto 0);
signal sel_alu_sig : STD_LOGIC_VECTOR (3 downto 0);
signal sel_r_sig : STD_LOGIC_VECTOR (1 downto 0);
signal operando2 : STD_LOGIC_VECTOR (7 downto 0);
signal resultado_sig : STD_LOGIC_VECTOR (7 downto 0);
signal dados_r : STD_LOGIC_VECTOR (7 downto 0);
signal dados_in_sig : STD_LOGIC_VECTOR (7 downto 0);
signal comp_flag_sig : STD_LOGIC_VECTOR (4 downto 0);
signal operando1_processador : STD_LOGIC_VECTOR (7 downto 0);
signal operando1_norr : STD_LOGIC;

begin  
 
peripheral_manager : gestor_perifericos port map (pin, clk, operando1_processador, escr_p, dados_in_sig, pout);  
register_flags : registo_flags port map (clk, sel_f_sig, escr_f_sig, comp_flag_sig, s_flag_sig);
multiplexer_pc : mux_pc port map ('0', '1', s_flag_sig, operando1_processador(7), operando1_norr, sel_pc_sig, escr_pc_sig); 
unit_alu : alu port map (sel_alu_sig, operando1_processador, operando2, resultado_sig, comp_flag_sig);
bank_register: banco_registos port map (clk, escr_r_sig, sel_reg1, sel_reg2, dados_r, operando1_processador, operando2); 
multiplexer_r : mux_r port map (resultado_sig, dados_in_sig, dados_m_sig, constante_in, sel_r_sig, dados_r);
memory_rom : rom_decod port map (opcode, wr, escr_p, sel_r_sig, escr_r_sig, sel_alu_sig, escr_f_sig, sel_f_sig, sel_pc_sig);
pc_counter : pc port map (clk, reset, constante_in, escr_pc_sig, endereco);
operando1_nor : Operando1_PORTANOR port map (operando1_processador(0), operando1_processador(1), operando1_processador(2), operando1_processador(3), operando1_processador(4), operando1_processador(5), operando1_processador(6), operando1_processador(7),  operando1_norr);
  
constante_out <= constante_in;      
operando1 <= operando1_processador;  

end Behavioral; 
