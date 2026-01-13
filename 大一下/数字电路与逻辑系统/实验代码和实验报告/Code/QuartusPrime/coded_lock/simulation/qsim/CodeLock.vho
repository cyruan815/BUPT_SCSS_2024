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

-- DATE "06/08/2025 10:50:25"

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

ENTITY 	CodeLock IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	data_in : IN std_logic;
	set_mode : IN std_logic;
	unlocked : OUT std_logic
	);
END CodeLock;

-- Design Ports Information
-- unlocked	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set_mode	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CodeLock IS
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
SIGNAL ww_data_in : std_logic;
SIGNAL ww_set_mode : std_logic;
SIGNAL ww_unlocked : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \set_mode~input_o\ : std_logic;
SIGNAL \data_in~input_o\ : std_logic;
SIGNAL \stored_password[2]~4_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \stored_password[1]~1_combout\ : std_logic;
SIGNAL \current_state.S_SET_P2~q\ : std_logic;
SIGNAL \Selector0~2_combout\ : std_logic;
SIGNAL \Selector0~3_combout\ : std_logic;
SIGNAL \current_state.S_IDLE~q\ : std_logic;
SIGNAL \next_state.S_SET_INIT~0_combout\ : std_logic;
SIGNAL \current_state.S_SET_INIT~q\ : std_logic;
SIGNAL \stored_password[2]~3_combout\ : std_logic;
SIGNAL \current_state.S_SET_P1~q\ : std_logic;
SIGNAL \stored_password[1]~2_combout\ : std_logic;
SIGNAL \next_state.S_P1_OK~0_combout\ : std_logic;
SIGNAL \current_state.S_P1_OK~q\ : std_logic;
SIGNAL \next_state.S_P2_OK~0_combout\ : std_logic;
SIGNAL \current_state.S_P2_OK~q\ : std_logic;
SIGNAL \stored_password[0]~0_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \current_state.S_UNLOCKED~q\ : std_logic;
SIGNAL stored_password : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ALT_INV_data_in~input_o\ : std_logic;
SIGNAL \ALT_INV_next_state.S_P2_OK~0_combout\ : std_logic;
SIGNAL ALT_INV_stored_password : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_current_state.S_P2_OK~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S_SET_P2~q\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_current_state.S_IDLE~q\ : std_logic;
SIGNAL \ALT_INV_set_mode~input_o\ : std_logic;
SIGNAL \ALT_INV_current_state.S_P1_OK~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S_SET_INIT~q\ : std_logic;
SIGNAL \ALT_INV_Selector0~2_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.S_SET_P1~q\ : std_logic;
SIGNAL \ALT_INV_current_state.S_UNLOCKED~q\ : std_logic;
SIGNAL \ALT_INV_Selector0~1_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_data_in <= data_in;
ww_set_mode <= set_mode;
unlocked <= ww_unlocked;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Selector0~0_combout\ <= NOT \Selector0~0_combout\;
\ALT_INV_data_in~input_o\ <= NOT \data_in~input_o\;
\ALT_INV_next_state.S_P2_OK~0_combout\ <= NOT \next_state.S_P2_OK~0_combout\;
ALT_INV_stored_password(0) <= NOT stored_password(0);
\ALT_INV_current_state.S_P2_OK~q\ <= NOT \current_state.S_P2_OK~q\;
\ALT_INV_current_state.S_SET_P2~q\ <= NOT \current_state.S_SET_P2~q\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
ALT_INV_stored_password(2) <= NOT stored_password(2);
\ALT_INV_current_state.S_IDLE~q\ <= NOT \current_state.S_IDLE~q\;
\ALT_INV_set_mode~input_o\ <= NOT \set_mode~input_o\;
\ALT_INV_current_state.S_P1_OK~q\ <= NOT \current_state.S_P1_OK~q\;
ALT_INV_stored_password(1) <= NOT stored_password(1);
\ALT_INV_current_state.S_SET_INIT~q\ <= NOT \current_state.S_SET_INIT~q\;
\ALT_INV_Selector0~2_combout\ <= NOT \Selector0~2_combout\;
\ALT_INV_current_state.S_SET_P1~q\ <= NOT \current_state.S_SET_P1~q\;
\ALT_INV_current_state.S_UNLOCKED~q\ <= NOT \current_state.S_UNLOCKED~q\;
\ALT_INV_Selector0~1_combout\ <= NOT \Selector0~1_combout\;

-- Location: IOOBUF_X78_Y0_N36
\unlocked~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.S_UNLOCKED~q\,
	devoe => ww_devoe,
	o => ww_unlocked);

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

-- Location: IOIBUF_X78_Y0_N1
\set_mode~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set_mode,
	o => \set_mode~input_o\);

-- Location: IOIBUF_X78_Y0_N52
\data_in~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in,
	o => \data_in~input_o\);

-- Location: MLABCELL_X78_Y1_N33
\stored_password[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \stored_password[2]~4_combout\ = ( stored_password(2) & ( \current_state.S_SET_INIT~q\ & ( (!\set_mode~input_o\) # (!\data_in~input_o\) ) ) ) # ( !stored_password(2) & ( \current_state.S_SET_INIT~q\ & ( (\set_mode~input_o\ & !\data_in~input_o\) ) ) ) # ( 
-- stored_password(2) & ( !\current_state.S_SET_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111101010000010100001111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datac => \ALT_INV_data_in~input_o\,
	datae => ALT_INV_stored_password(2),
	dataf => \ALT_INV_current_state.S_SET_INIT~q\,
	combout => \stored_password[2]~4_combout\);

-- Location: IOIBUF_X78_Y0_N18
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X78_Y1_N35
\stored_password[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stored_password[2]~4_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stored_password(2));

-- Location: MLABCELL_X78_Y1_N21
\Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = ( !\current_state.S_IDLE~q\ & ( stored_password(2) & ( (!\data_in~input_o\) # (\set_mode~input_o\) ) ) ) # ( !\current_state.S_IDLE~q\ & ( !stored_password(2) & ( (\data_in~input_o\) # (\set_mode~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111000000000000000011110101111101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datac => \ALT_INV_data_in~input_o\,
	datae => \ALT_INV_current_state.S_IDLE~q\,
	dataf => ALT_INV_stored_password(2),
	combout => \Selector0~1_combout\);

-- Location: MLABCELL_X78_Y1_N42
\stored_password[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \stored_password[1]~1_combout\ = ( \current_state.S_SET_P1~q\ & ( \set_mode~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_set_mode~input_o\,
	dataf => \ALT_INV_current_state.S_SET_P1~q\,
	combout => \stored_password[1]~1_combout\);

-- Location: FF_X78_Y1_N44
\current_state.S_SET_P2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stored_password[1]~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_SET_P2~q\);

-- Location: MLABCELL_X78_Y1_N51
\Selector0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~2_combout\ = ( \current_state.S_SET_INIT~q\ & ( \current_state.S_SET_P1~q\ & ( \set_mode~input_o\ ) ) ) # ( !\current_state.S_SET_INIT~q\ & ( \current_state.S_SET_P1~q\ & ( \set_mode~input_o\ ) ) ) # ( \current_state.S_SET_INIT~q\ & ( 
-- !\current_state.S_SET_P1~q\ & ( \set_mode~input_o\ ) ) ) # ( !\current_state.S_SET_INIT~q\ & ( !\current_state.S_SET_P1~q\ & ( (\set_mode~input_o\ & \current_state.S_SET_P2~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datac => \ALT_INV_current_state.S_SET_P2~q\,
	datae => \ALT_INV_current_state.S_SET_INIT~q\,
	dataf => \ALT_INV_current_state.S_SET_P1~q\,
	combout => \Selector0~2_combout\);

-- Location: MLABCELL_X78_Y1_N0
\Selector0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~3_combout\ = ( \Selector0~2_combout\ ) # ( !\Selector0~2_combout\ & ( ((\Selector0~0_combout\) # (\Selector0~1_combout\)) # (\next_state.S_P2_OK~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111111111111001111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_next_state.S_P2_OK~0_combout\,
	datac => \ALT_INV_Selector0~1_combout\,
	datad => \ALT_INV_Selector0~0_combout\,
	dataf => \ALT_INV_Selector0~2_combout\,
	combout => \Selector0~3_combout\);

-- Location: FF_X78_Y1_N2
\current_state.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_IDLE~q\);

-- Location: MLABCELL_X78_Y1_N36
\next_state.S_SET_INIT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.S_SET_INIT~0_combout\ = ( !\current_state.S_IDLE~q\ & ( \set_mode~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_set_mode~input_o\,
	datae => \ALT_INV_current_state.S_IDLE~q\,
	combout => \next_state.S_SET_INIT~0_combout\);

-- Location: FF_X78_Y1_N38
\current_state.S_SET_INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.S_SET_INIT~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_SET_INIT~q\);

-- Location: MLABCELL_X78_Y1_N9
\stored_password[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \stored_password[2]~3_combout\ = ( \current_state.S_SET_INIT~q\ & ( \set_mode~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datae => \ALT_INV_current_state.S_SET_INIT~q\,
	combout => \stored_password[2]~3_combout\);

-- Location: FF_X78_Y1_N11
\current_state.S_SET_P1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stored_password[2]~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_SET_P1~q\);

-- Location: MLABCELL_X78_Y1_N24
\stored_password[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \stored_password[1]~2_combout\ = ( \current_state.S_SET_P1~q\ & ( (!\set_mode~input_o\ & ((stored_password(1)))) # (\set_mode~input_o\ & (\data_in~input_o\)) ) ) # ( !\current_state.S_SET_P1~q\ & ( stored_password(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000011111100110000001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_data_in~input_o\,
	datac => \ALT_INV_set_mode~input_o\,
	datad => ALT_INV_stored_password(1),
	dataf => \ALT_INV_current_state.S_SET_P1~q\,
	combout => \stored_password[1]~2_combout\);

-- Location: FF_X78_Y1_N26
\stored_password[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stored_password[1]~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stored_password(1));

-- Location: MLABCELL_X78_Y1_N57
\next_state.S_P1_OK~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.S_P1_OK~0_combout\ = ( !\current_state.S_IDLE~q\ & ( stored_password(2) & ( (!\set_mode~input_o\ & !\data_in~input_o\) ) ) ) # ( !\current_state.S_IDLE~q\ & ( !stored_password(2) & ( (!\set_mode~input_o\ & \data_in~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000000000000000010100000101000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datac => \ALT_INV_data_in~input_o\,
	datae => \ALT_INV_current_state.S_IDLE~q\,
	dataf => ALT_INV_stored_password(2),
	combout => \next_state.S_P1_OK~0_combout\);

-- Location: FF_X78_Y1_N59
\current_state.S_P1_OK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.S_P1_OK~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_P1_OK~q\);

-- Location: MLABCELL_X78_Y1_N15
\next_state.S_P2_OK~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.S_P2_OK~0_combout\ = ( \current_state.S_P1_OK~q\ & ( (!\set_mode~input_o\ & (!\data_in~input_o\ $ (stored_password(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100010000010001000000000000000001000100000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datab => \ALT_INV_data_in~input_o\,
	datad => ALT_INV_stored_password(1),
	datae => \ALT_INV_current_state.S_P1_OK~q\,
	combout => \next_state.S_P2_OK~0_combout\);

-- Location: FF_X78_Y1_N14
\current_state.S_P2_OK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \next_state.S_P2_OK~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_P2_OK~q\);

-- Location: MLABCELL_X78_Y1_N3
\stored_password[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stored_password[0]~0_combout\ = ( \current_state.S_SET_P2~q\ & ( (!\set_mode~input_o\ & ((stored_password(0)))) # (\set_mode~input_o\ & (!\data_in~input_o\)) ) ) # ( !\current_state.S_SET_P2~q\ & ( stored_password(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010000111110100101000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datac => \ALT_INV_data_in~input_o\,
	datad => ALT_INV_stored_password(0),
	dataf => \ALT_INV_current_state.S_SET_P2~q\,
	combout => \stored_password[0]~0_combout\);

-- Location: FF_X78_Y1_N5
\stored_password[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stored_password[0]~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stored_password(0));

-- Location: MLABCELL_X78_Y1_N27
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \current_state.S_UNLOCKED~q\ & ( !\set_mode~input_o\ ) ) # ( !\current_state.S_UNLOCKED~q\ & ( (!\set_mode~input_o\ & (\current_state.S_P2_OK~q\ & (!\data_in~input_o\ $ (!stored_password(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000001000000000100000100010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_set_mode~input_o\,
	datab => \ALT_INV_data_in~input_o\,
	datac => \ALT_INV_current_state.S_P2_OK~q\,
	datad => ALT_INV_stored_password(0),
	dataf => \ALT_INV_current_state.S_UNLOCKED~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X78_Y1_N8
\current_state.S_UNLOCKED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_UNLOCKED~q\);

-- Location: LABCELL_X12_Y14_N0
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


