
* outputs the simulation results for the circuit
.tran 2p 200ps
* .print tran LIST_GATES v(out)
* .measure tran tdiff TRIG v(gateCHNUMBER) VAL=VOLT_IN CROSS=1 TARG v(out) VAL=VOLT_OUT CROSS=1
.control
	run
	meas tran tdiff trig V(gateCHNUMBER) val=VOLT_IN cross=1 targ V(out) val=VOLT_OUT cross=1
	let tp1=tdiff*1e12
	echo  "Delay: $&tp1" > F_OUT
	$plot LIST_GATES v(out)
.endc

.END
