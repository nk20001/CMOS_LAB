Extracting Vt, Kp, gamma for nmos

* Include the SCMOS library
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom



* Set the device  temprature
.TEMP 27

* NETLIST
M1       D1      D1     0      B        scmosn W=5u L=1u
Vds      D       0      DC     5
Vid1     D       D1     DC     0
Vsb      0       B      DC     0

* Analyses
.DC      Vds     0      5       0.001    Vsb 0 1 0.5

*  Script
.CONTROL
RUN
PLOT (2*Vid1#branch)^0.5 vs V(D)




.ENDC
.END


