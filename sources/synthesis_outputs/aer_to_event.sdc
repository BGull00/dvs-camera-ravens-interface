###################################################################

# Created by write_sdc on Mon May  6 10:03:40 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_gating_check -rise -setup 0 [get_cells                               \
clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
