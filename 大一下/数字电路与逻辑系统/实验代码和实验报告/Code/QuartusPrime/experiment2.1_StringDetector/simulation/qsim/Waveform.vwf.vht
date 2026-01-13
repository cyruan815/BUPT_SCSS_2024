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
-- Generated on "06/13/2025 09:18:19"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Detector
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Detector_vhd_vec_tst IS
END Detector_vhd_vec_tst;
ARCHITECTURE Detector_arch OF Detector_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL cout : STD_LOGIC;
SIGNAL data : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT Detector
	PORT (
	clk : IN STD_LOGIC;
	cout : OUT STD_LOGIC;
	data : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Detector
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	cout => cout,
	data => data,
	reset => reset
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

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 370000 ps;
	reset <= '1';
	WAIT FOR 20000 ps;
	reset <= '0';
	WAIT FOR 170000 ps;
	reset <= '1';
	WAIT FOR 30000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- data
t_prcs_data: PROCESS
BEGIN
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 40000 ps;
	data <= '0';
	WAIT FOR 40000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 60000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 30000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 20000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 30000 ps;
	data <= '0';
	WAIT FOR 30000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 20000 ps;
	data <= '0';
	WAIT FOR 30000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 40000 ps;
	data <= '0';
	WAIT FOR 30000 ps;
	data <= '1';
	WAIT FOR 70000 ps;
	data <= '0';
	WAIT FOR 20000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 20000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 10000 ps;
	data <= '0';
	WAIT FOR 30000 ps;
	data <= '1';
	WAIT FOR 20000 ps;
	data <= '0';
	WAIT FOR 10000 ps;
	data <= '1';
	WAIT FOR 20000 ps;
	data <= '0';
WAIT;
END PROCESS t_prcs_data;
END Detector_arch;
