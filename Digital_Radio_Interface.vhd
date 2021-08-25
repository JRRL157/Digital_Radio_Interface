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
		
		--estacao_saida : OUT std_logic_vector(11 DOWNTO 0);
		RS,RW			  : OUT bit;
		E				  : OUT bit;
		DB				  : OUT bit_vector(7 DOWNTO 0);
		
		led1,led2,led3,led4 : OUT std_logic
	);

END Digital_Radio_Interface;

ARCHITECTURE main OF Digital_Radio_Interface IS
	--OBS.: O motivo de ficar dando um número de elementos lógicos muito alto era devido
	-- à falta do range bem definido, quando vimos no RTL Viewer, o Quartus gerava um número
	-- alto demais!
	
	SIGNAL aux4,aux3,aux2,aux1 : integer range 0 to 9;
	SIGNAL estacao_variable : integer range 540 to 1600 := 875;
	
	SIGNAL estacao_variable_cont : integer range 540 to 1600; --Modo de contagem
	SIGNAL estacao_variable_list : integer range 540 to 1600; --Modo de listagem
	
	--Variáveis extras para a conversão
	SIGNAL estacao_variable2 : integer range 0 to 160;
	SIGNAL estacao_variable3 : integer range 0 to 16;
	SIGNAL estacao_variable4 : integer range 0 to 1;
	
	
	--Habilita o crescer/decrescer do modo rádio
	SIGNAL ena : std_logic;
	
	signal b3_d,b4_d : std_logic;
	signal chave_b3,chave_b4 : std_logic;
	
	--Variáveis que irão para o LCD
	SIGNAL D5,D4,D3,D2,D1 : bit_vector(7 DOWNTO 0);
	SIGNAL S1_Freq : bit_vector(7 DOWNTO 0) := X"4D";
	SIGNAL S1_Modo : bit_vector(7 DOWNTO 0) := X"46";	
	SIGNAL M1,M2,M3,M4,M5 : bit_vector(7 DOWNTO 0);
	
	--Variáveis que sairão do LCD
	SIGNAL RS_x,Rw_x : bit;
	SIGNAL E_x : bit;
	SIGNAL DB_x : bit_vector(7 DOWNTO 0);
	
	--Guarda as estações
	SIGNAL AM_Slot1,AM_Slot2 : integer range 0 to 1600;
	SIGNAL FM_Slot1,FM_Slot2 : integer range 0 to 1600;
	
	--Verifica se os botões b3_d e b4_d foram pressionados por 2s ou mais
	SIGNAL time_pressed : std_logic;
	
	SIGNAL saiu : std_logic := '0';
	
BEGIN	
	debounce_b3 : entity work.debounce PORT MAP(clk => clk, button => b3,result => b3_d);
	debounce_b4 : entity work.debounce PORT MAP(clk => clk, button => b4,result => b4_d);
	
	chave_chave_b3 : entity work.btn_key PORT MAP(btn => b3_d, key => chave_b3);
	chave_chave_b4 : entity work.btn_key PORT MAP(btn => b4_d, key => chave_b4);
	
	--Testando o aperto do botão no LED
	led1 <= chave_b3;
	led2 <= chave_b4;
			
	ena <= (s2) AND (chave_b3 XOR chave_b4);
		
	led3 <= NOT ena;

	--Listando as estações favoritas quando b3_d e b4_d estão pressionados por 2s ou mais
	tempo_pressionado_port : entity work.tempo_pressionado PORT MAP(clk => clk, btn1 => b3_d,btn2 => b4_d,res =>time_pressed);
	
	led4 <= time_pressed;
	
	listagem_port : entity work.listar_estacoes PORT MAP(clk => clk,estacao_am_1 => AM_Slot1,estacao_am_2 => AM_Slot2,
																		 estacao_fm_1 => FM_Slot1,estacao_fm_2 => FM_Slot2,tempo_pressionado => time_pressed,
																		 modo => s1, estacao_selecionada => estacao_variable_list);
	
	
	--cont : entity work.contador PORT MAP(clk => clk, s1 => s1, b3 => chave_b3,b4 => chave_b4,estacao => estacao_variable_cont,enable => ena);
	cont : entity work.contador2 PORT MAP(clk => clk, s1 => s1, b3 => chave_b3,b4 => chave_b4,estacao_fav => estacao_variable_list,tempo_pressionado => time_pressed,enable => ena,estacao => estacao_variable);
	
	--Gravando as estações favoritas em variáveis
	process(s2,s1,estacao_variable) is
	begin		
		if s2 = '0' then --Modo de gravação
			if (s1 = '0') then --AM
				if (b3_d = '0') then --B3 pressionado
					AM_Slot1 <= estacao_variable;
				elsif(b4_d = '0') then --B4 pressionado
					AM_Slot2 <= estacao_variable;
				end if;
			else --FM
				if (b3_d = '0') then --B3 pressionado
					FM_Slot1 <= estacao_variable;
				elsif (b4_d = '0') then --B4 pressionado
					FM_Slot2 <= estacao_variable;
				end if;
			end if;
		end if;
	end process;
	
	--estacao_saida <= std_logic_vector(to_unsigned(estacao_variable,estacao_saida'length));	
	
	
	
	--Extraindo os dígitos do estacao_saida	
	process(estacao_variable,aux4) is
	begin					
		aux4 <= estacao_variable MOD 10;		
	end process;
	
	process(aux4,estacao_variable,estacao_variable2) is
	begin
		estacao_variable2 <= (estacao_variable - aux4)/10;
		aux3 <= estacao_variable2 MOD 10;
	end process;
	
	process(aux3,estacao_variable2,estacao_variable3) is
	begin
		estacao_variable3 <= (estacao_variable2 - aux3)/10;
		aux2 <= estacao_variable3 MOD 10;
	end process;
	
	process(aux2,estacao_variable3,estacao_variable4) is
	begin
		estacao_variable4 <= (estacao_variable3 - aux2)/10;
		aux1 <= estacao_variable4 MOD 10;	
	end process;
	
	--Tratando os dados antes de enviar ao LCD
	process(aux4) is
	begin
		if s1 = '0' then --AM
			case aux4 is
				when 0 => D4 <= X"30";
				when 1 => D4 <= X"31";
				when 2 => D4 <= X"32";
				when 3 => D4 <= X"33";
				when 4 => D4 <= X"34";
				when 5 => D4 <= X"35";
				when 6 => D4 <= X"36";
				when 7 => D4 <= X"37";
				when 8 => D4 <= X"38";
				when 9 => D4 <= X"39";
				when others => D4 <= X"40";
			end case;
			D5 <= "00100000";
		else
			case aux4 is
				when 0 => D5 <= X"30";
				when 1 => D5 <= X"31";
				when 2 => D5 <= X"32";
				when 3 => D5 <= X"33";
				when 4 => D5 <= X"34";
				when 5 => D5 <= X"35";
				when 6 => D5 <= X"36";
				when 7 => D5 <= X"37";
				when 8 => D5 <= X"38";
				when 9 => D5 <= X"39";
				when others => D4 <= X"40";				
			end case;
			D4 <= X"2E";
		end if;
	end process;
	
	process(aux3) is
	begin
		case aux3 is
			when 0 => D3 <= X"30";
			when 1 => D3 <= X"31";
			when 2 => D3 <= X"32";
			when 3 => D3 <= X"33";
			when 4 => D3 <= X"34";
			when 5 => D3 <= X"35";
			when 6 => D3 <= X"36";
			when 7 => D3 <= X"37";
			when 8 => D3 <= X"38";
			when 9 => D3 <= X"39";
			when others => D3 <= X"40";
		end case;
	end process;
	
	process(aux2) is
	begin
		case aux2 is
			when 0 => D2 <= X"30";
			when 1 => D2 <= X"31";
			when 2 => D2 <= X"32";
			when 3 => D2 <= X"33";
			when 4 => D2 <= X"34";
			when 5 => D2 <= X"35";
			when 6 => D2 <= X"36";
			when 7 => D2 <= X"37";
			when 8 => D2 <= X"38";
			when 9 => D2 <= X"39";
			when others => D2 <= X"40";
		end case;
	end process;
	
	process(aux1) is
	begin
		case aux1 is
			when 0 => D1 <= X"30";
			when 1 => D1 <= X"31";
			when 2 => D1 <= X"32";
			when 3 => D1 <= X"33";
			when 4 => D1 <= X"34";
			when 5 => D1 <= X"35";
			when 6 => D1 <= X"36";
			when 7 => D1 <= X"37";
			when 8 => D1 <= X"38";
			when 9 => D1 <= X"39";
			when others => D1 <= X"40";
		end case;
	end process;
	
	process(s1) is
	begin
		IF (s1 = '0') THEN --AM
			S1_Modo <= X"41";
			S1_Freq <= X"4B";			
		ELSE
			S1_Modo <= X"46";
			S1_Freq <= X"4D";						
		END IF;
	end process;
	
	process(s2) is
	begin
		IF(s2 = '0') THEN --Chave para cima, Modo gravação
			M1 <= X"47"; --G
			M2 <= X"52"; --R
			M3 <= X"41"; --A
			M4 <= X"56"; --V
			M5 <= X"2E"; --.
		ELSE
			M1 <= X"52"; --R
			M2 <= X"41"; --A
			M3 <= X"44"; --D
			M4 <= X"49"; --I
			M5 <= X"4F"; --O
		END IF;
	end process;
	
	--Mandando para o LCD
	lcd_map : entity work.lcd(hardware) PORT MAP(clk => to_bit(clk), D1 => D1, D2 => D2,D3 => D3,D4 => D4,D5 => D5,
	M1 => M1, M2 => M2, M3 => M3, M4 => M4, M5 => M5,S1_Modo => S1_Modo,S1_Freq => S1_Freq,E => E_x,RS => RS_x,RW => RW_x,DB => DB_x);
	
	--Mandando para a saída
	RS <= RS_x;
	RW <= RW_x;
	E <= E_x;
	DB <= DB_x;
	
END main;