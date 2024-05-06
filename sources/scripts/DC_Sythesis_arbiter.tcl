# CHANGE THIS FOR DIFFERENT COMPUTERS / USERS
set sources_dir "/home/bgullet1/TENNLab/dvs-camera-ravens-interface/sources/"

set sources_sv_dir "${sources_dir}sv/"
set output_file_db "${sources_dir}arbiter_synthesized_design.db"
set output_file_glnet "${sources_dir}arbiter_glnet.v"

set_app_var search_path ". /research/pdk/cmos10lpe_pdk/cmos10lpe_stdlib/stdlib_char/generated/library"
set_app_var link_path "* stdlib_10lpe_ccs_comb.db"
set_app_var target_library "stdlib_10lpe_ccs_comb.db"
set_app_var symbol_library "dw_foundation.sldb"

# Define file paths
set design_files [list "dvs_ravens_arbiter.sv"] 

# Read the design files
foreach file $design_files {
    read_file -format sverilog $sources_sv_dir$file
}

current_design dvs_ravens_arbiter

define_design_lib WORK -path "./work"

# Analyze the design files
foreach file $design_files {
    analyze -library WORK -format sverilog $sources_sv_dir$file
}

# Perform elaboration (design hierarchy construction)
elaborate dvs_ravens_arbiter

# Perform link
link

check_design

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
