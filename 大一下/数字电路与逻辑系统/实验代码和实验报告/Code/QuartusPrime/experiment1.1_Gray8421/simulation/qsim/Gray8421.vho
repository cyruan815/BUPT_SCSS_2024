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

-- DATE "06/13/2025 09:05:15"

-- 
-- Device: Altera 5CSEMA6F31C6 Package FBGA896
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

ENTITY 	Gray8421 IS
    PORT (
	z : IN std_logic_vector(3 DOWNTO 0);
	f : OUT std_logic_vector(3 DOWNTO 0)
	);
END Gray8421;

-- Design Ports Information
-- f[0]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- f[1]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- f[2]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- f[3]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z[0]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z[1]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Gray8421 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_z : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_f : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \z[0]~input_o\ : std_logic;
SIGNAL \z[1]~input_o\ : std_logic;
SIGNAL \temp~0_combout\ : std_logic;
SIGNAL \z[2]~input_o\ : std_logic;
SIGNAL \temp~1_combout\ : std_logic;
SIGNAL \z[3]~input_o\ : std_logic;
SIGNAL \temp~2_combout\ : std_logic;
SIGNAL \ALT_INV_z[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_z[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_z[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_z[3]~input_o\ : std_logic;

BEGIN

ww_z <= z;
f <= ww_f;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_z[0]~input_o\ <= NOT \z[0]~input_o\;
\ALT_INV_z[1]~input_o\ <= NOT \z[1]~input_o\;
\ALT_INV_z[2]~input_o\ <= NOT \z[2]~input_o\;
\ALT_INV_z[3]~input_o\ <= NOT \z[3]~input_o\;

-- Location: IOOBUF_X89_Y15_N56
\f[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \temp~0_combout\,
	devoe => ww_devoe,
	o => ww_f(0));

-- Location: IOOBUF_X89_Y13_N56
\f[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \temp~1_combout\,
	devoe => ww_devoe,
	o => ww_f(1));

-- Location: IOOBUF_X89_Y15_N39
\f[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \temp~2_combout\,
	devoe => ww_devoe,
	o => ww_f(2));

-- Location: IOOBUF_X89_Y16_N5
\f[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \z[3]~input_o\,
	devoe => ww_devoe,
	o => ww_f(3));

-- Location: IOIBUF_X89_Y15_N4
\z[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z(0),
	o => \z[0]~input_o\);

-- Location: IOIBUF_X89_Y15_N21
\z[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z(1),
	o => \z[1]~input_o\);

-- Location: LABCELL_X88_Y15_N0
\temp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~0_combout\ = ( \z[1]~input_o\ & ( !\z[0]~input_o\ ) ) # ( !\z[1]~input_o\ & ( \z[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_z[0]~input_o\,
	dataf => \ALT_INV_z[1]~input_o\,
	combout => \temp~0_combout\);

-- Location: IOIBUF_X89_Y16_N21
\z[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z(2),
	o => \z[2]~input_o\);

-- Location: LABCELL_X88_Y15_N9
\temp~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~1_combout\ = ( \z[2]~input_o\ & ( !\z[1]~input_o\ ) ) # ( !\z[2]~input_o\ & ( \z[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_z[1]~input_o\,
	dataf => \ALT_INV_z[2]~input_o\,
	combout => \temp~1_combout\);

-- Location: IOIBUF_X89_Y16_N55
\z[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z(3),
	o => \z[3]~input_o\);

-- Location: LABCELL_X88_Y15_N12
\temp~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~2_combout\ = ( \z[3]~input_o\ & ( !\z[2]~input_o\ ) ) # ( !\z[3]~input_o\ & ( \z[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_z[2]~input_o\,
	dataf => \ALT_INV_z[3]~input_o\,
	combout => \temp~2_combout\);

-- Location: LABCELL_X31_Y4_N0
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


