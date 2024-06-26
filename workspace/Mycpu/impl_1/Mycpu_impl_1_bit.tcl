#-- Lattice Semiconductor Corporation Ltd.
#-- Bitgen run script generated by Radiant

set ret 0
if {[catch {

sys_set_attribute -gui on -msg {C:/Users/javos/workspace/Mycpu/promote.xml}
msg_load {C:/Users/javos/workspace/Mycpu/promote.xml}
des_set_project_udb -in {Mycpu_impl_1.udb} -milestone bit -pm jd5s00
# bitgen option
bit_set_option { enable_early_io_wakeup false output_format "binary"   ip_evaluation false register_initialization true bitstream_mode normal}
#-- write result file
bit_generate -w {C:/Users/javos/workspace/Mycpu/impl_1/Mycpu_impl_1}

} out]} {
   runtime_log $out
   set ret 1
}

exit -force ${ret}
