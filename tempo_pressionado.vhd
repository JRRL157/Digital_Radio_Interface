LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tempo_pressionado IS
	PORT(
		clk : IN std_logic;
		btn1 : IN std_logic;
		btn2 : IN std_logic;
		res : OUT std_logic;
		led_cont : OUT std_logic
	);
END tempo_pressionado;

ARCHITECTURE tempo OF tempo_pressionado IS
	SIGNAL contador : integer := 0;
	SIGNAL resposta : std_logic := '0';
BEGIN
	
	process(clk) is
	begin
		IF (rising_edge(clk)) THEN
			IF (btn1 = '0' AND btn2 = '0') THEN
				contador <= contador + 1;
			ELSE
				contador <= 0;
			END IF;
		END IF;		
		
		IF (contador >= 100_000_000) THEN
			resposta <= '0';
		ELSE
			resposta <= '1';
		END IF;
	END PROCESS;

	res <= resposta;

END tempo;