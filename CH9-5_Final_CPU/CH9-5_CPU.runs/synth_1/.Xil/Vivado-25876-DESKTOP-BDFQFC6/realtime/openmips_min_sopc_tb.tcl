# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.runs/synth_1/.Xil/Vivado-25876-DESKTOP-BDFQFC6/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a100tcsg324-1
    source $::env(HRT_TCL_PATH)/rtSynthParallelPrep.tcl
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -include G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1 {
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/ctrl.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/data_ram.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/div.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/ex.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/ex_mem.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/hilo_reg.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/id.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/id_ex.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/if_id.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/inst_rom.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/mem.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/mem_wb.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/openmips.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/openmips_min_sopc.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/pc_reg.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/regfile.v
      G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.srcs/sources_1/imports/Chapter9_1/openmips_min_sopc_tb.v
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top openmips_min_sopc_tb
    rt::set_parameter enableIncremental true
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter elaborateRtlOnlyFlow false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops true
# MODE: 
    rt::set_parameter webTalkPath {G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.cache/wt}
    rt::set_parameter enableSplitFlowPath "G:/vi_project/keshe/HelinCPU/CH9-5_CPU/CH9-5_CPU.runs/synth_1/.Xil/Vivado-25876-DESKTOP-BDFQFC6/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_synthesis -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    rt::HARTNDb_stopSystemStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
