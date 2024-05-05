set_app_var search_path ". /research/pdk/cmos10lpe_pdk/cmos10lpe_stdlib/stdlib_char/generated/library"
set_app_var link_path "* stdlib_10lpe_ccs_comb.db"
set_app_var target_library "stdlib_10lpe_ccs_comb.db"
set_app_var symbol_library "dw_foundation.sldb"
set output_file "synthesized_design.db"  # Path to output file

# Define file paths
set design_files [list "dvs_aer_to_event_interface.sv" "dvs_aer_reciever.sv" "dvs_event_crop_filter.sv" "dvs_event_polarity_filter.sv" "dvs_event_preprocessor.sv" "dvs_event_to_ravens.sv" "dvs_ravens.sv" "dvs_ravens_arbiter.sv" "dvs_fifo_event_queue.sv" "timer_us.sv" "dvs_event_to_ravens_spike.sv" "dvs_ravens_transmitter.sv"] 

set top_module "dvs_aer_to_event_interface.sv"  # Name of the top module 
# set constraints_file "constraints.sdc" ?

# Read the design files
foreach file $design_files {
    read_file $file
}

# Specify the top module
current_design $top_module

# Read the constraints file if provided
#if { [file exists $constraints_file] } {
#    read_sdc $constraints_file
#}

# Set optimization effort level
set_optimize_effort "high"  # Set high optimization effort level

# Perform elaboration (design hierarchy construction)
elaborate

# Perform synthesis with high effort
compile_ultra -gate_clock

# Report synthesis results
report_timing 
report_area
report_power
report_resources

# Save the synthesized design to an output file
write -hierarchy -output $output_file
