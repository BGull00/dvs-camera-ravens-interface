#!/bin/bash

#####################################
# SRAM Compiler Wrapper Script      #
# array_compiler.sh                 #
# University of Tennessee Knoxville #
# John Murray                       #
# 2020                              #
#####################################

####################
# v0.45 - 20210204 #
####################

### To do: (?) ###
# Make sure the "local.lib" that's soft included in "cds.lib" isn't commented out
# See line 97 regarding cells with custom layouts used in compilation
# See line 463 to see if the "-ignoreextrapins" ihdl param should be used
#   i.e. are the current extra pin warnings relevant?
# Make layers (and LPPs) adjustable in the skill files
# Make pin label purpose configurable (also, pin layers?)


# Print extra information?
OUTPUT_CONFIG=1
VERBOSE=1

# This is checked below, but:
# NROWS & NCOLS MUST BE A POWER OF 2
# NCOLS MUST BE >= (4 x WRDSZ)
NROWS="256"
NCOLS="256"
WRDSZ="64"

# Technology library - DO NOT CHANGE THIS UNLESS YOU 
# KNOW WHAT OTHER CHANGES NEED TO BE MADE
TECH_LIB="cmos10lpe"

# Library to put the compiled SRAM into
# This will be appended with additional info if using the "USE_OUTPUT_DIR_LIB"
LIB_NAME="sram_compiled"
# LIB_NAME="sram_compiled_r_${NROWS}_c_${NCOLS}_w_${WRDSZ}"

# Whether or not to copy some of the generated files into another directory
COPY_TO_OUTPUT=1
# Whether or not to use the copied output library instead of the scratch version
USE_OUTPUT_DIR_LIB=1
# Name of the library inside the output directory
OUTPUT_LIB_LIB_NAME="${LIB_NAME}_$(date +'%Y%m%d_%H%M%S')_r${NROWS}_c${NCOLS}_w${WRDSZ}"


# Path to where "cds.lib" is stored (cadence tools working directory)
CAD_WORKDIR_PATH="/home/${USER}/ece551/dvs-camera-ravens-interface/sources/sram"

# Handle hierarchical sourcing with both bash and zsh
if [ -n "$BASH_SOURCE" ]; then
  SCRIPT_FILE=$BASH_SOURCE
elif [ -n "$ZSH_VERSION" ]; then
  setopt function_argzero
  SCRIPT_FILE=$0
else
  echo 1>&2 "Unsupported shell. Please use bash or zsh."
  exit 2
fi
# Path to directory with this script
COMPILER_TEMPLATE_DIR="$(cd "$(dirname "${SCRIPT_FILE}")" > /dev/null 2>&1 && pwd)"


# What the top level cell should be named
TOP_CELL_NAME="sram_compiled_array"


# If set to 1, no netlists will be imported. This is for debugging layouts.
# Importing large array schematics can take a lot of time and produce
# large files. The schematic for a 512x512x8 array is just over 115MB.
SKIP_NETLIST_IMPORT="0"

########################################################################
# IF ANY OF THIS IS CHANGED, UPDATES TO SOURCES ARE VERY LIKELY NEEDED #
########################################################################
# What library to use cells and circuits with custom layouts from
if [[ "${TECH_LIB}" == "tsmc65" ]]; then
  SRAM_LOGIC_LIBRARY="sram_logic"
  SRAM_CELL_LIBRARY="sram_cells"
  # Name of SRAM cell being used in the array
  SRAM_CELL_CELL="sram_cell_6t_3"
elif [[ "${TECH_LIB}" == "cmos10lpe" ]]; then
  SRAM_LOGIC_LIBRARY="sram_logic_10lpe_HD"     # changed the logic libary name (HD)
  SRAM_CELL_LIBRARY="sram_cells_10lpe_HD"      # Changed the SRAM cell library name (HD)
  # Name of SRAM cell being used in the array
  SRAM_CELL_CELL="sram_cell_6t_5_HD"           # Changed the SRAM cell
else
  verbose_print "Please use a supported TECH_LIB!" 1
  exit 1
fi

### Compiled cell names, kept as original names for now. 
### Only the following exist at the moment, though:
# "colDecoderUnit_compiler"
# "colDecoder_compiler1"
# "columnMux"
# "decoder_compiler"
# "decoder_compiler1"
# "invDecoderCol_compiler"
# "invDecoderRow_compiler"
# "rowDecoderUnit_compiler"
# "rowDecoder_compiler1"
# "sram_cell_array_compiler"
CELL_NAME_CELL_ARRAY="sram_cell_array_compiler"
CELL_NAME_DEC="decoder_compiler"
CELL_NAME_DEC_1="decoder_compiler1"
CELL_NAME_ROW_DEC="rowDecoder"
# CELL_NAME_ROW_DEC="rowDecoder_compiler"
CELL_NAME_ROW_DEC_1="rowDecoder_compiler1"
CELL_NAME_ROW_DEC_UNIT="rowDecoderUnit_compiler"
CELL_NAME_COL_DEC="colDecoder_compiler"
CELL_NAME_COL_DEC_1="colDecoder_compiler1"
CELL_NAME_COL_DEC_UNIT="colDecoderUnit_compiler"
CELL_NAME_COL_MUX="columnMux"
CELL_NAME_INV_DEC_ROW="invDecoderRow_compiler"
CELL_NAME_INV_DEC_COL="invDecoderCol_compiler"
### These are custom, but used during compilation
### From: SRAM_LOGIC_LIBRARY
# "precharge_compiler"
# "inverter_compiler"
# "sense_amp_clocked_compiler"
# "write_driver_compiler"
CELL_NAME_WRITE_DRV="write_driver_compiler_HD"           # updated (_HD, +0.05) (HD)
CELL_NAME_SENSE_AMP="sense_amp_clocked_compiler_HD"   # updated sense_amp_clocked_compiler_HD (+0.05)
CELL_NAME_PRECHARGER="precharge_compiler_HD"         #changed the pre charge compiler (HD)
CELL_NAME_INVERTER="inverter_compiler_HD"            # updated   

# Names of the scripts to call (don't change unless the files are renamed)
SCRIPT_SRAM_PYTHON="sram_complete_compiler.py"
NETLIST_SRAM_PYTHON="sram_compiler_netlist.py"
STIMULI_SCRIPT_PYTHON="create_stimuli_sram_compiler.py"
SCRIPT_SRAM_SKILL="sram_complete_compiler.il"
########################################################################

# Generated/processed file names (okay to change)
IHDL_PARAM_FILE="ihdl_param_file"
SRAM_OUTPUT_NETLIST="${TOP_CELL_NAME}.v"
STIMULI_OUTPUT_FILE="stimuli_sram_compiler.scs"

# Path to copy (useful) generated files into after finishing
OUTPUT_DIR_TOP="${COMPILER_TEMPLATE_DIR}/compiler-runs"
OUTPUT_DIR_CUR="run-$(date +'%Y%m%d_%H%M%S')-r${NROWS}-c${NCOLS}-w${WRDSZ}"
OUTPUT_LIB_PATH="${OUTPUT_DIR_TOP}/${OUTPUT_DIR_CUR}/library"
OUTPUT_LIB_LIB_PATH="${OUTPUT_LIB_PATH}/${OUTPUT_LIB_LIB_NAME}"
OUTPUT_LIB_LIB_FILE="${OUTPUT_LIB_PATH}/${OUTPUT_LIB_LIB_NAME}-library.lib"

# Absolute paths to "cds.lib" and "local.lib"
CDS_LIB_PATH="${CAD_WORKDIR_PATH}/cds.lib"
LOCAL_LIB_PATH="${CAD_WORKDIR_PATH}/local.lib"

# The path to the work directory
# ***NOT*** the CAD working dir and NOT the place where this script is
WORK_DIR="${COMPILER_TEMPLATE_DIR}/work"

# Where to keep intermediates/generated library
WORK_LIB_DIR="${WORK_DIR}/library"
LIB_PATH="${WORK_LIB_DIR}/${LIB_NAME}"
WORK_LIB_LIB_FILE="${WORK_LIB_DIR}/${LIB_NAME}-library.lib"

# Temporary file used when creating the library for the compiled SRAM
LIB_SKILL="${WORK_DIR}/skill_lib_gen.il"
# # Temporary file used to check and save all the schematics
# SCH_CHKSV_SKILL="${WORK_DIR}/skill_sch_chksv.il"
# Temporary file used to update references for copied output library, if needed,
# and then check and save all the schematics
OUT_LIB_UPD_SKILL="${WORK_DIR}/skill_update_refs_verify.il"


# Colors for output
FG_RED="$(tput setaf 1)"
FG_GREEN="$(tput setaf 2)"
FG_WHITE="$(tput setaf 7)"
BG_RED="$(tput setab 1)"
BG_GREEN="$(tput setab 2)"
BG_WHITE="$(tput setab 7)"
BOLD="$(tput bold)"
RESET="$(tput sgr0)"


#########################################
##### Set up tool paths & variables #####
###################################################################################################

# Get software/tools environment paths and variables
# source "${CAD_WORKDIR_PATH}/toolsenv"
. /sw/etc/modules/cadence/
module load Virtuoso/618_280
export KITDIR="/research/pdk/cmos10lpe_pdk/ibm_pdk"

# We don't need the Calibre socket, it just takes extra time to launch Virtuoso here
unset MGC_RVE_INIT_SOCKET_AT_STARTUP


###################################################################################################
# print output if verbose is defined or a "1" is passed as the second argument
verbose_print()
{
  if [[ "$VERBOSE" -eq "1" || "$2" -eq "1" ]] ; then
    echo -e "$1"
  fi
}

# remove cdslck files in $1
remove_cdslck()
{
  find "$1" -type f -iname '*.cdslck*' -exec rm -f {} \;
}

# remove oacache files in $1
remove_oacache()
{
  find "$1" -type f -iname '*.oacache*' -exec rm -f {} \;
}

# check if argument is a power of two
is_power_of_two () {
  declare -i n=$1
  (( n > 0 && (n & (n - 1)) == 0 )) && echo "1"
}


#########################
##### Output config #####
###################################################################################################

# if [[ "$OUTPUT_CONFIG" -eq "1" || "$VERBOSE" -eq "1" ]] ; then
if [[ "$OUTPUT_CONFIG" -eq "1" ]] ; then
  echo "VERBOSE                = ${VERBOSE}"
  echo ""
  echo "CAD_WORKDIR_PATH       = ${CAD_WORKDIR_PATH}"
  echo "COMPILER_TEMPLATE_DIR  = ${COMPILER_TEMPLATE_DIR}"
  echo ""
  echo "CDS_LIB_PATH           = ${CDS_LIB_PATH}"
  echo "LOCAL_LIB_PATH         = ${LOCAL_LIB_PATH}"
  echo ""
  echo "NROWS                  = ${NROWS}"
  echo "NCOLS                  = ${NCOLS}"
  echo "WRDSZ                  = ${WRDSZ}"
  echo ""
  echo "SCRIPT_SRAM_PYTHON     = ${SCRIPT_SRAM_PYTHON}"
  echo "NETLIST_SRAM_PYTHON    = ${NETLIST_SRAM_PYTHON}"
  echo "STIMULI_SCRIPT_PYTHON  = ${STIMULI_SCRIPT_PYTHON}"
  echo "SCRIPT_SRAM_SKILL      = ${SCRIPT_SRAM_SKILL}"
  echo ""
  echo "TOP_CELL_NAME          = ${TOP_CELL_NAME}"
  echo ""
  echo "TECH_LIB               = ${TECH_LIB}"
  echo "SRAM_CELL_LIBRARY      = ${SRAM_CELL_LIBRARY}"
  echo "SRAM_CELL_CELL         = ${SRAM_CELL_CELL}"
  echo "SRAM_LOGIC_LIBRARY     = ${SRAM_LOGIC_LIBRARY}"
  echo ""
  echo "CELL_NAME_CELL_ARRAY   = ${CELL_NAME_CELL_ARRAY}"
  echo "CELL_NAME_DEC          = ${CELL_NAME_DEC}"
  echo "CELL_NAME_DEC_1        = ${CELL_NAME_DEC_1}"
  echo "CELL_NAME_ROW_DEC      = ${CELL_NAME_ROW_DEC}"
  echo "CELL_NAME_ROW_DEC_1    = ${CELL_NAME_ROW_DEC_1}"
  echo "CELL_NAME_ROW_DEC_UNIT = ${CELL_NAME_ROW_DEC_UNIT}"
  echo "CELL_NAME_COL_DEC      = ${CELL_NAME_COL_DEC}"
  echo "CELL_NAME_COL_DEC_1    = ${CELL_NAME_COL_DEC_1}"
  echo "CELL_NAME_COL_DEC_UNIT = ${CELL_NAME_COL_DEC_UNIT}"
  echo "CELL_NAME_COL_MUX      = ${CELL_NAME_COL_MUX}"
  echo "CELL_NAME_WRITE_DRV    = ${CELL_NAME_WRITE_DRV}"
  echo "CELL_NAME_SENSE_AMP    = ${CELL_NAME_SENSE_AMP}"
  echo "CELL_NAME_PRECHARGER   = ${CELL_NAME_PRECHARGER}"
  echo "CELL_NAME_INV_DEC_ROW  = ${CELL_NAME_INV_DEC_ROW}"
  echo "CELL_NAME_INV_DEC_COL  = ${CELL_NAME_INV_DEC_COL}"
  echo "CELL_NAME_INVERTER     = ${CELL_NAME_INVERTER}"
  echo ""
  echo "IHDL_PARAM_FILE        = ${IHDL_PARAM_FILE}"
  echo "SRAM_OUTPUT_NETLIST    = ${SRAM_OUTPUT_NETLIST}"
  echo "STIMULI_OUTPUT_FILE    = ${STIMULI_OUTPUT_FILE}"
  echo ""
  echo "WORK_DIR               = ${WORK_DIR}"
  echo "LIB_NAME               = ${LIB_NAME}"
  echo "WORK_LIB_DIR           = ${WORK_LIB_DIR}"
  echo ""
  echo "LIB_PATH               = ${LIB_PATH}"
  echo "WORK_LIB_LIB_FILE      = ${WORK_LIB_LIB_FILE}"
  echo "LIB_SKILL              = ${LIB_SKILL}"
  # echo "SCH_CHKSV_SKILL        = ${SCH_CHKSV_SKILL}"
  echo "OUT_LIB_UPD_SKILL      = ${OUT_LIB_UPD_SKILL}"
  echo ""
  echo "COPY_TO_OUTPUT         = ${COPY_TO_OUTPUT}"
  echo "USE_OUTPUT_DIR_LIB     = ${USE_OUTPUT_DIR_LIB}"
  echo "OUTPUT_DIR_TOP         = ${OUTPUT_DIR_TOP}"
  echo "OUTPUT_DIR_CUR         = ${OUTPUT_DIR_CUR}"
  echo "OUTPUT_LIB_PATH        = ${OUTPUT_LIB_PATH}"
  echo "OUTPUT_LIB_LIB_NAME    = ${OUTPUT_LIB_LIB_NAME}"
  echo "OUTPUT_LIB_LIB_PATH    = ${OUTPUT_LIB_LIB_PATH}"
  echo "OUTPUT_LIB_LIB_FILE    = ${OUTPUT_LIB_LIB_FILE}"
  echo ""
  echo "SKIP_NETLIST_IMPORT    = ${SKIP_NETLIST_IMPORT}"
  echo ""
fi


#########################
##### Sanity checks #####
###################################################################################################
verbose_print "Checking parameters"

# Can't use the output library if it doesn't get copied
if [[ "${COPY_TO_OUTPUT}" -eq "0" && "${USE_OUTPUT_DIR_LIB}" -ne "0" ]]; then
  echo "${FG_RED}*** USE_OUTPUT_DIR_LIB is set even though COPY_TO_OUTPUT is disabled! ***"
  echo "*** Disabling USE_OUTPUT_DIR_LIB! ***${RESET}"
  USE_OUTPUT_DIR_LIB=0
fi

# Check that number of rows is a power of 2
if [[ -z "$(is_power_of_two ${NROWS})" ]]; then
  echo "${BOLD}${FG_RED}*** Number of rows, NROWS=${NROWS}, is not a power of two! Cannot continue! ***${RESET}"
  exit
fi
# Check that number of columns is a power of 2
if [[ -z "$(is_power_of_two ${NCOLS})" ]]; then
  echo "${BOLD}${FG_RED}*** Number of cols, NCOLS=${NCOLS}, is not a power of two! Cannot continue! ***${RESET}"
  exit
fi
# Check that wordsize * 4 <= number of columns
if [[ "$((${WRDSZ} * 4))" -gt "${NCOLS}" ]]; then
  echo "${BOLD}${FG_RED}"
  echo "*** Word size, WRDSZ=${WRDSZ}, times four: $((${WRDSZ}*4)) needs to be <= number of cols, NCOLS=${NCOLS}! ***"
  echo "*** This is due to a current layout constraint that will cause problems if it's not met. Cannot contiune! ***"
  echo "${RESET}"
  exit
fi


#########################
##### Initial setup #####
###################################################################################################
verbose_print "Performing initial setup"

# Clean out existing libraries and intermediates
rm -rf "${WORK_DIR}"
rm -rf "${WORK_LIB_DIR}"

# (Re)make directories
mkdir -p "${LIB_PATH}"
mkdir -p "${WORK_LIB_DIR}"

# Copy all python files into workdir
cp "${COMPILER_TEMPLATE_DIR}/"*".py" "${WORK_DIR}/"
# Copy skill files into workdir
cp "${COMPILER_TEMPLATE_DIR}/"*".il" "${WORK_DIR}/"

# Make sure local.lib is (soft) included in cds.lib
( grep "local.lib" "${CDS_LIB_PATH}" || echo "SOFTINCLUDE local.lib" | tee -a "${CDS_LIB_PATH}" ) > /dev/null


###################################################################################################
##### Update netlist script and run python wrapper script to create netlist for compiled SRAM #####
###################################################################################################
verbose_print "Updating python script used to create compiled SRAM netlist"

# Move to WORK_DIR so that python is happy
cd "${WORK_DIR}"

# Update "fname" and top level variables in the netlist script
sed -i                                                                           \
    -e "s/\tfname='sram_complete_compiler'/\tfname='${SRAM_OUTPUT_NETLIST%.*}'/" \
    -e "s/('module sram_complete_compiler(')/('module ${TOP_CELL_NAME}(')/"      \
    -e "s/('sram_cell_6t_3 '/('${SRAM_CELL_CELL} '/"                             \
  "${WORK_DIR}/${NETLIST_SRAM_PYTHON}"

verbose_print "${FG_GREEN}Running python wrapper script to create compiled SRAM netlist${RESET}" "1"

( python3 "${WORK_DIR}/${SCRIPT_SRAM_PYTHON}" -w "${WRDSZ}" -r "${NROWS}" -c "${NCOLS}" ) > /dev/null


############################################
##### Create library for compiled SRAM #####
###################################################################################################
verbose_print "Generating skill script to create library for compiled SRAM, and attach tech lib to it"

# Move to CAD working directory so that virtuoso picks up the library path
cd "${CAD_WORKDIR_PATH}"

### Create library for compiled SRAM
# dbCreateLib forcibly adds to "cds.lib"
# Remove library path if it already exists
sed -i '\@'"${LIB_PATH}"'@d' "${CDS_LIB_PATH}"
sed -i '\@'"${LIB_PATH}"'@d' "${LOCAL_LIB_PATH}"

if [[ "${TECH_LIB}" == "tsmc65" ]]; then
  TECH_LIB="tsmcN65"
fi

# Create LIB_SKILL file
cat > "${LIB_SKILL}" << EOF
libid = dbCreateLib("${LIB_NAME}" "${LIB_PATH}")
techBindTechFile(libid "${TECH_LIB}")
exit
EOF

verbose_print "${FG_GREEN}Creating ${LIB_NAME} library${RESET}" "1"

# Run the SKILL code to generate the library
( virtuoso -nographE -restore "${LIB_SKILL}" ) > /dev/null
# virtuoso -nographE -restore "${LIB_SKILL}"


#######################################################################
##### Create param file and import compiled netlist into Virtuoso #####
###################################################################################################
verbose_print "Creating ihdl_parameter file before importing netlist for compiled SRAM"

# This parameter file is *NOT* the same format as what is exported from the GUI
# See "Verilog In Standalone Mode" in the "verinuser.pdf" document for details
cat > "${WORK_DIR}/${IHDL_PARAM_FILE}" << EOF
--- Verilog In ---
dest_sch_lib            := ${LIB_NAME}
ref_lib_list            := sample, basic, ${SRAM_CELL_LIBRARY}, ${SRAM_LOGIC_LIBRARY}
-- ignore_node_file        := 
import_if_exists        := 1
import_cells            := 1
import_lib_cells        := 1
structural_views        := 1
schematic_view_name     := schematic
functional_view_name    := functional
netlist_view_name       := netlist
symbol_view_name        := symbol
overwrite_symbol        := 1
log_file_name           := ${WORK_DIR}/verilogIn.log
map_file_name           := ${WORK_DIR}/verilogIn.map.table
work_area               := /tmp
power_net               := vdd!
ground_net              := gnd!
-- glob_sig_names          := 
--- Schematic Generation ---
sheet_symbol            := none
page_row_limit          := 1024
page_col_limit          := 1024
label_height            := 10
line_line_spacing       := 0.2
line_component_spacing  := 0.5
density_level           := 0
pin_placement           := left_and_right_sides
client                  := synthesis
alias_module            := cds_alias
cds_thru_symbol         := basic cds_thru symbol
cont_assign_symbol      := basic patch symbol
ref_sch_list            := schematic, sch
EOF

# Annoyingly, these parameter names changed between IC 6.1.6 & IC 6.1.7+
if [[ ! -z "$(virtuoso -W 2>&1 | egrep -e '6.1.[0-6]')" ]]; then
# Should be on <= 6.1.6
cat >> "${WORK_DIR}/${IHDL_PARAM_FILE}" << EOF
generate_fast_schematic := 1
fast_schematic_max_inst := 20000
fast_schematic_max_port := 5000
EOF
else
# Otherwise, on >= 6.1.7 (includes IC ADVM, since the sub-version pattern 
# is different and shouldn't match the conditional).
# Or, on a really old version (<6.1.0), which probably won't work regardless...
cat >> "${WORK_DIR}/${IHDL_PARAM_FILE}" << EOF
pnr_max_inst            := 20000
pnr_max_port            := 5000
EOF
fi

# Move to CAD working directory so that ihdl picks up the library path, though 
# the "-cdslib" parameter for ihdl should make this irrelevant?
cd "${CAD_WORKDIR_PATH}" 


verbose_print "${FG_GREEN}Importing netlist for compiled SRAM into Virtuoso${RESET}" "1"

if [[ "${SKIP_NETLIST_IMPORT}" == "1" ]]; then
  # NO-OP
  verbose_print "${BOLD}${FG_RED}Skipping import of netlist!${RESET}" "1"
else
  # ( ihdl -nocopyright -ignoreextrapins         \
  ( ihdl -nocopyright                          \
       -param "${WORK_DIR}/${IHDL_PARAM_FILE}" \
       -cdslib "${CDS_LIB_PATH}"               \
       "${WORK_DIR}/${SRAM_OUTPUT_NETLIST}"    \
    ) 2>&1 > /dev/null
fi

################################################
##### Update and run compiler skill script #####
###################################################################################################
verbose_print "Updating SRAM compiler skill script variables"

# Move to CAD working directory so that virtuoso picks up the library path
cd "${CAD_WORKDIR_PATH}"

### Update skill script variables
# Replace variables in all skill files just in case
find "${WORK_DIR}" -type f -iname '*.il' -exec                                                                                                    \
  sed -i                                                                                                                                          \
      -e 's#^M=[0-9]*#M='"${NROWS}"'#g'                                                                                                           \
      -e 's#^N=[0-9]*#N='"${NCOLS}"'#g'                                                                                                           \
      -e 's#^wordSize=[0-9]*;#wordSize='"${WRDSZ}"';#g'                                                                                           \
      -e 's#/home/mmajumde/cadence/ravens/tsmc65_libs/SRAM_COMPILER#'"${WORK_DIR}"'#g'                                                            \
      -e 's#dbOpenCellViewByType("sram_cells" "sram_cell_6t_3"#dbOpenCellViewByType("'"${SRAM_CELL_LIBRARY}"'" "'"${SRAM_CELL_CELL}"'"#g'         \
      -e 's#dbOpenCellViewByType("sram_logic" "sram_complete_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${SRAM_OUTPUT_NETLIST%.*}"'"#g'  \
      -e 's#dbOpenCellViewByType("sram_logic" "columnMux"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_COL_MUX}"'"#g'                    \
      -e 's#dbOpenCellViewByType("sram_logic" "decoder_compiler1"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_DEC_1}"'"#g'              \
      -e 's#dbOpenCellViewByType("sram_logic" "decoder_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_DEC}"'"#g'                 \
      -e 's#dbOpenCellViewByType("sram_logic" "rowDecoderUnit_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_ROW_DEC_UNIT}"'"#g' \
      -e 's#dbOpenCellViewByType("sram_logic" "rowDecoder_compiler1"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_ROW_DEC_1}"'"#g'       \
      -e 's#dbOpenCellViewByType("sram_logic" "rowDecoder_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_ROW_DEC}"'"#g'          \
      -e 's#dbOpenCellViewByType("sram_logic" "colDecoderUnit_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_COL_DEC_UNIT}"'"#g' \
      -e 's#dbOpenCellViewByType("sram_logic" "colDecoder_compiler1"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_COL_DEC_1}"'"#g'       \
      -e 's#dbOpenCellViewByType("sram_logic" "colDecoder_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_COL_DEC}"'"#g'          \
      -e 's#dbOpenCellViewByType("sram_logic" "invDecoderRow_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_INV_DEC_ROW}"'"#g'   \
      -e 's#dbOpenCellViewByType("sram_logic" "invDecoderCol_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_INV_DEC_COL}"'"#g'   \
      -e 's#dbOpenCellViewByType("sram_logic" "sram_cell_array_compiler"#dbOpenCellViewByType("'"${LIB_NAME}"'" "'"${CELL_NAME_CELL_ARRAY}"'"#g'  \
      -e 's#dbOpenCellViewByType("sram_logic" "write_driver_compiler"#dbOpenCellViewByType("'"${SRAM_LOGIC_LIBRARY}"'" "'"${CELL_NAME_WRITE_DRV}"'"#g'      \
      -e 's#dbOpenCellViewByType("sram_logic" "sense_amp_clocked_compiler"#dbOpenCellViewByType("'"${SRAM_LOGIC_LIBRARY}"'" "'"${CELL_NAME_SENSE_AMP}"'"#g' \
      -e 's#dbOpenCellViewByType("sram_logic" "precharge_compiler"#dbOpenCellViewByType("'"${SRAM_LOGIC_LIBRARY}"'" "'"${CELL_NAME_PRECHARGER}"'"#g'        \
      -e 's#dbOpenCellViewByType("sram_logic" "inverter_compiler"#dbOpenCellViewByType("'"${SRAM_LOGIC_LIBRARY}"'" "'"${CELL_NAME_INVERTER}"'"#g'           \
  {} \;


# append "exit" to the script since it'll be a one-shot run
( echo "exit" | tee -a "${WORK_DIR}/${SCRIPT_SRAM_SKILL}" ) > /dev/null

verbose_print "${FG_GREEN}Running SRAM compiler skill script to generate layouts${RESET}" "1"
( virtuoso -nographE -restore "${WORK_DIR}/${SCRIPT_SRAM_SKILL}" ) 2>&1 > /dev/null
# virtuoso -nographE -restore "${WORK_DIR}/${SCRIPT_SRAM_SKILL}"


#########################################################
##### Update and run python stimuli creation script #####
###################################################################################################
verbose_print "Updating python script for simulation stimuli creation"

# Move to WORK_DIR so that python is happy
cd "${WORK_DIR}"

### update python stimuli creation script ###
# update M (cols), N (rows), W (wordsize), and file path
sed -i                                                                                                        \
    -e 's#^M=[0-9]*#M='"${NROWS}"'#'                                                                          \
    -e 's#^N=[0-9]*#N='"${NCOLS}"'#'                                                                          \
    -e 's#^W=[0-9]*#W='"${WRDSZ}"'#'                                                                          \
    -e "s#^fstim=open('stimuli_sram_compiler.scs','w')#fstim=open('${WORK_DIR}/${STIMULI_OUTPUT_FILE}','w')#" \
    -e "s#val2='1.2'#val2='1.0'#"                                                                             \
    -e "s#src_dc(fstim,'Vvdd','vdd!','0','1.2')#src_dc(fstim,'Vvdd','vdd!','0','1.0')#"                       \
  "${WORK_DIR}/${STIMULI_SCRIPT_PYTHON}"

verbose_print "${FG_GREEN}Running python script for simulation stimuli creation${RESET}" "1"

( python "${WORK_DIR}/${STIMULI_SCRIPT_PYTHON}" ) > /dev/null


##########################
##### Clean up files #####
###################################################################################################
verbose_print "${FG_GREEN}Cleaning up extraneous files${RESET}" "1"

verbose_print "Removing cdslck files in ${WORK_LIB_DIR}"
remove_cdslck "${WORK_LIB_DIR}"

verbose_print "Removing oacache files in ${WORK_LIB_DIR}"
remove_oacache "${WORK_LIB_DIR}"


############################
##### Create .lib file #####
###################################################################################################
verbose_print "${FG_GREEN}Creating .lib file for soft inclusion${RESET}" "1"

# Get relative path to new library from the .lib file
LIB_PATH_RELATIVE="$(realpath --relative-to="${WORK_LIB_DIR}" "${LIB_PATH}")"

verbose_print "Determined relative path to ${LIB_NAME} as ${LIB_PATH_RELATIVE}"


verbose_print "Inserting library path definition into:\n  ${WORK_LIB_LIB_FILE}"

( echo "DEFINE ${LIB_NAME} ${LIB_PATH_RELATIVE}" | tee -a "${WORK_LIB_LIB_FILE}" ) > /dev/null


##########################################
##### Copy files to output directory #####
###################################################################################################
if [[ "${COPY_TO_OUTPUT}" -eq "1" ]]; then
  verbose_print "${FG_GREEN}Copying files into output directory${RESET}" "1"

  mkdir -p "${OUTPUT_LIB_PATH}"

  cp -R "${WORK_LIB_DIR}/${WOKR_LIB_DIR}/${LIB_NAME}" "${OUTPUT_LIB_LIB_PATH}"
  cp "${WORK_DIR}/${SRAM_OUTPUT_NETLIST}" "${OUTPUT_DIR_TOP}/${OUTPUT_DIR_CUR}"
  cp "${WORK_DIR}/${STIMULI_OUTPUT_FILE}" "${OUTPUT_DIR_TOP}/${OUTPUT_DIR_CUR}"

  # Make new .lib file for inclusion in local.lib that uses the new name
  verbose_print "${FG_GREEN}Recreating .lib file for soft inclusion${RESET}" "1"

  # Get relative path to new library from the .lib file
  OUTPUT_LIB_PATH_RELATIVE="$(realpath --relative-to="${OUTPUT_LIB_PATH}" "${OUTPUT_LIB_LIB_PATH}")"
  verbose_print "Determined relative path to ${OUTPUT_LIB_LIB_PATH} as ${OUTPUT_LIB_PATH_RELATIVE}"

  verbose_print "Inserting library path definition into:\n  ${OUTPUT_LIB_LIB_FILE}"
  ( echo "DEFINE ${OUTPUT_LIB_LIB_NAME} ${OUTPUT_LIB_PATH_RELATIVE}" | tee -a "${OUTPUT_LIB_LIB_FILE}" ) > /dev/null



  # If the output lib name is different, the instances need to be updated
  if [[ "${OUTPUT_LIB_LIB_NAME}" != "${LIB_NAME}" ]]; then
    verbose_print "Temporarily adding ${OUTPUT_LIB_LIB_NAME} to library path to update references"

    # Soft include the .lib file in local.lib
    if [[ "${USE_OUTPUT_DIR_LIB}" -eq "1" ]]; then
      verbose_print "Adding soft include for ${OUTPUT_LIB_LIB_FILE}\n  into ${LOCAL_LIB_PATH} if doesn't exist and isn't disabled"
      ( grep "${OUTPUT_LIB_LIB_FILE}" "${LOCAL_LIB_PATH}" || echo "SOFTINCLUDE ${OUTPUT_LIB_LIB_FILE}" | tee -a "${LOCAL_LIB_PATH}" ) > /dev/null
    fi

    verbose_print "Creating skill file to update ${OUTPUT_LIB_LIB_NAME} references"

cat > "${OUT_LIB_UPD_SKILL}" << EOF
procedure( changeRefs(newLib oldLib targetView)
  prog( (allCells cv)
    printf("Processing cells in %s lib for view %s\n" newLib targetView)
    allCells=ddGetObj(newLib)~>cells
    foreach(cell allCells
      cv=dbOpenCellViewByType(newLib cell~>name targetView "" "a")
      getWarn()
      if( cv then
        leRemasterInstances(cv oldLib "" "" newLib "" "" nil)
        if( targetView == "schematic" then
          schCheck(cv)
          dbCheck(cv)
        ) ;if
        dbSave(cv)
        dbClose(cv)
      ) ;if
    ) ;foreach
    return(t)
  ) ;prog
) ;procedure

changeRefs("${OUTPUT_LIB_LIB_NAME}" "${LIB_NAME}" "schematic")
changeRefs("${OUTPUT_LIB_LIB_NAME}" "${LIB_NAME}" "layout")

exit
EOF

    # Move to CAD working directory so that virtuoso picks up the library path
    cd "${CAD_WORKDIR_PATH}"

    verbose_print "${FG_GREEN}Updating references for ${OUTPUT_LIB_LIB_NAME} and checking + saving all schematics${RESET}" "1"

    # Run the SKILL code to generate the library
    ( virtuoso -nographE -restore "${OUT_LIB_UPD_SKILL}" ) > /dev/null
    # virtuoso -nographE -restore "${OUT_LIB_UPD_SKILL}"
  fi

  verbose_print "${FG_GREEN}Cleaning up extraneous files in ${OUTPUT_DIR_TOP}${RESET}"

  verbose_print "Removing cdslck files in ${OUTPUT_DIR_TOP}"
  remove_cdslck "${OUTPUT_DIR_TOP}"

  verbose_print "Removing oacache files in ${OUTPUT_DIR_TOP}"
  remove_oacache "${OUTPUT_DIR_TOP}"

fi


################################
##### Adjust library paths #####
###################################################################################################
verbose_print "${FG_GREEN}Adjusting library path${RESET}" "1"

# Remove the library paths that were added to cds.lib and if they're in local.lib as well
sed -i '\@'"${LIB_PATH}"'@d' "${CDS_LIB_PATH}"
sed -i '\@'"${LIB_PATH}"'@d' "${LOCAL_LIB_PATH}"
# This really shouldn't be necessary, but just in case
sed -i '\@'"${OUTPUT_LIB_LIB_NAME}"'@d' "${CDS_LIB_PATH}"
sed -i '\@'"${OUTPUT_LIB_LIB_NAME}"'@d' "${LOCAL_LIB_PATH}"

# Soft include the .lib file in local.lib
if [[ "${USE_OUTPUT_DIR_LIB}" -eq "1" ]]; then
  # This is actually necessary because the OUTPUT_LIB_LIB_FILE path is only added above if LIB_NAME != OUTPUT_LIB_LIB_NAME
  verbose_print "Adding soft include for ${OUTPUT_LIB_LIB_FILE}\n  into ${LOCAL_LIB_PATH} if doesn't exist and isn't disabled"
  ( grep "${OUTPUT_LIB_LIB_FILE}" "${LOCAL_LIB_PATH}" || echo "SOFTINCLUDE ${OUTPUT_LIB_LIB_FILE}" | tee -a "${LOCAL_LIB_PATH}" ) > /dev/null
else
  verbose_print "Adding soft include for ${WORK_LIB_LIB_FILE}\n  into ${LOCAL_LIB_PATH} if doesn't exist and isn't disabled"
  ( grep "${WORK_LIB_LIB_FILE}" "${LOCAL_LIB_PATH}" || echo "SOFTINCLUDE ${WORK_LIB_LIB_FILE}" | tee -a "${LOCAL_LIB_PATH}" ) > /dev/null
fi


###################################################################################################

verbose_print "${FG_GREEN}Don't forget about the simulation stimulus file!${RESET}" "1"

verbose_print "${BOLD}${FG_GREEN}Done!${RESET}" "1"
