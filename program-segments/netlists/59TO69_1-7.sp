* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
* first series component
MP1 btwnP11 gate1 power power P1 W=90u L=0.18u 
MP2 btwnP12 gate2 btwnP11 btwnP11 P1 W=90u L=0.18u 
MP3 out gate4 btwnP12 btwnP12 P1 W=90u L=0.18u 
MP4 btwnP13 gate5 btwnP11 btwnP11 P1 W=90u L=0.18u 
MP5 out gate6 btwnP13 btwnP13 P1 W=90u L=0.18u 

MP6 btwnP21 gate3 power power P1 W=90u L=0.18u 
MP7 btwnP22 gate2 btwnP21 btwnP21 P1 W=90u L=0.18u 
MP8 out gate5 btwnP22 btwnP22 P1 W=90u L=0.18u 
MP9 btwnP23 gate4 btwnP21 btwnP21 P1 W=90u L=0.18u 
MP10 out gate6 btwnP23 btwnP23 P1 W=90u L=0.18u 

MP11 btwnP31 gate7 power power P1 W=90u L=0.18u 
MP12 btwnP32 gate4 btwnP31 btwnP31 P1 W=90u L=0.18u 
MP13 out gate5 btwnP32 btwnP32 P1 W=90u L=0.18u 
MP14 btwnP33 gate2 btwnP31 btwnP31 P1 W=90u L=0.18u 
MP15 out gate6 btwnP33 btwnP33 P1 W=90u L=0.18u 

* N transistors (capacitor -> ground)
* first series component

MN1 out gate1 btwnN12 btwnN12 N1 W=60u L=0.18u 
MN2 out gate2 btwnN11 btwnN11 N1 W=60u L=0.18u 
MN3 out gate4 btwnN11 btwnN11 N1 W=60u L=0.18u 
MN4 btwnN11 gate5 btwnN12 btwnN12 N1 W=60u L=0.18u 
MN5 btwnN11 gate6 btwnN12 btwnN12 N1 W=60u L=0.18u 

MN6 btwnN12 gate3 btwnN14 btwnN14 N1 W=60u L=0.18u 
MN7 btwnN12 gate2 btwnN13 btwnN13 N1 W=60u L=0.18u 
MN8 btwnN12 gate5 btwnN13 btwnN13 N1 W=60u L=0.18u 
MN9 btwnN13 gate4 btwnN14 btwnN14 N1 W=60u L=0.18u 
MN10 btwnN13 gate6 btwnN14 btwnN14 N1 W=60u L=0.18u 

MN11 btwnN14 gate7 0 0 N1 W=60u L=0.18u 
MN12 btwnN14 gate4 btwnN15 btwnN15 N1 W=60u L=0.18u 
MN13 btwnN14 gate5 btwnN15 btwnN15 N1 W=60u L=0.18u 
MN14 btwnN15 gate2 0 0 N1 W=60u L=0.18u 
MN15 btwnN15 gate6 0 0 N1 W=60u L=0.18u 

* capacitor (load / output)
Cload out 0 5fF
