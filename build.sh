#!/usr/bin/env bash
set -e
STAGE=/mnt/c/fpga/arty_uart
VIVADO='C:\AMDDesignTools\2026.1\Vivado\bin\vivado.bat'

cargo run                                    # regenerate blinker.v
cp blinker.v arty_top.v arty.xdc build.tcl program.tcl "$STAGE/"

cd /mnt/c
cmd.exe /c "$VIVADO -mode batch \
  -source C:\\fpga\\arty_uart\\${1:-build}.tcl \
  -log C:\\fpga\\arty_uart\\vivado.log \
  -journal C:\\fpga\\arty_uart\\vivado.jou"
