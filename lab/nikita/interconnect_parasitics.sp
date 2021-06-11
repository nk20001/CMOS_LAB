################### Interconnect Parasitics #########################

*.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
*.TEMP 27

*Pulse Input
vin in 0 pulse 0 2.5 2n 1p 1p 10n 20n


*Lumped Model Definition
Rl in outl 15k
Cl outl 0 192f


*T-model definition
Rt1 in n1 7.5k
Rt2 n1 outt 7.5k
Ct n1 0 192f


*Pi-Model definition
Rp in outp 15k
Cp1 in 0 96f
Cp2 outp 0 96f

*distributed Model Definition
Rd1 in nd1 1.5k
Rd2 nd1 nd2 1.5k
Rd3 nd2 nd3 1.5k
Rd4 nd3 nd4 1.5k
Rd5 nd4 nd5 1.5k
Rd6 nd5 nd6 1.5k
Rd7 nd6 nd7 1.5k
Rd8 nd7 nd8 1.5k
Rd9 nd8 nd9 1.5k
Rd10 nd9 outd 1.5k

Cd1 nd1 0 19.2f
Cd2 nd2 0 19.2f
Cd3 nd3 0 19.2f
Cd4 nd4 0 19.2f
Cd5 nd5 0 19.2f
Cd6 nd6 0 19.2f
Cd7 nd7 0 19.2f
Cd8 nd8 0 19.2f
Cd9 nd9 0 19.2f
Cd10 outd 0 19.2f


.TRAN 5p 25n


.CONTROL
run
plot v(in) v(outl) v(outt) v(outp)+3 v(outd)
.ENDC

.measure tran tdiff trig v(in) val=1.25 RISE=1 TARG v(outl) val=1.25 RISE=1
.measure tran tdiff trig v(in) val=1.25 RISE=1 TARG v(outd) val=1.25 RISE=1


.END
