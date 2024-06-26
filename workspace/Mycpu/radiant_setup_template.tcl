set current_path "C:/Users/javos/workspace/Mycpu"

cd $current_path

set radiant_project "C:/Users/javos/workspace/Mycpu/Mycpu.rdf"

set DEVICE "LFD2NX-40-7BG196C"

set DESIGN "Mycpu"

array set VFILE_LIST ""
set VFILE_LIST(1) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/ahbl2apb0/1.1.0/ahbl2apb0.ipx"
set VFILE_LIST(2) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/i2c0/2.0.1/i2c0.ipx"
set VFILE_LIST(3) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/osc0/1.4.0/osc0.ipx"
set VFILE_LIST(4) "C:/Users/javos/workspace/Mycpu/Mycpu/Mycpu.v"
set VFILE_LIST(5) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/pll0/1.8.0/pll0.ipx"
set VFILE_LIST(6) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/uart0/1.3.0/uart0.ipx"
set VFILE_LIST(7) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/ahbl0/1.3.0/ahbl0.ipx"
set VFILE_LIST(8) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/gpio0/1.6.2/gpio0.ipx"
set VFILE_LIST(9) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/sysmem0/2.1.0/sysmem0.ipx"
set VFILE_LIST(10) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/ip/cpu0/2.5.0/cpu0.ipx"
set VFILE_LIST(11) "C:/Users/javos/workspace/Mycpu/Mycpu/lib/latticesemi.com/module/apb0/1.2.0/apb0.ipx"

set index [array names VFILE_LIST]
if { [file exists $radiant_project] == 1} {
    prj_open $radiant_project
    prj_set_device -part $DEVICE -performance 7_High-Performance_1.0V
} else {
    prj_create -name "Mycpu" -impl "impl_1" -dev $DEVICE -performance 7_High-Performance_1.0V -synthesis "synplify"
    prj_save
}


foreach i $index {
    if { [catch {prj_add_source $VFILE_LIST($i)} fid] } {
        puts "file already exists in project."
    }
}

prj_save

