## This file is a general .xdc for FPGAOL_BOARD (adopted from Nexys4 DDR Rev. C)
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]


## FPGAOL LED (signle-digit-SEGPLAY)

set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {y[0]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {y[1]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {y[2]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {y[3]}]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports {y[4]}]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {y[5]}]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { led[6] }];
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports z]


## FPGAOL SWITCH

set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports {x[0]}]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports {x[1]}]
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports {x[2]}]
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {x[3]}]
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports {x[4]}]
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports {x[5]}]
#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { sw[6] }];
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports {sel[0]}]
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { sw[7] }];
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports {sel[1]}]


## FPGAOL HEXPLAY

#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { hexplay_data[0] }];
#set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33 } [get_ports { hexplay_data[1] }];
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { hexplay_data[2] }];
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { hexplay_data[3] }];
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { hexplay_an[0] }];
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { hexplay_an[1] }];
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { hexplay_an[2] }];

## FPGAOL BUTTON & SOFT_CLOCK

set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports en]

##USB-RS232 Interface

#set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_TXD_IN }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
#set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_RXD_OUT }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
#set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { UART_CTS }]; #IO_L12N_T1_MRCC_35 Sch=uart_cts
#set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { UART_RTS }]; #IO_L5N_T0_AD13N_35 Sch=uart_rts

set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {sel[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports {sel[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {x[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports {x[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports en]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports en]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {y[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports {y[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports z]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports z]