#!/bin/bash
#pru0 master
#clk_out :  r30.15, p8_11 , 6_pD
#ssbar2 : r30.5 , p9_27 , 5_pu
#ssbar1 : r30.3 , p9_28 , 5_pd ; r30.7 , p9_25 , 5_pu
#miso_in : r31.14 , p8_16, 6_pu
#mosi_out: r30.0 , p9_31 , 6_pd ; r30.14 , p8_12 , 6_pd
#trans_on: r30.3 , p9_28 , 5_pd

config-pin P8.11 pruout
config-pin P9.27 pruout
config-pin P9.28 pruout
#config-pin P9.25 pruout
config-pin P8.16 pruin
#config-pin P8.12 pruout
config-pin P9.31  pruout
#test
#config-pin P9.29  pruout
#config-pin P9.30  pruout
#config-pin P8.12  pruout

#pru1 slave
#clk_in : r31.16, p9_26 , 6_pd
#ssbar_in : r31.9 , p8_29 , 6_pu
#mosi_in : r31.10 , p8_28, 6_pu
#miso_out: r30.8 , p8_27 , 5_pd



