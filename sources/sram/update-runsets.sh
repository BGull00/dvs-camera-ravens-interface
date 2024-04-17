#!/bin/bash


# Path to PDK's calibre root
TECHLIB_DIR_PATH="/research/pdk/cmos10lpe_pdk/ibm_pdk/cmos10lpe/V1.5.0.0RF/Calibre"

BEOL_STACK="4_02_00_00_LB"


if [ -n "$BASH_SOURCE" ]; then
  SCRIPT_FILE=$BASH_SOURCE
elif [ -n "$ZSH_VERSION" ]; then
  setopt function_argzero
  SCRIPT_FILE=$0
else
  echo 1>&2 "Unsupported shell. Please use bash or zsh."
  exit 2
fi
# CADDIR is the directory where this script is located, and should contain the other supplemental files
CADDIR="$(cd "$(dirname "${SCRIPT_FILE}")" > /dev/null 2>&1 && pwd)"

SI_EXPORT_ENV="${CADDIR}/calibre/si-netlist-export-template.env"
RUNSET_TEMPLATE_PATH="${CADDIR}/calibre/runsets"
CGIDRCDB_FILE="${RUNSET_TEMPLATE_PATH}/.cgidrcdb"
CGILVSDB_FILE="${RUNSET_TEMPLATE_PATH}/.cgilvsdb"
CGIPEXDB_FILE="${RUNSET_TEMPLATE_PATH}/.cgipexdb"
RVEDB_FILE="${RUNSET_TEMPLATE_PATH}/.rvedb"

# Top level directory for generated data for this process
DATA_PATH="/home/${USER}/cmos10lpe"
# For vlsix machines, use /scratch as emulated /data1
# DATA_PATH="/scratch/${USER}/data1/${USER}/cmos10lpe"
CALIBRE_DATA_PATH="${DATA_PATH}/calibre"
ASIM_DATA_PATH="${DATA_PATH}/simulation"
ADEXL_DATA_PATH="${DATA_PATH}/simulation-adexl"
mkdir -p "${CALIBRE_DATA_PATH}/svdb" "${ASIM_DATA_PATH}" "${ADEXL_DATA_PATH}/results" "${ADEXL_DATA_PATH}/results-dbs"


# Clean up old DRC files
rm -f "${CALIBRE_DATA_PATH}/"_cmos10lpe_*
# Clean up old Calibre files due to configuration path not respecting relative paths correctly
rm -rf "${CALIBRE_DATA_PATH}/calibre"


# Make dotfiles writable and then delete them, in case any are symlinks
chmod -f 644 "${CGIDRCDB_FILE}" "${CGILVSDB_FILE}" "${CGIPEXDB_FILE}" "${RVEDB_FILE}"
rm    -f     "${CGIDRCDB_FILE}" "${CGILVSDB_FILE}" "${CGIPEXDB_FILE}" "${RVEDB_FILE}"


# Generate si-export-template.env for default netlisting export template
sed -e 's#@TECHLIB_DIR_PATH@#'"${TECHLIB_DIR_PATH}"'#g'   \
    "${SI_EXPORT_ENV}_template" > "${SI_EXPORT_ENV}"


declare -a DRC_RUNSET_FILES=(
  "cmos10lpe-Calibre-DRC-cell.runset"
  "cmos10lpe-Calibre-DRC-cell-recommended.runset"
  "cmos10lpe-Calibre-DRC-tapeout-ant.runset"
  "cmos10lpe-Calibre-DRC-tapeout-esd.runset"
  "cmos10lpe-Calibre-DRC-tapeout-chip.runset"
  "cmos10lpe-Calibre-DRC-tapeout-chip-esd.runset"
  "cmos10lpe-Calibre-DRC-tapeout-chip-noesd.runset"
  "cmos10lpe-Calibre-DRC-tapeout-chip-noesd-noant.runset"
)
declare -a LVS_RUNSET_FILES=(
  "cmos10lpe-Calibre-LVS.runset"
)
declare -a PEX_RUNSET_FILES=(
  "cmos10lpe-Calibre-PEX.runset"
)
declare -a RUNSET_FILES=(
  "${DRC_RUNSET_FILES[@]}"
  "${LVS_RUNSET_FILES[@]}"
  "${PEX_RUNSET_FILES[@]}"
)


# Replace the template parameter in all of the runset templates
for f in "${RUNSET_FILES[@]}"; do
  sed -e 's#@CALIBRE_DATA_PATH@#'"${CALIBRE_DATA_PATH}"'#g' \
      -e 's#@TECHLIB_DIR_PATH@#'"${TECHLIB_DIR_PATH}"'#g'   \
      -e 's#@BEOL_STACK@#'"${BEOL_STACK}"'#g'               \
         "${RUNSET_TEMPLATE_PATH}/${f}_template" > "${RUNSET_TEMPLATE_PATH}/${f}"
done

# Create .cgidrcdb
echo "{#0} {} 640x480+0+0 last" > "${CGIDRCDB_FILE}"
for f in "${DRC_RUNSET_FILES[@]}"; do
  echo "${RUNSET_TEMPLATE_PATH}/${f} {DRC} {}" >> "${CGIDRCDB_FILE}"
done

# Create .cgilvsdb
echo "{#0} {} 640x480+0+360 last" > "${CGILVSDB_FILE}"
for f in "${LVS_RUNSET_FILES[@]}"; do
  echo "${RUNSET_TEMPLATE_PATH}/${f} {LVS} {}" >> "${CGILVSDB_FILE}"
done

# Create .cgipexdb
echo "{#0} {} 640x480+0+600 last" > "${CGIPEXDB_FILE}"
for f in "${PEX_RUNSET_FILES[@]}"; do
  echo "${RUNSET_TEMPLATE_PATH}/${f} {PEX} {}" >> "${CGIPEXDB_FILE}"
done

# Create .rvedb
cat > "${RVEDB_FILE}" << EOF
*layoutServer: Cadence:Virtuoso
*schematicServer: Cadence:Composer
*cmnShowHistogramToolbar: 1
*cmnShowInfo: 1
*cmnUseDbSpecificOptions: 0
*cmnUseUserDbSpecificOptions: 0
*drcExploreSortColumn: {Results {Check / Cell}}
*drcExploreSortDirection: {Results up}
*drcLastViewedHierarchy: Check Cell
*drcShowEmptyChecks: 0
*drcView: Details
*drcViewByCell: 0
*drcViewCellCoords: 0
*drcRveWinPos: last
*lvsRveWinPos: last
*lvsDiscrepancySortedState: {} none delta
*lvsSchematicShowHierarchy: 0
*lvsSchematicShowNetlistText: 0
*lvsShowSchematicOnHighlight: 0
EOF

# Remove write so that Calibre uses the ${CADDIR}/.* for updates
chmod 444 "${CGIDRCDB_FILE}" "${CGILVSDB_FILE}" "${CGIPEXDB_FILE}" "${RVEDB_FILE}"
