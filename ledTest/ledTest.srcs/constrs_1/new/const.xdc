# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	



set_property PACKAGE_PIN W19 [get_ports up]						
	set_property IOSTANDARD LVCMOS33 [get_ports up]
set_property PACKAGE_PIN T17 [get_ports down]						
	set_property IOSTANDARD LVCMOS33 [get_ports down]


## Switches
set_property PACKAGE_PIN V17 [get_ports {showHighScore}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {showHighScore}]



#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {rows[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[7]}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {rows[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[6]}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {rows[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[5]}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {rows[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[4]}]


#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {rows[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[3]}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {rows[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[2]}]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {rows[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[1]}]
#Sch name = JB10 
set_property PACKAGE_PIN C16 [get_ports {rows[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rows[0]}]


#Pmod Header JC
#Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {DS}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DS}]
#Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {OE}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {OE}]
#Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports {st_cp}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {st_cp}]
#Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {sh_cp}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sh_cp}]
#Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
	
#7 segment display
    set_property PACKAGE_PIN W7 [get_ports {a}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {a}]
    set_property PACKAGE_PIN W6 [get_ports {b}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {b}]
    set_property PACKAGE_PIN U8 [get_ports {c}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {c}]
    set_property PACKAGE_PIN V8 [get_ports {d}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {d}]
    set_property PACKAGE_PIN U5 [get_ports {e}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {e}]
    set_property PACKAGE_PIN V5 [get_ports {f}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {f}]
    set_property PACKAGE_PIN U7 [get_ports {g}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {g}]
    
    set_property PACKAGE_PIN V7 [get_ports dp]                            
        set_property IOSTANDARD LVCMOS33 [get_ports dp]
    
    set_property PACKAGE_PIN U2 [get_ports {an[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
    set_property PACKAGE_PIN U4 [get_ports {an[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
    set_property PACKAGE_PIN V4 [get_ports {an[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
    set_property PACKAGE_PIN W4 [get_ports {an[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
