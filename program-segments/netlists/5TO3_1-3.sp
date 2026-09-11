* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
* first parallel component
MP1 out gate1 power power P1 W=20u L=0.18u Pd=11u Ps=11u
* second parallel component
MP2 btwnP121 gate2 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP3 out gate3 btwnP121 btwnP121 P1 W=20u L=0.18u Pd=11u Ps=11u
* N transistors (capacitor -> ground)
* first series component
MN1 out gate1 btwnN1 btwnN1 N1 W=10u L=0.18u Pd=11u Ps=11u
* second series component
MN2 btwnN1 gate2 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
MN3 btwnN1 gate3 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
* capacitor (load / output)
Cload out 0 5fF
