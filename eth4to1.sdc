
#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {SFP_REFCLK_p} -period 1.551 -waveform { 0.000 0.775 } [get_ports {SFP_REFCLK_p}]
create_clock -name {OSC_50_B3B} -period 20.000 -waveform { 0.000 10.000 } [get_ports { OSC_50_B3B }]


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[0]*}] -to [get_keepers {local_freeze312[0]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[1]*}] -to [get_keepers {local_freeze312[1]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[2]*}] -to [get_keepers {local_freeze312[2]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[3]*}] -to [get_keepers {local_freeze312[3]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[4]*}] -to [get_keepers {local_freeze312[4]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[5]*}] -to [get_keepers {local_freeze312[5]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[6]*}] -to [get_keepers {local_freeze312[6]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_freeze[7]*}] -to [get_keepers {local_freeze312[7]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[0]*}] -to [get_keepers {local_enable312[0]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[1]*}] -to [get_keepers {local_enable312[1]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[2]*}] -to [get_keepers {local_enable312[2]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[3]*}] -to [get_keepers {local_enable312[3]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[4]*}] -to [get_keepers {local_enable312[4]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[5]*}] -to [get_keepers {local_enable312[5]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[6]*}] -to [get_keepers {local_enable312[6]}]
set_false_path -from [get_keepers {eth4to1:u0|regioncontrol:ethpack_control|coe_region_enable[7]*}] -to [get_keepers {local_enable312[7]}]

set_false_path -from [get_registers *rulemem*we_reg] -to [get_registers *binarysearch*lb*]
set_false_path -from [get_registers *rulemem*we_reg] -to [get_registers *binarysearch*ub*]
set_false_path -from [get_registers *rulemem*we_reg] -to [get_registers *binarysearch*matchactive*]
set_false_path -from [get_registers *rulemem*we_reg] -to [get_registers *binarysearch*matchfound*]