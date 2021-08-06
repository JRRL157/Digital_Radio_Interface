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
-- Generated on "08/05/2021 19:54:42"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          divisor_clock
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY divisor_clock_vhd_vec_tst IS
END divisor_clock_vhd_vec_tst;
ARCHITECTURE divisor_clock_arch OF divisor_clock_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL N : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT divisor_clock
	PORT (
	clk : IN STD_LOGIC;
	clock : OUT STD_LOGIC;
	N : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : divisor_clock
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clock => clock,
	N => N
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 1000 ps;
	clk <= '1';
	WAIT FOR 1000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- N[31]
t_prcs_N_31: PROCESS
BEGIN
	N(31) <= '0';
WAIT;
END PROCESS t_prcs_N_31;
-- N[30]
t_prcs_N_30: PROCESS
BEGIN
	N(30) <= '0';
WAIT;
END PROCESS t_prcs_N_30;
-- N[29]
t_prcs_N_29: PROCESS
BEGIN
	N(29) <= '0';
WAIT;
END PROCESS t_prcs_N_29;
-- N[28]
t_prcs_N_28: PROCESS
BEGIN
	N(28) <= '0';
WAIT;
END PROCESS t_prcs_N_28;
-- N[27]
t_prcs_N_27: PROCESS
BEGIN
	N(27) <= '0';
WAIT;
END PROCESS t_prcs_N_27;
-- N[26]
t_prcs_N_26: PROCESS
BEGIN
	N(26) <= '0';
WAIT;
END PROCESS t_prcs_N_26;
-- N[25]
t_prcs_N_25: PROCESS
BEGIN
	N(25) <= '0';
WAIT;
END PROCESS t_prcs_N_25;
-- N[24]
t_prcs_N_24: PROCESS
BEGIN
	N(24) <= '0';
WAIT;
END PROCESS t_prcs_N_24;
-- N[23]
t_prcs_N_23: PROCESS
BEGIN
	N(23) <= '0';
WAIT;
END PROCESS t_prcs_N_23;
-- N[22]
t_prcs_N_22: PROCESS
BEGIN
	N(22) <= '0';
WAIT;
END PROCESS t_prcs_N_22;
-- N[21]
t_prcs_N_21: PROCESS
BEGIN
	N(21) <= '0';
WAIT;
END PROCESS t_prcs_N_21;
-- N[20]
t_prcs_N_20: PROCESS
BEGIN
	N(20) <= '0';
WAIT;
END PROCESS t_prcs_N_20;
-- N[19]
t_prcs_N_19: PROCESS
BEGIN
	N(19) <= '0';
WAIT;
END PROCESS t_prcs_N_19;
-- N[18]
t_prcs_N_18: PROCESS
BEGIN
	N(18) <= '0';
WAIT;
END PROCESS t_prcs_N_18;
-- N[17]
t_prcs_N_17: PROCESS
BEGIN
	N(17) <= '0';
WAIT;
END PROCESS t_prcs_N_17;
-- N[16]
t_prcs_N_16: PROCESS
BEGIN
	N(16) <= '0';
WAIT;
END PROCESS t_prcs_N_16;
-- N[15]
t_prcs_N_15: PROCESS
BEGIN
	N(15) <= '0';
WAIT;
END PROCESS t_prcs_N_15;
-- N[14]
t_prcs_N_14: PROCESS
BEGIN
	N(14) <= '0';
WAIT;
END PROCESS t_prcs_N_14;
-- N[13]
t_prcs_N_13: PROCESS
BEGIN
	N(13) <= '0';
WAIT;
END PROCESS t_prcs_N_13;
-- N[12]
t_prcs_N_12: PROCESS
BEGIN
	N(12) <= '0';
WAIT;
END PROCESS t_prcs_N_12;
-- N[11]
t_prcs_N_11: PROCESS
BEGIN
	N(11) <= '0';
WAIT;
END PROCESS t_prcs_N_11;
-- N[10]
t_prcs_N_10: PROCESS
BEGIN
	N(10) <= '0';
WAIT;
END PROCESS t_prcs_N_10;
-- N[9]
t_prcs_N_9: PROCESS
BEGIN
	N(9) <= '0';
WAIT;
END PROCESS t_prcs_N_9;
-- N[8]
t_prcs_N_8: PROCESS
BEGIN
	N(8) <= '0';
WAIT;
END PROCESS t_prcs_N_8;
-- N[7]
t_prcs_N_7: PROCESS
BEGIN
	N(7) <= '0';
WAIT;
END PROCESS t_prcs_N_7;
-- N[6]
t_prcs_N_6: PROCESS
BEGIN
	N(6) <= '0';
WAIT;
END PROCESS t_prcs_N_6;
-- N[5]
t_prcs_N_5: PROCESS
BEGIN
	N(5) <= '0';
WAIT;
END PROCESS t_prcs_N_5;
-- N[4]
t_prcs_N_4: PROCESS
BEGIN
	N(4) <= '0';
WAIT;
END PROCESS t_prcs_N_4;
-- N[3]
t_prcs_N_3: PROCESS
BEGIN
	N(3) <= '0';
WAIT;
END PROCESS t_prcs_N_3;
-- N[2]
t_prcs_N_2: PROCESS
BEGIN
	N(2) <= '0';
WAIT;
END PROCESS t_prcs_N_2;
-- N[1]
t_prcs_N_1: PROCESS
BEGIN
	N(1) <= '0';
WAIT;
END PROCESS t_prcs_N_1;
-- N[0]
t_prcs_N_0: PROCESS
BEGIN
	N(0) <= '0';
WAIT;
END PROCESS t_prcs_N_0;
END divisor_clock_arch;
