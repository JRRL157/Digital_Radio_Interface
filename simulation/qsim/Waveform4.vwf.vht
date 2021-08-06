-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "08/05/2021 21:44:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          contador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY contador_vhd_vec_tst IS
END contador_vhd_vec_tst;
ARCHITECTURE contador_arch OF contador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL b3 : STD_LOGIC;
SIGNAL b4 : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL estacao : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL s1 : STD_LOGIC;
COMPONENT contador
	PORT (
	b3 : IN STD_LOGIC;
	b4 : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	estacao : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	s1 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : contador
	PORT MAP (
-- list connections between master ports and signals
	b3 => b3,
	b4 => b4,
	clk => clk,
	estacao => estacao,
	s1 => s1
	);

-- b3
t_prcs_b3: PROCESS
BEGIN
	b3 <= '1';
	WAIT FOR 5000 ps;
	FOR i IN 1 TO 16
	LOOP
		b3 <= '0';
		WAIT FOR 30000 ps;
		b3 <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	b3 <= '0';
	WAIT FOR 30000 ps;
	b3 <= '1';
WAIT;
END PROCESS t_prcs_b3;

-- b4
t_prcs_b4: PROCESS
BEGIN
	b4 <= '0';
	WAIT FOR 5000 ps;
	FOR i IN 1 TO 16
	LOOP
		b4 <= '1';
		WAIT FOR 30000 ps;
		b4 <= '0';
		WAIT FOR 30000 ps;
	END LOOP;
	b4 <= '1';
	WAIT FOR 30000 ps;
	b4 <= '0';
WAIT;
END PROCESS t_prcs_b4;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 250 ps;
	clk <= '1';
	WAIT FOR 250 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- s1
t_prcs_s1: PROCESS
BEGIN
	s1 <= '1';
	WAIT FOR 5000 ps;
	s1 <= '0';
	WAIT FOR 300000 ps;
	s1 <= '1';
	WAIT FOR 300000 ps;
	s1 <= '0';
	WAIT FOR 300000 ps;
	s1 <= '1';
WAIT;
END PROCESS t_prcs_s1;
END contador_arch;
