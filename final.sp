Cmfb added to telescope and gain boosting
.op
.lib mc018.l tt
.param gas=1
.ac dec 5 2 600meg
*.print ac par('db(v(voutp)+v(voutn))')
.print ac par('db(v(voutp))')
*.print ac par('db(v(a))')

*****CMRR*****
*vinp vinp gnd dc 1.25 ac 1 0
*vinn vinn gnd dc 1.25 ac 1 0
***************

**** PSRR Pos******

vdd vdd gnd  dc 2.5 ac 1 0
vinp vinp gnd 1.25 
vinn vinn gnd 1.25 



**********************************
*           opamp                *
**********************************
*vdd vdd gnd 2.5
*vb1 vb1 gnd 1.8
*vb2 vb2 gnd 1.4
*vb3 vb3 gnd 1.5
*vinp vinp gnd dc 1.25 ac 0.5 0
*vinn vinn gnd dc 1.25 ac 0.5 180
*iss iss gnd 200u

miss iss vbtail gnd gnd nch l=2u w=78.53u
vbtail vbtail gnd 0.6

***********************
*biasing voltages
***********************
*va a gnd 2.2
*vb b gnd 2.2
*von voutn gnd 1.25
*vop voutp gnd 1.25
*vc c gnd 0.725
*vd d gnd 0.725
*viss iss gnd 0.2

***********************
*mosfets
***********************
m7 a vb1 vdd vdd pch l=0.7u w=36.5u 
m8 b vb1 vdd vdd pch l=0.7u w=36.5u
m5 voutn g5 a vdd pch l=0.7u w=33u 
m6 voutp g6 b vdd pch l=0.7u w=33u
m3 voutn g3 c gnd nch l=0.7u w=12.45u
m4 voutp g4 d gnd nch l=0.7u w=12.45u
m1 c vinp iss gnd nch l=0.8u w=40.75u
m2 d vinn iss gnd nch l=0.8u w=40.75u
cln voutn gnd 10pf
clp voutp gnd 10pf

****************************
*          CMFB            *
****************************
*************
*mosfets
*************
m11 vdd voutn iss11 gnd nch l=0.5u w=2.77u
m22 vb1 vb11 iss11 gnd nch l=0.5u w=2.9u
m33 vdd voutp iss22 gnd nch l=0.5u w=2.77u
m44 vb1 vb11 iss22 gnd nch l=0.5u w=2.9u
m55 vb1 vb1 vdd vdd pch l=0.3u w=1.56u

*************
*current sources
**************
iss11 iss11 gnd 10u	
iss22 iss22 gnd 10u

***************
*biasing voltage
***************
*vdd vdd gnd 2.5
vb11 vb11 gnd 1.25

*viss11 iss11 gnd 0.6
*viss22 iss22 gnd 0.6
*vx x gnd 1.8
*voutn voutn gnd dc 1.25 ac 0.5 180
*voutp voutp gnd dc 1.25 ac 0.5 0

******************************
*** Gain boosting downside ***
******************************

*vdd vdd gnd 2.5
vbg1 vbg1 gnd 1.3
vbg4 vbg4 gnd 1.3
*vc c gnd dc 0.7 ac 0.5 0
*vd d gnd dc 0.7 ac 0.5 180

ig1 vdd z 10u
ig2 vdd g3 5u
ig3 vdd g4 5u
ig4 ig4 gnd 10u
ig5 ig5 gnd 10u

*vz z gnd 1.6
*vig4 ig4 gnd 0.5
*vig5 ig5 gnd 0.5
*vg3 g3 gnd 1.5
*vg4 g4 gnd 1.5


mg1 g3 vbg1 ig4 gnd nch l=1u w=0.56u
mg2 ig4 c z vdd pch l=0.5u w=2.05u
mg3 ig5 d z vdd pch l=0.5u w=2.05u
mg4 g4 vbg4 ig5 gnd nch l=1u w=0.56u


******************************
*** Gain boosting upside *****
******************************

vbg5 vbg5 gnd 1
vbig6 vbig6 gnd 1.6
vbig7 vbig7 gnd 0.6
vbg8 vbg8 gnd 1
vbig8 vbig8 gnd 1.6
vbig9 vbig9 gnd 0.6
vbig10 vbig10 gnd 0.6

*ig6 z1 gnd 20u
*ig7 g5 gnd 10u
*ig8 g6 gnd 10u
*ig9 vdd ig9 20u
*ig10 vdd ig10 20u


*vz1 z1 gnd 1.6
*vig9 ig9 gnd 1.2
*vig10 ig10 gnd 1.2
*vg5 g5 gnd 1.5
*vg6 g6 gnd 1.5


mig6 ig6 vbig6 vdd vdd pch l=1u w=1.818u
mig7 g5 vbig7 gnd gnd nch l=3u w=2.82u
mig8 ig8 vbig8 vdd vdd pch l=1u w=1.818u
mig9 g6 vbig9 gnd gnd nch l=3u w=2.82u
mig10 y vbig10 gnd gnd nch l=1u w=2.38u




mg5 ig6 a y gnd nch l=1u w=1.24u
mg6 g5 vbg5 ig6 vdd pch l=1.4u w=8.51u
mg7 ig8 b y gnd nch l=1u w=1.24u
mg8 g6 vbg8 ig8 vdd pch l=1.4u w=8.51u


.end