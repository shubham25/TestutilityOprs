#!/bin/bash
##pru1 1153
##clk_out :   r30.8 , p8_27 , 6_pd ; r30.10, p8_28 , 6_pD
##ssbar2 : r30.5 , p8_42 , 5_pu
##ssbar1 : r30.3 , p8_44 , 5_pu ; r30.7 , p8_40 , 5_pu
##miso_in : r31.6 , p8_39, 6_pu ; r30.7 , p8_40 , 6_pu;  ;, r31.11 , p8_30, 6_pu
##mosi_out: r30.1 , p8_46 , 6_pd  ;  r30.8 , p8_27 , 6_pd 
##test pin : r30.9 , p8_29 , 6_pd

config-pin P8.28 pruout
config-pin -q P8.28
#config-pin P8.27 pruout
#config-pin -q P8.27
#config-pin P8.30 pruout
#config-pin -q P8.30

config-pin P8.29 pruout
config-pin -q P8.29

config-pin P8.42 pruout
config-pin -q P8.42

config-pin P8.44 pruout
config-pin -q P8.44

config-pin P8.46 pruout
config-pin -q P8.46


#config-pin P8.40 pruin
#config-pin -q P8.40
config-pin P8.39 pruin
config-pin -q P8.39
#config-pin P8.30 pruin
#config-pin -q P8.30


