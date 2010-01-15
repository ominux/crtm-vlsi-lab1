* FILE: eightbitadder.sp

********************** begin header *****************************

* Sample Header file for Generic 2.5V 0.25 um process (g25)

.OPTIONS post ACCT OPTS lvltim=2
.OPTIONS post_version=9007

**################################################
* Only Typical/Typical models included
* NEED TO CHANGE ${MMI_TOOLS} TO BE PHYSICAL PATH
.include '/cad2/mmi_local/sue/g25.mod'
* NOTE: these are contrived spice models
**################################################

.param  arean(w,sdd) = '(w*sdd*1p)'
.param  areap(w,sdd) = '(w*sdd*1p)'
* Setup either one or the other of the following
* For ACM=0,2,10,12 fet models
.param  perin(w,sdd) = '(2u*(w+sdd))'
.param  perip(w,sdd) = '(2u*(w+sdd))'
* For ACM=3,13 fet models
*.param  perin(w,sdd) = '(1u*(w+2*sdd))'
*.param  perip(w,sdd) = '(1u*(w+2*sdd))'

.param ln_min   =  0.25u
.param lp_min   =  0.25u

* used in source/drain area/perimeter calculation
.param sdd        =  0.95

.PARAM vddp=2.5		$ VDD voltage

VDD vdd 0 DC vddp 

.TEMP 105
.TRAN 10p 16n
*********************** end header ******************************

* SPICE netlist for "eightbitadder" (generated by MMI_SUE4.3.6)

.SUBCKT nand A B nandO 
M_1 nandO A vdd vdd p W='2*1u' L=lp_min ad='areap(2,sdd)' as='areap(2,sdd)' 
+ pd='perip(2,sdd)' ps='perip(2,sdd)' 
M_2 nandO B vdd vdd p W='2*1u' L=lp_min ad='areap(2,sdd)' as='areap(2,sdd)' 
+ pd='perip(2,sdd)' ps='perip(2,sdd)' 
M_3 nandO A net_1 gnd n W='2*1u' L=ln_min ad='arean(2,sdd)' 
+ as='arean(2,sdd)' pd='perin(2,sdd)' ps='perin(2,sdd)' 
M_4 net_1 B gnd gnd n W='2*1u' L=ln_min ad='arean(2,sdd)' as='arean(2,sdd)' 
+ pd='perin(2,sdd)' ps='perin(2,sdd)' 
.ENDS	$ nand

.SUBCKT nor A B O 
M_1 O B gnd gnd n W='1*1u' L=ln_min ad='arean(1,sdd)' as='arean(1,sdd)' 
+ pd='perin(1,sdd)' ps='perin(1,sdd)' 
M_2 O A gnd gnd n W='1*1u' L=ln_min ad='arean(1,sdd)' as='arean(1,sdd)' 
+ pd='perin(1,sdd)' ps='perin(1,sdd)' 
M_3 O B net_1 vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' as='areap(4,sdd)' 
+ pd='perip(4,sdd)' ps='perip(4,sdd)' 
M_4 net_1 A vdd vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' as='areap(4,sdd)' 
+ pd='perip(4,sdd)' ps='perip(4,sdd)' 
.ENDS	$ nor

.SUBCKT xor2 A B xorO 
Xnor A B net_2 nor 
M_1 xorO net_2 GND gnd n W='1*1u' L=ln_min ad='arean(1,sdd)' 
+ as='arean(1,sdd)' pd='perin(1,sdd)' ps='perin(1,sdd)' 
M_2 xorO A net_3 gnd n W='2*1u' L=ln_min ad='arean(2,sdd)' 
+ as='arean(2,sdd)' pd='perin(2,sdd)' ps='perin(2,sdd)' 
M_3 net_3 B GND gnd n W='2*1u' L=ln_min ad='arean(2,sdd)' as='arean(2,sdd)' 
+ pd='perin(2,sdd)' ps='perin(2,sdd)' 
M_4 xorO net_2 net_1 vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' 
+ as='areap(4,sdd)' pd='perip(4,sdd)' ps='perip(4,sdd)' 
M_5 net_1 A VDD vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' as='areap(4,sdd)' 
+ pd='perip(4,sdd)' ps='perip(4,sdd)' 
M_6 net_1 B VDD vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' as='areap(4,sdd)' 
+ pd='perip(4,sdd)' ps='perip(4,sdd)' 
.ENDS	$ xor2

.SUBCKT halfadder Ain Bin C S 
Xnand Ain Bin C nand 
Xxor2 Ain Bin S xor2 
.ENDS	$ halfadder

.SUBCKT fulladder A B Cin Cout S 
Xnand net_1 net_3 Cout nand 
Xhalfadder A B net_1 net_2 halfadder 
Xhalfadder_1 net_2 Cin net_3 S halfadder 
.ENDS	$ fulladder

* start main CELL eightbitadder
* .SUBCKT eightbitadder A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] B[0] B[1] 
*+ B[2] B[3] B[4] B[5] B[6] B[7] Cin Cout Sum[0] Sum[1] Sum[2] Sum[3] 
*+ Sum[4] Sum[5] Sum[6] Sum[7] 
Xfulladder A[0] B[0] Cin net_2 Sum[0] fulladder 
Xfulladder_1 A[1] B[1] net_2 net_7 Sum[1] fulladder 
Xfulladder_2 A[2] B[2] net_7 net_1 Sum[2] fulladder 
Xfulladder_3 A[3] B[3] net_1 net_5 Sum[3] fulladder 
Xfulladder_4 A[4] B[4] net_5 net_3 Sum[4] fulladder 
Xfulladder_5 A[5] B[5] net_3 net_6 Sum[5] fulladder 
Xfulladder_6 A[6] B[6] net_6 net_4 Sum[6] fulladder 
Xfulladder_7 A[7] B[7] net_4 Cout Sum[7] fulladder 
* .ENDS	$ eightbitadder

.GLOBAL gnd vdd

.END

