set proj C:/fpga/arty_uart
read_verilog $proj/blinker.v
read_verilog $proj/arty_top.v
read_xdc     $proj/arty.xdc
synth_design -top arty_top -part xc7a100tcsg324-1
opt_design
place_design
route_design
report_timing_summary -file $proj/timing.rpt
write_bitstream -force $proj/arty_top.bit
