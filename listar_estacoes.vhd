LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity listar_estacoes is
	port
	(
		clk : IN std_logic;
		estacao_am_1 : IN integer range 0 to 1600;
		estacao_am_2 : IN integer range 0 to 1600;
		estacao_fm_1 : IN integer range 0 to 1600;
		estacao_fm_2 : IN integer range 0 to 1600;
		tempo_pressionado : IN std_logic; --Tempo pressionado '0' -> OK
		modo : IN std_logic;
		estacao_selecionada : OUT integer range 0 to 1600
	);
end listar_estacoes;

architecture listagem of listar_estacoes is
	signal cont : integer range 0 to 2 := 0;
	signal clk2Hz : std_logic;
	signal sel : integer range 0 to 1600;
begin
	clock_div_map : entity work.divisor_clock PORT MAP(clk => clk, clock => clk2Hz);
	
	process(clk2Hz) is
	begin
		if rising_edge(clk2Hz) AND tempo_pressionado = '0' then		
			if(modo = '0') then -- AM
				if(cont = 0) then				
					sel <= estacao_am_1;
					cont <= 1;					
				elsif (cont = 1) then				
					sel <= estacao_am_2;
					cont <= 0;			
				end if;
			else --FM
				if(cont = 0) then
					sel <= estacao_fm_1;
					cont <= 1;					
				elsif (cont = 1) then
					sel <= estacao_fm_2;
					cont <= 0;					
				end if;
			end if;		
		end if;
	end process;
	
	estacao_selecionada <= sel;
end listagem;