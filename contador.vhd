LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

--B3 e B4 são CHAVES, devem ser tratadas antes de mandar para cá

ENTITY contador IS
	PORT(
		clk : IN std_logic; --Clock de 50Mhz
		b3 : IN std_logic; --Decrescente
		b4 : IN std_logic; --Crescente
		s1 : IN std_logic; --AM/FM
		enable : IN std_logic;
		estacao : OUT integer --Número da estação
	);	
END contador;

ARCHITECTURE contando OF contador is
	SIGNAL freq : std_logic;
	SIGNAL contador_am : integer := 540;
	SIGNAL contador_fm : integer := 875;
BEGIN
	clock2Hz : entity work.divisor_clock PORT MAP(clk => clk, clock => freq);		
	
	PROCESS(freq) IS
	BEGIN
		IF rising_edge(freq) AND enable = '1' THEN
			IF s1 = '0' THEN --AM								
				IF (B3 = '0') THEN --Decrescente
					IF (contador_am = 540) THEN
						contador_am <= 1600;
					ELSE
						contador_am <= contador_am - 10;
					END IF;
				ELSIF (B4 = '0') THEN-- Crescente
					IF(contador_am = 1600) THEN
						contador_am <= 540;
					ELSE
						contador_am <= contador_am + 10;
					END IF;
				END IF;
			ELSE --FM
				IF (B3 = '0') THEN --Decrescente
					IF(contador_fm = 875) THEN
						contador_fm <= 1080;
					ELSE
						contador_fm <= contador_fm - 5;
					END IF;
				ELSIF (B4 = '0') THEN --Crescente
					IF(contador_fm = 1080) THEN
						contador_fm <= 875;
					ELSE
						contador_fm <= contador_fm + 5;
					END IF;
				END IF;
			END IF;
		END IF;
	
		IF (s1 = '0') THEN
			estacao <= contador_am;
		ELSE
			estacao <= contador_fm;
		END IF;
		
	END PROCESS;
END contando;
