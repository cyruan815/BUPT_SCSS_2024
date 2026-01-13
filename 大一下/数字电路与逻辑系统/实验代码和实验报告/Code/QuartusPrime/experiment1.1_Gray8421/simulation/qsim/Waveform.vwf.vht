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
-- Generated on "06/13/2025 09:05:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Gray8421
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Gray8421_vhd_vec_tst IS
END Gray8421_vhd_vec_tst;
ARCHITECTURE Gray8421_arch OF Gray8421_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL f : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL z : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT Gray8421
	PORT (
	f : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	z : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Gray8421
	PORT MAP (
-- list connections between master ports and signals
	f => f,
	z => z
	);
-- z[3]
t_prcs_z_3: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		z(3) <= '0';
		WAIT FOR 80000 ps;
		z(3) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	z(3) <= '0';
WAIT;
END PROCESS t_prcs_z_3;
-- z[2]
t_prcs_z_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		z(2) <= '0';
		WAIT FOR 40000 ps;
		z(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	z(2) <= '0';
WAIT;
END PROCESS t_prcs_z_2;
-- z[1]
t_prcs_z_1: PROCESS
BEGIN
LOOP
	z(1) <= '0';
	WAIT FOR 20000 ps;
	z(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_z_1;
-- z[0]
t_prcs_z_0: PROCESS
BEGIN
LOOP
	z(0) <= '0';
	WAIT FOR 10000 ps;
	z(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_z_0;
END Gray8421_arch;
