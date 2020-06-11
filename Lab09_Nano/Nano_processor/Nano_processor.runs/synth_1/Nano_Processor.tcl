# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.cache/wt [current_project]
set_property parent.project_path C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo c:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Add_3.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Add_Sub_4.vhd
  {C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Lab 5/Lab 5.srcs/sources_1/new/D_FF.vhd}
  {C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Lab 4/Lab 4.srcs/sources_1/new/Decoder_2_to_4.vhd}
  {C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Lab 4/Lab 4.srcs/sources_1/new/Decoder_3_to_8.vhd}
  {C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Lab 3/Lab3/Lab3.srcs/sources_1/new/FA.vhd}
  {C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Lab 3/Lab3/Lab3.srcs/sources_1/new/HA.vhd}
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Ins_Decoder.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/LUT_16_7.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Mux_2_Way_3_Bit.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Mux_2_Way_4_Bit.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Mux_2_to_1.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Mux_8_Way_4_Bit.vhd
  {C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Lab 4/Lab 4.srcs/sources_1/new/Mux_8_to_1.vhd}
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/P_ROM.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Program_counter.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Reg.vhd
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Register_Bank.vhd
  {C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Lab 5/Lab 5.srcs/sources_1/new/Slow_Clk.vhd}
  C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/sources_1/new/Nano_Processor.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/constrs_1/new/Basy3.xdc
set_property used_in_implementation false [get_files C:/Users/hari2/Desktop/CSE/Pro.Con/Lap/Nano_processor/Nano_processor.srcs/constrs_1/new/Basy3.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Nano_Processor -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Nano_Processor.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Nano_Processor_utilization_synth.rpt -pb Nano_Processor_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]