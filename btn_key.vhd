LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY btn_key IS
	PORT(
		btn : IN std_logic;
		key : OUT std_logic
	);
END btn_key;

ARCHITECTURE hardware OF btn_key IS
	SIGNAL cont : integer := 0;
BEGIN
	process(btn) is
	begin
		IF rising_edge(btn) THEN	
			IF cont = 0 THEN
				cont <= cont + 1;
				key <= '1';
			ELSIF cont = 1 THEN
				key <= '0';
				cont <= 0;
			END IF;			
		END IF;
	end process;
END hardware;