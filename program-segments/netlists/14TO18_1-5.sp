* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
* first parallel component
MP1 btwnP11 gate1 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP2 btwnP12 gate4 btwnP11 btwnP11 P1 W=20u L=0.18u Pd=11u Ps=11u
MP3 out gate5 btwnP12 btwnP12 P1 W=20u L=0.18u Pd=11u Ps=11u
* second parallel component
MP4 btwnP21 gate4 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP5 btwnP21 gate2 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP6 out gate3 btwnP21 btwnP21 P1 W=20u L=0.18u Pd=11u Ps=11u
* N transistors (capacitor -> ground)
* first series component
MN1 out gate3 btwnN21 btwnN21 N1 W=10u L=0.18u Pd=11u Ps=11u
MN2 out gate2 btwnN11 btwnN11 N1 W=10u L=0.18u Pd=11u Ps=11u
MN3 btwnN11 gate4 btwnN21 btwnN21 N1 W=10u L=0.18u Pd=11u Ps=11u
* second series component
MN4 btwnN21 gate1 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
MN5 btwnN21 gate4 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
MN6 btwnN21 gate5 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
* capacitor (load / output)
Cload out 0 5fF
