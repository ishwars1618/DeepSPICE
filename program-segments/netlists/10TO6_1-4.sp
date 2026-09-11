* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
* first parallel component
MP1 btwnP111 gate1 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP2 out gate4 btwnP111 btwnP111 P1 W=20u L=0.18u Pd=11u Ps=11u
* second parallel component
MP3 btwnP121 gate2 power power P1 W=20u L=0.18u Pd=11u Ps=11u
MP4 btwnP122 gate3 btwnP121 btwnP121 P1 W=20u L=0.18u Pd=11u Ps=11u
MP5 out gate1 btwnP122 btwnP122 P1 W=20u L=0.18u Pd=11u Ps=11u
MP6 out gate4 btwnP122 btwnP122 P1 W=20u L=0.18u Pd=11u Ps=11u
* N transistors (capacitor -> ground)
* first series component
MN1 out gate1 btwnN1 btwnN1 N1 W=10u L=0.18u Pd=11u Ps=11u
MN2 out gate4 btwnN1 btwnN1 N1 W=10u L=0.18u Pd=11u Ps=11u
* second series component
MN3 btwnN1 gate2 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
MN4 btwnN1 gate3 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
MN5 btwnN1 gate1 btwnN231 btwnN231 N1 W=10u L=0.18u Pd=11u Ps=11u
MN6 btwnN231 gate4 0 0 N1 W=10u L=0.18u Pd=11u Ps=11u
* capacitor (load / output)
Cload out 0 5fF
