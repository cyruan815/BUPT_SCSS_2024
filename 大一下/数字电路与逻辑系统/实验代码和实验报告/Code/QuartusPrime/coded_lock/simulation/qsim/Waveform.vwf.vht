-- Copyright (C) 2023  Intel Corporation. All rights reserved.
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
-- Generated on "06/08/2025 10:50:23"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          CodeLock
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CodeLock_vhd_vec_tst IS
END CodeLock_vhd_vec_tst;
ARCHITECTURE CodeLock_arch OF CodeLock_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL data_in : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL set_mode : STD_LOGIC;
SIGNAL unlocked : STD_LOGIC;
COMPONENT CodeLock
	PORT (
	clk : IN STD_LOGIC;
	data_in : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	set_mode : IN STD_LOGIC;
	unlocked : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : CodeLock
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	data_in => data_in,
	reset => reset,
	set_mode => set_mode,
	unlocked => unlocked
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- set_mode
t_prcs_set_mode: PROCESS
BEGIN
	set_mode <= '0';
	WAIT FOR 220000 ps;
	set_mode <= '1';
	WAIT FOR 30000 ps;
	set_mode <= '0';
WAIT;
END PROCESS t_prcs_set_mode;

-- data_in
t_prcs_data_in: PROCESS
BEGIN
	data_in <= '0';
	WAIT FOR 10000 ps;
	data_in <= '1';
	WAIT FOR 10000 ps;
	data_in <= '0';
	WAIT FOR 10000 ps;
	data_in <= '1';
	WAIT FOR 10000 ps;
	data_in <= '0';
	WAIT FOR 40000 ps;
	data_in <= '1';
	WAIT FOR 10000 ps;
	data_in <= '0';
	WAIT FOR 40000 ps;
	data_in <= '1';
	WAIT FOR 10000 ps;
	data_in <= '0';
	WAIT FOR 10000 ps;
	data_in <= '1';
	WAIT FOR 10000 ps;
	data_in <= '0';
	WAIT FOR 60000 ps;
	data_in <= '1';
	WAIT FOR 30000 ps;
	data_in <= '0';
	WAIT FOR 20000 ps;
	data_in <= '1';
	WAIT FOR 10000 ps;
	data_in <= '0';
	WAIT FOR 10000 ps;
	data_in <= '1';
	WAIT FOR 10000 ps;
	data_in <= '0';
	WAIT FOR 10000 ps;
	data_in <= '1';
	WAIT FOR 30000 ps;
	data_in <= '0';
WAIT;
END PROCESS t_prcs_data_in;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 110000 ps;
	reset <= '1';
	WAIT FOR 10000 ps;
	reset <= '0';
	WAIT FOR 70000 ps;
	reset <= '1';
	WAIT FOR 10000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END CodeLock_arch;
