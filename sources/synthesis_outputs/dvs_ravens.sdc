###################################################################

# Created by write_sdc on Mon May  6 23:10:54 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 50  -waveform {0 25}
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/clk_gate_dvs_event_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/clk_gate_dvs_event_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/clk_gate_dvs_event_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/clk_gate_dvs_event_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_time_us_start_looking_for_new_sim_time_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_time_us_start_looking_for_new_sim_time_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_time_us_start_looking_for_new_sim_time_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_time_us_start_looking_for_new_sim_time_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_ravens_pkt_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_ravens_pkt_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_ravens_pkt_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_ravens_pkt_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_segment_last_timestamp_us_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_segment_last_timestamp_us_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_segment_last_timestamp_us_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_EVENT_TO_RAVENS_INST/DVS_RAVENS_TRANSMITTER_INST/clk_gate_segment_last_timestamp_us_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_read_ptr_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_read_ptr_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_read_ptr_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_read_ptr_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_write_ptr_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_write_ptr_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_write_ptr_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_FIFO_EVENT_QUEUE_INST/clk_gate_write_ptr_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_AER_TO_EVENT_INTERFACE_INST/clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_AER_TO_EVENT_INTERFACE_INST/clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_AER_TO_EVENT_INTERFACE_INST/clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_AER_TO_EVENT_INTERFACE_INST/clk_gate_fifo_event_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_event_x_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
DVS_AER_TO_EVENT_INTERFACE_INST/DVS_AER_RECEIVER_INST/clk_gate_y_addr_reg/main_gate]
