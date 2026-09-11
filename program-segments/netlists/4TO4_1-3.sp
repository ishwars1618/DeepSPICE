* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
* first parallel component
MP1 btwnP11 gate1 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP2 out gate3 btwnP11 btwnP11 P1 W=20u L=0.18u Pd=11u Ps=11u
* second parallel component
MP3 btwnP21 gate2 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP4 out gate1 btwnP21 btwnP21 P1 W=20u L=0.18u Pd=11u Ps=11u
MP5 out gate3 btwnP21 btwnP21 P1 W=20u L=0.18u Pd=11u Ps=11u
* N transistors (capacitor -> ground)
* first series component
MN1 out gate1 btwnN1to2 btwnN1to2 N1 W=10u L=0.18u Pd=11u Ps=11u
MN2 out gate3 btwnN1to2 btwnN1to2 N1 W=10u L=0.18u Pd=11u Ps=11u
* second series component
MN3 btwnN1to2 gate2 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
MN4 btwnN1to2 gate1 btwnN22 btwnN22 N1 W=10u L=0.18u Pd=11u Ps=11u
MN5 btwnN22 gate3 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
* capacitor (load / output)
Cload out 0 5fF
