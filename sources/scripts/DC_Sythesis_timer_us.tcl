# CHANGE THIS FOR DIFFERENT COMPUTERS / USERS
set sources_dir "/home/bgullet1/TENNLab/dvs-camera-ravens-interface/sources/"

set sources_sv_dir "${sources_dir}sv/"
set sources_pkg_dir "${sources_dir}pkg/"
set sources_synth_outputs_dir "${sources_dir}synthesis_outputs/"
set output_file_db "${sources_synth_outputs_dir}timer_us_synthesized_design.db"
set output_file_glnet "${sources_synth_outputs_dir}timer_us_glnet.v"

set_app_var search_path ". /research/pdk/cmos10lpe_pdk/cmos10lpe_stdlib/stdlib_char/generated/library"
set_app_var link_path "* stdlib_10lpe_ccs_comb.db"
set_app_var target_library "stdlib_10lpe_ccs_comb.db"
set_app_var symbol_library "dw_foundation.sldb"

# Define file paths
set design_files [list "timer_us.sv"] 

# Read the design files
read_file -format sverilog "${sources_pkg_dir}dvs_ravens_pkg.sv"
foreach file $design_files {
    read_file -format sverilog $sources_sv_dir$file
}

current_design timer_us

define_design_lib WORK -path "./work"

# Analyze the design files
analyze -library WORK -format sverilog "${sources_pkg_dir}dvs_ravens_pkg.sv"
foreach file $design_files {
    analyze -library WORK -format sverilog $sources_sv_dir$file
}

# Perform elaboration (design hierarchy construction)
elaborate timer_us

# Perform link
link

check_design

# Create clock
create_clock clk -period 10 -waveform {0 5}

# Perform synthesis
compile_ultra -gate_clock -no_autoungroup

# Report synthesis results
report_timing 
report_area
report_power
report_resources

# Save the synthesized design to output files
write -hierarchy -output $output_file_db
write -f verilog -h -o $output_file_glnet
