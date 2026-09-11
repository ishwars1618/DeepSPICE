* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
MP1 btwnP11 gate1 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP2 btwnP21 gate5 btwnP11 btwnP11 P1 W=20u L=0.18u Pd=11u Ps=11u

MP3 btwnP21 gate3 power power P1 W=20u L=0.18u Pd=11u Ps=11u

MP4 out gate2 btwnP21 btwnP21 P1 W=20u L=0.18u Pd=11u Ps=11u
MP5 out gate4 btwnP21 btwnP21 P1 W=20u L=0.18u Pd=11u Ps=11u

* N transistors (capacitor -> ground)
MN1 out gate1 btwnN11 btwnN11 N1 W=10u L=0.18u Pd=11u Ps=11u
MN2 out gate5 btwnN11 btwnN11 N1 W=10u L=0.18u Pd=11u Ps=11u

MN3 btwnN11 gate3 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u

MN4 out gate2 btwnN12 btwnN12 N1 W=10u L=0.18u Pd=11u Ps=11u
MN5 btwnN12 gate4 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
* capacitor (load / output)
Cload out 0 5fF
