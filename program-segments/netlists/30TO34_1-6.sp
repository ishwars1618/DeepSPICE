* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
* first series component
MP1 btwnP11 gate4 power power P1 W=90u L=0.18u Pd=11u Ps=11u
MP2 btwnP11 gate5 power power P1 W=90u L=0.18u Pd=11u Ps=11u
MP3 btwnP11 gate6 power power P1 W=90u L=0.18u Pd=11u Ps=11u

MP4 btwnP12 gate1 btwnP11 btwnP11 P1 W=90u L=0.18u Pd=11u Ps=11u
MP5 out gate3 btwnP12 btwnP12 P1 W=90u L=0.18u Pd=11u Ps=11u

MP6 btwnP21 gate5 power power P1 W=90u L=0.18u Pd=11u Ps=11u

MP7 btwnP22 gate1 btwnP21 btwnP21 P1 W=90u L=0.18u Pd=11u Ps=11u
MP8 out gate4 btwnP22 btwnP22 P1 W=90u L=0.18u Pd=11u Ps=11u
MP9 out gate6 btwnP22 btwnP22 P1 W=90u L=0.18u Pd=11u Ps=11u

MP10 btwnP23 gate3 btwnP21 btwnP21 P1 W=90u L=0.18u Pd=11u Ps=11u
MP11 out gate2 btwnP23 btwnP23 P1 W=90u L=0.18u Pd=11u Ps=11u
MP12 out gate4 btwnP23 btwnP23 P1 W=90u L=0.18u Pd=11u Ps=11u

MP13 btwnP31 gate2 power power P1 W=90u L=0.18u Pd=11u Ps=11u
MP14 btwnP32 gate4 btwnP31 btwnP31 P1 W=90u L=0.18u Pd=11u Ps=11u
MP15 out gate6 btwnP32 btwnP32 P1 W=90u L=0.18u Pd=11u Ps=11u

* N transistors (capacitor -> ground)
* first series component
MN1 out gate4 btwnN11 btwnN11 N1 W=60u L=0.18u Pd=11u Ps=11u
MN2 btwnN11 gate5 btwnN12 btwnN12 N1 W=60u L=0.18u Pd=11u Ps=11u
MN3 btwnN12 gate6 btwnN21 btwnN21 N1 W=60u L=0.18u Pd=11u Ps=11u

MN4 out gate1 btwnN21 btwnN21 N1 W=60u L=0.18u Pd=11u Ps=11u
MN5 out gate3 btwnN21 btwnN21 N1 W=60u L=0.18u Pd=11u Ps=11u

* second parallel component
MN6 btwnN21 gate5 btwnN31 btwnN31 N1 W=60u L=0.18u Pd=11u Ps=11u

MN7 btwnN21 gate1 btwnN23 btwnN23 N1 W=60u L=0.18u Pd=11u Ps=11u
MN8 btwnN21 gate4 btwnN22 btwnN22 N1 W=60u L=0.18u Pd=11u Ps=11u
MN9 btwnN22 gate6 btwnN23 btwnN23 N1 W=60u L=0.18u Pd=11u Ps=11u

MN10 btwnN23 gate3 btwnN31 btwnN31 N1 W=60u L=0.18u Pd=11u Ps=11u
MN11 btwnN23 gate2 btwnN24 btwnN24 N1 W=60u L=0.18u Pd=11u Ps=11u
MN12 btwnN24 gate4 btwnN31 btwnN31 N1 W=60u L=0.18u Pd=11u Ps=11u

MN13 btwnN31 gate2 0 0 N1 W=60u L=0.18u Pd=11u Ps=11u
MN14 btwnN31 gate4 0 0 N1 W=60u L=0.18u Pd=11u Ps=11u
MN15 btwnN31 gate6 0 0 N1 W=60u L=0.18u Pd=11u Ps=11u

* capacitor (load / output)
Cload out 0 5fF
