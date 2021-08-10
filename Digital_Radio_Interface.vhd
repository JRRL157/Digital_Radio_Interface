LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Digital_Radio_Interface IS
	PORT(
		clk : IN std_logic; --50Mhz
		s1 : IN std_logic; --AM/FM
		s2 : IN std_logic; --Gravação
		b3 : IN std_logic; --Decrescente
		b4 : IN std_logic; --Crescente
		
		D1 : OUT std_logic_vector(3 DOWNTO 0);
		D2 : OUT std_logic_vector(3 DOWNTO 0);
		D3 : OUT std_logic_vector(3 DOWNTO 0);
		D4 : OUT std_logic_vector(3 DOWNTO 0);
		
		estacao_saida : OUT std_logic_vector(11 DOWNTO 0)
	);

END Digital_Radio_Interface;

ARCHITECTURE main OF Digital_Radio_Interface IS
	SIGNAL estacao_variable : integer;
	SIGNAL estacao_variable2 : integer;
	SIGNAL estacao_variable3 : integer;
	SIGNAL estacao_variable4 : integer;
	SIGNAL ena : std_logic;
	SIGNAL aux1,aux2,aux3,aux4 : integer;
	
	signal b3_d,b4_d : std_logic;
	signal chave_b3,chave_b4 : std_logic;
BEGIN	
	debounce_b3 : entity work.debounce PORT MAP(clk => clk, button => b3_d);
	debounce_b4 : entity work.debounce PORT MAP(clk => clk, button => b4_d);
	
	--chave_b3 : entity work.btn_key PORT MAP(btn => b3_d, key => chave_b3);
	--chave_b4 : entity work.btn_key PORT MAP(btn => b4_d, key => chave_b4);
	
	ena <= (s2) AND (b3 XOR b4);
	
	cont : entity work.contador PORT MAP(clk => clk, s1 => s1, b3 => b3,b4 => b4,estacao => estacao_variable,enable => ena);
	
	estacao_saida <= std_logic_vector(to_unsigned(estacao_variable,estacao_saida'length));

	aux4 <= estacao_variable MOD 10;
	--D4 <= std_logic_vector(to_unsigned(aux4,D4'length));
	
	estacao_variable2 <= (estacao_variable - aux4)/10;
	aux3 <= estacao_variable2 MOD 10;
	--D3 <= std_logic_vector(to_unsigned(aux3,D3'length));
	
	estacao_variable3 <= (estacao_variable2 - aux3)/10;
	aux2 <= estacao_variable3 MOD 10;
	--D2 <= std_logic_vector(to_unsigned(aux2,D2'length));
	
	estacao_variable4 <= (estacao_variable3 - aux2)/10;
	aux1 <= estacao_variable4 MOD 10;
	--D1 <= std_logic_vector(to_unsigned(aux1,D1'length));

	
END main;