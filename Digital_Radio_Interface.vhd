LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Digital_Radio_Interface IS
	PORT(
		clk : IN std_logic; --50Mhz
		s1 : IN std_logic; --AM/FM
		s2 : IN std_logic; --Gravação
		b3 : IN std_logic; --Decrescente
		b4 : IN std_logic; --Crescente
		estacao : OUT std_logic_vector(11 DOWNTO 0)
	);

END Digital_Radio_Interface;

ARCHITECTURE main OF Digital_Radio_Interface IS
	SIGNAL estacao_variable : std_logic_vector(11 DOWNTO 0);
BEGIN	
	cont : entity work.contador PORT MAP(clk => clk, s1 => s1, b3 => b3,b4 => b4,estacao => estacao_variable);
	
	estacao <= estacao_variable;
	
END main;