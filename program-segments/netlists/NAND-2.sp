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
