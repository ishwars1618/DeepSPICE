* power source
Vpower power 0 HIGH
* P transistors (battery -> capacitor)
* first series component
MP1 btwnP11 gate4 power power P1 W=90u L=0.18u 
MP2 btwnP11 gate5 power power P1 W=90u L=0.18u 
MP3 btwnP11 gate6 power power P1 W=90u L=0.18u 

MP4 btwnP12 gate1 btwnP11 btwnP11 P1 W=90u L=0.18u 
MP5 out gate3 btwnP12 btwnP12 P1 W=90u L=0.18u 

MP6 btwnP21 gate5 power power P1 W=90u L=0.18u 

MP7 btwnP22 gate4 btwnP21 btwnP21 P1 W=90u L=0.18u 
MP8 out gate1 btwnP22 btwnP22 P1 W=90u L=0.18u 
MP9 out gate3 btwnP22 btwnP22 P1 W=90u L=0.18u 

MP10 btwnP23 gate2 btwnP21 btwnP21 P1 W=90u L=0.18u 
MP11 out gate3 btwnP23 btwnP23 P1 W=90u L=0.18u 

* N transistors (capacitor -> ground)
MN1 out gate4 btwnN11 btwnN11 N1 W=60u L=0.18u 
MN2 btwnN11 gate5 btwnN12 btwnN12 N1 W=60u L=0.18u 
MN3 btwnN12 gate6 btwnN21 btwnN21 N1 W=60u L=0.18u 

MN4 out gate1 btwnN21 btwnN21 N1 W=60u L=0.18u 
MN5 out gate3 btwnN21 btwnN21 N1 W=60u L=0.18u 

MN6 btwnN21 gate5 0 0 N1 W=60u L=0.18u 

MN7 btwnN21 gate2 btwnN22 btwnN22 N1 W=60u L=0.18u 
MN8 btwnN21 gate3 btwnN22 btwnN22 N1 W=60u L=0.18u 

MN9 btwnN22 gate4 0 0 N1 W=60u L=0.18u 
MN10 btwnN22 gate1 btwnN23 btwnN23 N1 W=60u L=0.18u 
MN11 btwnN23 gate3 0 0 N1 W=60u L=0.18u 

* capacitor (load / output)
Cload out 0 5fF
