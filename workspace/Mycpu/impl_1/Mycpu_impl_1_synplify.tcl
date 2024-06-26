#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology LFD2NX
set_option -part LFD2NX_40
set_option -package CABGA196C
set_option -speed_grade -7
#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog standard option
set_option -vlog_std v2001

#map options
set_option -frequency 200
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0


set_option -default_enum_encoding default

#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 0
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


set_option -rw_check_on_ram 0
set_option -seqshift_no_replicate 0

#-- set any command lines input by customer

set_option -dup false
set_option -disable_io_insertion false
add_file -constraint {Mycpu_impl_1_cpe.ldc}
add_file -verilog {C:/lscc/radiant/2023.2/ip/pmi/pmi_lfd2nx.v}
add_file -vhdl -lib pmi {C:/lscc/radiant/2023.2/ip/pmi/pmi_lfd2nx.vhd}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/Mycpu.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/pll0/1.8.0/rtl/pll0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/apb0/1.2.0/rtl/apb0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/ahbl2apb0/1.1.0/rtl/ahbl2apb0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/uart0/1.3.0/rtl/uart0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/sysmem0/2.1.0/rtl/sysmem0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/ahbl0/1.3.0/rtl/ahbl0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/cpu0/2.5.0/rtl/cpu0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/osc0/1.4.0/rtl/osc0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/gpio0/1.6.2/rtl/gpio0.v}
add_file -verilog -vlog_std v2001 {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/i2c0/2.0.1/rtl/i2c0.v}
#-- top module name
set_option -top_module Mycpu
set_option -include_path {C:/Users/javos/workspace/Mycpu}
set_option -include_path {C:/Users/javos/workspace/Mycpu}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/cpu0/2.5.0}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/gpio0/1.6.2}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/i2c0/2.0.1}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/sysmem0/2.1.0}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/uart0/1.3.0}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/ahbl0/1.3.0}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/ahbl2apb0/1.1.0}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/apb0/1.2.0}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/osc0/1.4.0}
set_option -include_path {C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/pll0/1.8.0}

#-- set result format/file last
project -result_format "vm"
project -result_file {C:/Users/javos/workspace/Mycpu/impl_1/Mycpu_impl_1.vm}

#-- error message log file
project -log_file {Mycpu_impl_1.srf}
project -run -clean
