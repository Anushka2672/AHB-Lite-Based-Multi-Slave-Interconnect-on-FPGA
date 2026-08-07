###############################################################################
## CLOCK
###############################################################################
set_property PACKAGE_PIN E3 [get_ports hclk]
set_property IOSTANDARD LVCMOS33 [get_ports hclk]
create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports hclk]

###############################################################################
## RESET (CPU_RESETN)
###############################################################################
set_property PACKAGE_PIN C12 [get_ports hreset]
set_property IOSTANDARD LVCMOS33 [get_ports hreset]

###############################################################################
## BUTTONS
###############################################################################

## BTN0 -> Enable
set_property PACKAGE_PIN N17 [get_ports enable]
set_property IOSTANDARD LVCMOS33 [get_ports enable]

## BTN1 -> Write
set_property PACKAGE_PIN M18 [get_ports write]
set_property IOSTANDARD LVCMOS33 [get_ports write]

###############################################################################
## SWITCHES
###############################################################################

## addr[7:0]  -> SW0-SW7

set_property PACKAGE_PIN J15 [get_ports {addr[0]}]
set_property PACKAGE_PIN L16 [get_ports {addr[1]}]
set_property PACKAGE_PIN M13 [get_ports {addr[2]}]
set_property PACKAGE_PIN R15 [get_ports {addr[3]}]
set_property PACKAGE_PIN R17 [get_ports {addr[4]}]
set_property PACKAGE_PIN T18 [get_ports {addr[5]}]
set_property PACKAGE_PIN U18 [get_ports {addr[6]}]
set_property PACKAGE_PIN R13 [get_ports {addr[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {addr[*]}]

###############################################################################
## SWITCHES
###############################################################################

## data[3:0] -> SW8-SW11

set_property PACKAGE_PIN T8 [get_ports {data[0]}]
set_property PACKAGE_PIN U8 [get_ports {data[1]}]
set_property PACKAGE_PIN R16 [get_ports {data[2]}]
set_property PACKAGE_PIN T13 [get_ports {data[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data[*]}]



###############################################################################
## SEVEN SEGMENT DISPLAY
###############################################################################

set_property PACKAGE_PIN T10 [get_ports {seg[0]}]
set_property PACKAGE_PIN R10 [get_ports {seg[1]}]
set_property PACKAGE_PIN K16 [get_ports {seg[2]}]
set_property PACKAGE_PIN K13 [get_ports {seg[3]}]
set_property PACKAGE_PIN P15 [get_ports {seg[4]}]
set_property PACKAGE_PIN T11 [get_ports {seg[5]}]
set_property PACKAGE_PIN L18 [get_ports {seg[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]

###############################################################################
## DECIMAL POINT
###############################################################################

set_property PACKAGE_PIN H15 [get_ports dp]
set_property IOSTANDARD LVCMOS33 [get_ports dp]

###############################################################################
## ANODES
###############################################################################

set_property PACKAGE_PIN J17 [get_ports {an[0]}]
set_property PACKAGE_PIN J18 [get_ports {an[1]}]
set_property PACKAGE_PIN T9 [get_ports {an[2]}]
set_property PACKAGE_PIN J14 [get_ports {an[3]}]
set_property PACKAGE_PIN P14 [get_ports {an[4]}]
set_property PACKAGE_PIN T14 [get_ports {an[5]}]
set_property PACKAGE_PIN K2 [get_ports {an[6]}]
set_property PACKAGE_PIN U13 [get_ports {an[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an[*]}]

set_property PACKAGE_PIN H17 [get_ports pwm_out]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_out]
