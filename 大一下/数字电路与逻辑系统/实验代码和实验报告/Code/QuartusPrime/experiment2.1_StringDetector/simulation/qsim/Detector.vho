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

-- DATE "06/13/2025 09:18:21"

-- 
-- Device: Altera 5CSEMA6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Detector IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	data : IN std_logic;
	cout : OUT std_logic
	);
END Detector;

-- Design Ports Information
-- cout	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data	=>  Location: PIN_AJ25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Detector IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_data : std_logic;
SIGNAL ww_cout : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \data~input_o\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \current_state.s0~q\ : std_logic;
SIGNAL \next_state.s1~0_combout\ : std_logic;
SIGNAL \current_state.s1~q\ : std_logic;
SIGNAL \next_state.s2~0_combout\ : std_logic;
SIGNAL \current_state.s2~q\ : std_logic;
SIGNAL \next_state.s3~0_combout\ : std_logic;
SIGNAL \current_state.s3~q\ : std_logic;
SIGNAL \next_state.s4~0_combout\ : std_logic;
SIGNAL \current_state.s4~q\ : std_logic;
SIGNAL \next_state.s5~0_combout\ : std_logic;
SIGNAL \current_state.s5~q\ : std_logic;
SIGNAL \next_state.s6~0_combout\ : std_logic;
SIGNAL \current_state.s6~q\ : std_logic;
SIGNAL \next_state.s7~0_combout\ : std_logic;
SIGNAL \current_state.s7~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s4~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s2~q\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_current_state.s7~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s5~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s0~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s1~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s6~q\ : std_logic;
SIGNAL \ALT_INV_current_state.s3~q\ : std_logic;
SIGNAL \ALT_INV_data~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_data <= data;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_current_state.s4~q\ <= NOT \current_state.s4~q\;
\ALT_INV_current_state.s2~q\ <= NOT \current_state.s2~q\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_current_state.s7~q\ <= NOT \current_state.s7~q\;
\ALT_INV_current_state.s5~q\ <= NOT \current_state.s5~q\;
\ALT_INV_current_state.s0~q\ <= NOT \current_state.s0~q\;
\ALT_INV_current_state.s1~q\ <= NOT \current_state.s1~q\;
\ALT_INV_current_state.s6~q\ <= NOT \current_state.s6~q\;
\ALT_INV_current_state.s3~q\ <= NOT \current_state.s3~q\;
\ALT_INV_data~input_o\ <= NOT \data~input_o\;

-- Location: IOOBUF_X74_Y0_N42
\cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.s7~q\,
	devoe => ww_devoe,
	o => ww_cout);

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X74_Y0_N92
\data~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data,
	o => \data~input_o\);

-- Location: LABCELL_X74_Y1_N15
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \current_state.s4~q\ ) # ( !\current_state.s4~q\ & ( ((\current_state.s6~q\) # (\data~input_o\)) # (\current_state.s3~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011111111111011101111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.s3~q\,
	datab => \ALT_INV_data~input_o\,
	datad => \ALT_INV_current_state.s6~q\,
	dataf => \ALT_INV_current_state.s4~q\,
	combout => \Selector0~0_combout\);

-- Location: IOIBUF_X74_Y0_N58
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X74_Y1_N17
\current_state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s0~q\);

-- Location: LABCELL_X74_Y1_N24
\next_state.s1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.s1~0_combout\ = ( \current_state.s0~q\ & ( (\data~input_o\ & ((\current_state.s4~q\) # (\current_state.s7~q\))) ) ) # ( !\current_state.s0~q\ & ( \data~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000101010101010000010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datac => \ALT_INV_current_state.s7~q\,
	datad => \ALT_INV_current_state.s4~q\,
	dataf => \ALT_INV_current_state.s0~q\,
	combout => \next_state.s1~0_combout\);

-- Location: FF_X74_Y1_N25
\current_state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.s1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s1~q\);

-- Location: LABCELL_X74_Y1_N12
\next_state.s2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.s2~0_combout\ = ( \current_state.s1~q\ & ( \data~input_o\ ) ) # ( !\current_state.s1~q\ & ( (\data~input_o\ & \current_state.s6~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_data~input_o\,
	datad => \ALT_INV_current_state.s6~q\,
	dataf => \ALT_INV_current_state.s1~q\,
	combout => \next_state.s2~0_combout\);

-- Location: FF_X74_Y1_N13
\current_state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.s2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s2~q\);

-- Location: LABCELL_X74_Y1_N3
\next_state.s3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.s3~0_combout\ = ( \current_state.s2~q\ & ( \data~input_o\ ) ) # ( !\current_state.s2~q\ & ( (\data~input_o\ & \current_state.s3~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datad => \ALT_INV_current_state.s3~q\,
	dataf => \ALT_INV_current_state.s2~q\,
	combout => \next_state.s3~0_combout\);

-- Location: FF_X74_Y1_N5
\current_state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.s3~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s3~q\);

-- Location: LABCELL_X74_Y1_N54
\next_state.s4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.s4~0_combout\ = (!\data~input_o\ & \current_state.s3~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datad => \ALT_INV_current_state.s3~q\,
	combout => \next_state.s4~0_combout\);

-- Location: FF_X74_Y1_N56
\current_state.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.s4~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s4~q\);

-- Location: LABCELL_X74_Y1_N57
\next_state.s5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.s5~0_combout\ = (!\data~input_o\ & \current_state.s4~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datad => \ALT_INV_current_state.s4~q\,
	combout => \next_state.s5~0_combout\);

-- Location: FF_X74_Y1_N58
\current_state.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.s5~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s5~q\);

-- Location: LABCELL_X74_Y1_N0
\next_state.s6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.s6~0_combout\ = ( \current_state.s5~q\ & ( \data~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	dataf => \ALT_INV_current_state.s5~q\,
	combout => \next_state.s6~0_combout\);

-- Location: FF_X74_Y1_N2
\current_state.s6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.s6~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s6~q\);

-- Location: LABCELL_X74_Y1_N27
\next_state.s7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.s7~0_combout\ = (!\data~input_o\ & \current_state.s6~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data~input_o\,
	datad => \ALT_INV_current_state.s6~q\,
	combout => \next_state.s7~0_combout\);

-- Location: FF_X74_Y1_N29
\current_state.s7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.s7~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.s7~q\);

-- Location: LABCELL_X10_Y15_N0
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


