@echo off
REM ****************************************************************************
REM Vivado (TM) v2023.1.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Tue Mar 05 13:54:21 +0700 2024
REM SW Build 3900603 on Fri Jun 16 19:31:24 MDT 2023
REM
REM IP Build 3900379 on Sat Jun 17 05:28:05 MDT 2023
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim Bounce_flash_tb_behav -key {Behavioral:sim_1:Functional:Bounce_flash_tb} -tclbatch Bounce_flash_tb.tcl -log simulate.log"
call xsim  Bounce_flash_tb_behav -key {Behavioral:sim_1:Functional:Bounce_flash_tb} -tclbatch Bounce_flash_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
