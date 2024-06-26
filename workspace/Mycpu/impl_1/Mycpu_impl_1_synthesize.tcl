if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2023.2} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "C:/Users/javos/workspace/Mycpu"
# synthesize IPs
# synthesize VMs
# propgate constraints
file delete -force -- Mycpu_impl_1_cpe.ldc
run_engine_newmsg cpe -f "Mycpu_impl_1.cprj" "pll0.cprj" "apb0.cprj" "ahbl2apb0.cprj" "uart0.cprj" "sysmem0.cprj" "ahbl0.cprj" "cpu0.cprj" "osc0.cprj" "gpio0.cprj" "i2c0.cprj" -a "LFD2NX"  -o Mycpu_impl_1_cpe.ldc
# synthesize top design
file delete -force -- Mycpu_impl_1.vm Mycpu_impl_1.ldc
if {[ catch {run_engine synpwrap -prj "Mycpu_impl_1_synplify.tcl" -log "Mycpu_impl_1.srf"} result options ]} {
    file delete -force -- Mycpu_impl_1.vm Mycpu_impl_1.ldc
    return -options $options $result
}
run_postsyn [list -a LFD2NX -p LFD2NX-40 -t CABGA196 -sp 7_High-Performance_1.0V -oc Commercial -top -w -o Mycpu_impl_1_syn.udb Mycpu_impl_1.vm] [list C:/Users/javos/workspace/Mycpu/impl_1/Mycpu_impl_1.ldc]

} out]} {
   runtime_log $out
   exit 1
}
