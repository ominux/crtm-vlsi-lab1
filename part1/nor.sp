* FILE: nor.sp

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

* SPICE netlist for "nor" (generated by MMI_SUE4.3.6)

* start main CELL nor
* .SUBCKT nor A B O 
M_1 O B gnd gnd n W='1*1u' L=ln_min ad='arean(1,sdd)' as='arean(1,sdd)' 
+ pd='perin(1,sdd)' ps='perin(1,sdd)' 
M_2 O A gnd gnd n W='1*1u' L=ln_min ad='arean(1,sdd)' as='arean(1,sdd)' 
+ pd='perin(1,sdd)' ps='perin(1,sdd)' 
M_3 O B net_1 vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' as='areap(4,sdd)' 
+ pd='perip(4,sdd)' ps='perip(4,sdd)' 
M_4 net_1 A vdd vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' as='areap(4,sdd)' 
+ pd='perip(4,sdd)' ps='perip(4,sdd)' 
* .ENDS	$ nor

.GLOBAL gnd vdd

.END

