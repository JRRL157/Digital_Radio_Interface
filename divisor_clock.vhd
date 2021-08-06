LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY divisor_clock IS
	PORT(
		clk : IN std_logic;
		clock : OUT std_logic
	);
END divisor_clock;

ARCHITECTURE divisao OF divisor_clock IS
	SIGNAL cont : integer := 0;
	SIGNAL saida : std_logic := '0';
	SIGNAL N : integer := 10;
BEGIN
	PROCESS(clk) is
	begin
		IF rising_edge(clk) THEN
			IF (cont < N/2) THEN
				cont <= cont + 1;
				saida <= '0';
			ELSIF cont >= N/2 AND cont < N THEN
				cont <= (cont + 1) MOD N;
				saida <= '1';				
			END IF;
		END IF;
	END PROCESS;
	
	clock <= saida;
	
END divisao;