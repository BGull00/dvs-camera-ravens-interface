set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set enc_check_rename_command_name 1
setGenerateViaMode -auto true
set init_gnd_net gnd!
set init_lef_file {/research/pdk/cmos10lpe_pdk/cmos10lpe_stdlib/stdlib_char/generated/files/cmos10lpe_tech_20210608.lef /research/pdk/cmos10lpe_pdk/cmos10lpe_stdlib/stdlib_char/generated/files/stdlib_10lpe-20210622_1825.lef /research/pdk/cmos10lpe_pdk/cmos10lpe_stdlib/stdlib_char/generated/files/stdlib_10lpe_filler-20210111.lef}
set init_verilog aer_to_event_glnet.v
set init_mmmc_file Default.view
set init_pwr_net vdd!
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -s 152.32 152.32 16.66 16.66 16.66 16.66
uiSetTool select
getIoFlowFlag
fit
clearGlobalNets
globalNetConnect vdd! -type tiehi -instanceBasename *
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename *
globalNetConnect vdd! -type pgpin -pin vdd! -instanceBasename *
globalNetConnect gnd! -type tielo -instanceBasename *
globalNetConnect gnd! -type pgpin -pin VSS -instanceBasename *
globalNetConnect gnd! -type pgpin -pin gnd! -instanceBasename *
clearGlobalNets
globalNetConnect vdd! -type tiehi -instanceBasename *
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename *
globalNetConnect vdd! -type pgpin -pin vdd! -instanceBasename *
globalNetConnect gnd! -type tielo -instanceBasename *
globalNetConnect gnd! -type pgpin -pin VSS -instanceBasename *
globalNetConnect gnd! -type pgpin -pin gnd! -instanceBasename *
clearGlobalNets
globalNetConnect vdd! -type tiehi -instanceBasename *
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename *
globalNetConnect vdd! -type pgpin -pin vdd! -instanceBasename *
globalNetConnect gnd! -type tielo -instanceBasename *
globalNetConnect gnd! -type pgpin -pin VSS -instanceBasename *
globalNetConnect gnd! -type pgpin -pin gnd! -instanceBasename *