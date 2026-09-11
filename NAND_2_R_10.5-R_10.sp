* SOI Inverter
* Mx  Drain Gate Source Back-gate(substrate) Body  Tx  W  L (body ommitted for FB)

.include /Users/Ishwar/Desktop/ML-Spice/ngspice-35.prev/examples/soi/bsim4soi/nmos4p0.mod
.include /Users/Ishwar/Desktop/ML-Spice/ngspice-35.prev/examples/soi/bsim4soi/pmos4p0.mod
.option TEMP=27C

* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
MP1 out gate1 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP2 out gate2 power power P1 W=20u L=0.18u Pd=11u Ps=11u
* N transistors (capacitor -> ground)
MN1 out gate1 btwnN btwnN N1 W=20u L=0.18u Pd=11u Ps=11u
MN2 btwnN gate2 0 0 N1 W=20u L=0.18u Pd=11u Ps=11u
* capacitor (load / output)
Cload out 0 5fF

* Gate inputs

Vgate1 gate1 0 PWL (0 0v 90ps 0v 110ps HIGHv 200ps HIGHv)

Vgate2 gate2 0 PWL (0 0v 90ps 0v 110ps HIGHv 200ps HIGHv)
