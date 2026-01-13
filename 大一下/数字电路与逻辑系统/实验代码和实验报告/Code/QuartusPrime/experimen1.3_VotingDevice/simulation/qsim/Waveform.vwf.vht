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
-- Generated on "06/13/2025 09:13:42"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          VotingDevice
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY VotingDevice_vhd_vec_tst IS
END VotingDevice_vhd_vec_tst;
ARCHITECTURE VotingDevice_arch OF VotingDevice_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL result : STD_LOGIC;
SIGNAL vote : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT VotingDevice
	PORT (
	result : OUT STD_LOGIC;
	vote : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : VotingDevice
	PORT MAP (
-- list connections between master ports and signals
	result => result,
	vote => vote
	);
-- vote[3]
t_prcs_vote_3: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		vote(3) <= '0';
		WAIT FOR 80000 ps;
		vote(3) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	vote(3) <= '0';
WAIT;
END PROCESS t_prcs_vote_3;
-- vote[2]
t_prcs_vote_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		vote(2) <= '0';
		WAIT FOR 40000 ps;
		vote(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	vote(2) <= '0';
WAIT;
END PROCESS t_prcs_vote_2;
-- vote[1]
t_prcs_vote_1: PROCESS
BEGIN
LOOP
	vote(1) <= '0';
	WAIT FOR 20000 ps;
	vote(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_vote_1;
-- vote[0]
t_prcs_vote_0: PROCESS
BEGIN
LOOP
	vote(0) <= '0';
	WAIT FOR 10000 ps;
	vote(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_vote_0;
END VotingDevice_arch;
