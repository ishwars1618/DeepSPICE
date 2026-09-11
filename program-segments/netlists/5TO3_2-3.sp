* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
MP1 btwnP1 gate1 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP2 out gate2 btwnP1 btwnP1 P1 W=20u L=0.18u Pd=11u Ps=11u
MP3 out gate3 btwnP1 btwnP1 P1 W=20u L=0.18u Pd=11u Ps=11u
* N transistors (capacitor -> ground)
MN1 out gate1 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
MN2 out gate2 btwnN121 btwnN121 N1 W=10u L=0.18u Pd=11u Ps=11u
MN3 btwnN121 gate3 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
* capacitor (load / output)
Cload out 0 5fF
