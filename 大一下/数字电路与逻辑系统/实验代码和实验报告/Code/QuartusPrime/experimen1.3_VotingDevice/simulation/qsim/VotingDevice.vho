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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"

-- DATE "06/13/2025 09:13:44"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	VotingDevice IS
    PORT (
	vote : IN std_logic_vector(3 DOWNTO 0);
	result : OUT std_logic
	);
END VotingDevice;

-- Design Ports Information
-- result	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vote[2]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vote[3]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vote[0]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vote[1]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF VotingDevice IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_vote : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_result : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \vote[0]~input_o\ : std_logic;
SIGNAL \vote[2]~input_o\ : std_logic;
SIGNAL \vote[3]~input_o\ : std_logic;
SIGNAL \vote[1]~input_o\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_vote[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_vote[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vote[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vote[1]~input_o\ : std_logic;

BEGIN

ww_vote <= vote;
result <= ww_result;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_vote[0]~input_o\ <= NOT \vote[0]~input_o\;
\ALT_INV_vote[3]~input_o\ <= NOT \vote[3]~input_o\;
\ALT_INV_vote[2]~input_o\ <= NOT \vote[2]~input_o\;
\ALT_INV_vote[1]~input_o\ <= NOT \vote[1]~input_o\;

-- Location: IOOBUF_X14_Y81_N19
\result~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LessThan0~0_combout\,
	devoe => ww_devoe,
	o => ww_result);

-- Location: IOIBUF_X12_Y81_N18
\vote[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vote(0),
	o => \vote[0]~input_o\);

-- Location: IOIBUF_X12_Y81_N35
\vote[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vote(2),
	o => \vote[2]~input_o\);

-- Location: IOIBUF_X12_Y81_N1
\vote[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vote(3),
	o => \vote[3]~input_o\);

-- Location: IOIBUF_X12_Y81_N52
\vote[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vote(1),
	o => \vote[1]~input_o\);

-- Location: LABCELL_X12_Y79_N0
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( \vote[3]~input_o\ & ( \vote[1]~input_o\ & ( (\vote[2]~input_o\) # (\vote[0]~input_o\) ) ) ) # ( !\vote[3]~input_o\ & ( \vote[1]~input_o\ & ( (\vote[0]~input_o\ & \vote[2]~input_o\) ) ) ) # ( \vote[3]~input_o\ & ( 
-- !\vote[1]~input_o\ & ( (\vote[0]~input_o\ & \vote[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110000001100000011000000110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_vote[0]~input_o\,
	datac => \ALT_INV_vote[2]~input_o\,
	datae => \ALT_INV_vote[3]~input_o\,
	dataf => \ALT_INV_vote[1]~input_o\,
	combout => \LessThan0~0_combout\);

-- Location: MLABCELL_X21_Y43_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


