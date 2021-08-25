--
-- Curso de FPGA WR Kits Channel
--
--
-- Aula 80: Utilizando o Display LCD do Kit EE03 
--                            
--
-- Kits Sugeridos:
--
-- Kit FPGA EE02-SOQ
--
-- Adquira em http://www.professoremersonmartins.com.br/site/prtoducts/KIT-FPGA-%252d-EE02-%252d-SOQ.html
--
--
-- Kit FPGA EE03
--
-- Adquira em http://www.professoremersonmartins.com.br/site/products/KIT-FPGA-%252d-EE03.html
--
--
-- Autor: Eng. Wagner Rambo     Data: Dezembro de 2016
--
-- www.wrkits.com.br | facebook.com/wrkits | youtube.com/user/canalwrkits
--
	entity lcd is
	generic (fclk: natural := 50_000_000); -- 50MHz , cristal do kit EE03
	port (
			 --Variáveis que são passadas pelo main
			 D1,D2,D3,D4,D5 	 : IN bit_vector(7 DOWNTO 0);
			 M1,M2,M3,M4,M5 : IN bit_vector(7 DOWNTO 0);
			 S1_Freq 		 : IN bit_vector(7 DOWNTO 0);
			 S1_Modo			 : IN bit_vector(7 DOWNTO 0);
			 
			 clk         :     in bit; 
			 RS, RW      :    out bit;
			 E           : buffer bit;  
			 DB          :    out bit_vector(7 downto 0));
	end lcd;

	architecture hardware of lcd is
		type state is (FunctionSetl, FunctionSet2, FunctionSet3,
		 FunctionSet4,FunctionSet5,FunctionSet6,FunctionSet7,FunctionSet8,FunctionSet9,FunctionSet10,FunctionSet11,FunctionSet12,
		 FunctionSet13,FunctionSet14,FunctionSet15,FunctionSet16,FunctionSet17,FunctionSet18,FunctionSet19, FunctionSet20, FunctionSet21, FunctionSet22,
		 FunctionSet23,FunctionSet24,FunctionSet25,FunctionSet26,FunctionSet27,ClearDisplay, DisplayControl, EntryMode, 
		 WriteDatal, WriteData2, WriteData3, WriteData4, WriteData5,WriteData6,WriteData7,WriteData8,WriteData9,WriteData10,WriteData11,
		 WriteData12,WriteData13,WriteData14,WriteData15,WriteData16,WriteData17,WriteData18,WriteData19, WriteData20, WriteData21, WriteData22,
		 WriteData23,WriteData24,WriteData25,WriteData26,WriteData27,WriteData28,SetAddress,SetAddress1, ReturnHome);
		
		signal pr_state, nx_state: state; 
		begin
		
---—Clock generator (E->500Hz) :---------
		process (clk)
		variable count: natural range 0 to fclk/1000; 
		begin
			if (clk' event and clk = '1') then 
				count := count + 1;
				if (count=fclk/1000) then 
				 E <= not E; 
				 count := 0; 
				end if; 
			end if; 
		end process;
		
-----Lower section of FSM:---------------
		process (E) 
		begin
			if (E' event and E = '1') then 
			--	IF (rst= '0') THEN
				pr_state <= FunctionSetl; 
		--ELSE
		pr_state <= nx_state; 
		--END IF; 
		end if; 
		end process;
		
-----Upper section of FSX:---------------
		process (pr_state) 
		begin
			case pr_state is

			when FunctionSetl => 
			RS<= '0'; RW<= '0'; 
			DB<= "00111000"; 
			nx_state <= FunctionSet2; 
			
			when FunctionSet2 => 
			RS<= '0'; RW<= '0'; 
			DB <= "00111000";
			nx_state <= FunctionSet3; 
			
			when FunctionSet3 => 
			RS <= '0'; RW<='0'; 
			DB <= "00111000"; 
			nx_state <= FunctionSet4;

			when   FunctionSet4   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet5;

			when   FunctionSet5   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet6;

			when   FunctionSet6   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet7;

			when   FunctionSet7   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet8;

			when   FunctionSet8   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet9;

			when   FunctionSet9   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet10;

			when   FunctionSet10   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet11;

			when   FunctionSet11   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet12;

			when   FunctionSet12   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet13;

			when   FunctionSet13   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet14;

			when   FunctionSet14   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet15;

			when   FunctionSet15   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet16;

			when   FunctionSet16   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet17;

			when   FunctionSet17   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet18;

			when   FunctionSet18   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet19;
			
			when   FunctionSet19   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet20;

			when   FunctionSet20   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet21;

			when   FunctionSet21   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet22;

			when   FunctionSet22   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet23;

			when   FunctionSet23   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet24;

			when   FunctionSet24   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet25;

			when   FunctionSet25   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet26;

			when   FunctionSet26   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= FunctionSet27;

			when   FunctionSet27   =>
			RS<=  '0'; RW<=  '0';
			DB   <=   "00111000";
			nx_state <= ClearDisplay ;

			when ClearDisplay =>
			RS<= '0'; RW<= '0';
			DB <= "00000001";
			nx_state   <=   DisplayControl; 
			
			when   DisplayControl   =>
			RS<= '0';   RW<=  '0';
			DB   <=  "00001100";
			nx_state <= EntryMode; 
			
			when EntryMode =>
			RS<= '0'; RW<= '0';
			DB <= "00000110";
			nx_state   <=  WriteDatal; 

			when  WriteDatal =>
			RS<=   '1';   RW <='0';
			DB   <=   "00100000";   --'ESCREVE UM ESPAÇO EM BRANDO
			nx_state <= SetAddress1; 

			when SetAddress1 =>
			RS<=   '0';   RW<=   '0';
			DB   <=  "10000010";   --COMANDO PARA POSICIONAR O CURSOR NA LINHA 0 COLUNA 3
			nx_state  <= WriteData2; 
			

			when WriteData2 =>
			RS<= '1'; RW<= '0';
			DB <= X"4D";                    --'M'
			nx_state <= WriteData3; 
			
			when WriteData3 =>
			RS<= '1'; RW<= '0';
			DB <= X"4F";                    --'O'
			nx_state  <= WriteData4; 
			
			when  WriteData4   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  X"44";                 --'D'
			nx_state  <= WriteData5; 

			when  WriteData5   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  X"4F";                 --'O'
			nx_state  <= WriteData6;

			when  WriteData6   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  X"20";                 --' '
			nx_state  <= WriteData7;

			when  WriteData7   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  M1;                 --'R -M1'
			nx_state  <= WriteData8;

			when  WriteData8   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  M2;                 --'A -M2'
			nx_state  <= WriteData9;
			
			when WriteData9 =>
			RS<= '1'; RW<= '0';
			DB <= M3;                    --'D -M3'
			nx_state <= WriteData10; 
			
			when WriteData10 =>
			RS<= '1'; RW<= '0';
			DB <= M4;                    --'I -M4'
			nx_state  <= WriteData11; 
			
			when  WriteData11   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  M5;                 --'O -M5'
			nx_state  <= WriteData12; 

			when  WriteData12   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  X"20";                 --' '
			nx_state  <= WriteData13;

			when  WriteData13   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  S1_Modo;                 --'A - S1'
			nx_state  <= WriteData14;

			when  WriteData14   =>
			RS<=   '1';   RW<=   '0';
			DB   <=  X"4D";                 --'M'
			nx_state  <= SetAddress;
		
			
			
			when SetAddress =>
			RS<=   '0';   RW<=   '0';
			DB   <=  "11000010";   --COMANDO PARA POSICIONAR O CURSOR NA LINHA 1 COLUNA 3
			nx_state  <= WriteData15; 

			when WriteData15 =>
			RS<= '1'; RW<= '0';
			DB <= X"46";                    --'F'
			nx_state <= WriteData16; 

			when WriteData16 =>
			RS<= '1'; RW<= '0';
			DB <= X"52";                    --'R'
			nx_state <= WriteData17; 


			when WriteData17 =>
			RS<= '1'; RW<= '0';
			DB <= X"45";                    --'E'
			nx_state <= WriteData18;

			when WriteData18 =>
			RS<= '1'; RW<= '0';
			DB <= X"51";                    --'Q'
			nx_state <= WriteData19;

			when WriteData19 =>
			RS<= '1'; RW<= '0';
			DB <= X"2E";                    --'.'
			nx_state <= WriteData20;

			when WriteData20 =>
			RS<= '1'; RW<= '0';
			DB <= X"20";                    --' '
			nx_state <= WriteData21;

			when WriteData21 =>
			RS<= '1'; RW<= '0';
			DB <= D1;                    --'5 - D1'
			nx_state <= WriteData22;

			when WriteData22 =>
			RS<= '1'; RW<= '0';
			DB <= D2;                    --'4 - D2'
			nx_state <= WriteData23;

			when WriteData23 =>
			RS<= '1'; RW<= '0';
			DB <= D3;                    --'0 - D3'
			nx_state <= WriteData24;			
			
			when WriteData24 =>
			RS<= '1'; RW<= '0';			
			DB <= D4; 						   --' - D4'			
			nx_state <= WriteData25;
									

			when WriteData25 =>
			RS <= '1'; RW <= '0';
			DB <= D5;
			nx_state <= WriteData26;
									
			when WriteData26 =>
			RS<= '1'; RW<= '0';
			DB <= S1_Freq;                    --'K -S1'
			nx_state <= WriteData27; 
			
			when WriteData27 =>
			RS<= '1'; RW<= '0';
			DB <= X"48";                    --'H'
			nx_state <= WriteData28; 
			
			when WriteData28 =>
			RS<= '1'; RW<= '0';
			DB <= X"7A";                    --'Z'
			nx_state <= ReturnHome; 

			when   ReturnHome   =>
			RS<=   '0';   RW<=  '0';
			DB   <=  "10000000";
			nx_state <= WriteDatal; 
			end case; 
		end process;
		
	end hardware;



















