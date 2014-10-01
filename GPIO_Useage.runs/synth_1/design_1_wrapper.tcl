# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]

add_files C:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_rst_processing_system7_0_100M_0/design_1_rst_processing_system7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_rst_processing_system7_0_100M_0/design_1_rst_processing_system7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_rst_processing_system7_0_100M_0/design_1_rst_processing_system7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/design_1_ooc.xdc]
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files C:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/design_1.bd]

read_verilog -library xil_defaultlib C:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
read_xdc C:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/constrs_1/imports/DEFINITION/ZYBO_Master.xdc
set_property used_in_implementation false [get_files C:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.srcs/constrs_1/imports/DEFINITION/ZYBO_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Xilinx_Project_Vivado/GPIO_Useage/GPIO_Useage.cache/wt [current_project]
set_property parent.project_dir C:/Xilinx_Project_Vivado/GPIO_Useage [current_project]
catch { write_hwdef -file design_1_wrapper.hwdef }
synth_design -top design_1_wrapper -part xc7z010clg400-1
write_checkpoint design_1_wrapper.dcp
report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb
