set projDir "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/vivado"
set projName "CounterGame"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/au_top_0.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/multi_seven_seg_1.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/game_miniBeta_2.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/reset_conditioner_3.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/edge_detector_4.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/button_conditioner_5.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/multi_dec_ctr_6.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/counter_7.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/seven_seg_8.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/decoder_9.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/alu_10.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/game_CU_11.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/game_miniRegfiles_12.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/game_LED_13.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/pipeline_14.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/decimal_counter_15.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/adder_16.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/boolean_17.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/shifter_18.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/compare_19.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/ws2812b_writer_20.v" "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/verilog/decoder_21.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Taylor/Documents/GitHub/16-bit_ALU/CounterGame/work/constraint/custom.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 4
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
