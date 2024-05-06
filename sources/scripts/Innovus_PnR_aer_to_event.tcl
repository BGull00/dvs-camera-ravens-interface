set sq_dimension 152.32
set pwr_stripe_start_from_center 5.95
set pwr_stripe_start [expr $sq_dimension / 2 - $pwr_stripe_start_from_center]

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
floorPlan -site CoreSite -s $sq_dimension $sq_dimension 16.66 16.66 16.66 16.66
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
zoomBox -1225.44100 -474.96200 453.21800 1027.79600
zoomBox -1225.44100 -474.96200 453.21800 1027.79600
zoomBox -1023.15500 -388.64000 403.70500 888.70400
zoomBox -851.21200 -315.26700 361.61900 770.47600
zoomBox -705.06200 -252.90100 325.84600 669.98200
zoomBox -851.21500 -315.26900 361.61900 770.47600
zoomBox -705.06300 -252.90200 325.84600 669.98200
zoomBox -244.34300 -56.29900 213.07700 353.19000
zoomBox -176.03400 -39.05700 589.68700 352.14000
zoomBox -149.35600 -32.32400 501.50700 300.19400
zoomBox -107.40400 -21.73500 362.84400 218.50900
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer BB -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {gnd! vdd!} -type core_rings -follow core -layer {top BA bottom BA left BB right BB} -width {top 4.76 bottom 4.76 left 4.76 right 4.76} -spacing {top 2.38 bottom 2.38 left 2.38 right 2.38} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
zoomBox -61.56200 -10.62900 338.15000 193.57900
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer BB -stacked_via_bottom_layer M1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {gnd! vdd!} -layer BB -direction vertical -width 4.76 -spacing 2.38 -set_to_set_distance $sq_dimension -start_from left -start_offset $pwr_stripe_start -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit BB -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit BB -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None
zoomBox -95.51400 -21.26300 374.73800 218.98300
zoomBox -32.70800 -1.59100 307.05000 171.98700
zoomBox -95.51600 -21.26500 374.73900 218.98300
zoomBox -135.45900 -33.77600 417.78400 248.86900
zoomBox -115.53500 -28.68000 354.72200 211.56900
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padRing corePin floatingStripe } -layerChangeRange { M1(1) BB(6) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) BB(6) } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) BB(6) }
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padRing corePin floatingStripe } -layerChangeRange { M1(1) BB(6) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) BB(6) } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) BB(6) }
