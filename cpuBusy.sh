g++ DdrBusy.c -o DdrBusy
yes > /dev/null &
./DdrBusy &
ps -la
htop
