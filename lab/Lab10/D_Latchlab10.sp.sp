***** Spice Netlist for Cell 'D_Latchlab10' *****
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27

.GLOBAL vdd gnd 

*************************Testbench*********************
v0 vdd gnd DC 2.5
v1 D gnd pulse 0 2.5 1.5n 100p 100p 3n 6n
v2 Ck gnd pulse 0 2.5 1.5n 100p 100p 6 12n
xdlatch D CK Q D_Latchlab10




************** Module D_Latchlab10 **************
.subckt D_Latchlab10 ck d q example_param=1.0
xi0 d n2 Lab10_inv
xi2 n0 q Lab10_inv
xi5 ck clkb Lab10_inv
xi6 clkb clk Lab10_inv
xi1 n2 n0 clkb clk TX_Gatelab10
xi4 n1 n0 clk clkb TX_Gatelab10
xi3 q n1 Lab10_inv
.ends D_Latchlab10

************** Module Lab10_inv **************
.subckt Lab10_inv input output example_param=1.0
m0 output input dvdd dvdd scmosp w='2.5u' l='0.4u' m='1' 
m1 output input dgnd output scmosn w='1u' l='0.4u' m='1' 
.ends Lab10_inv

************** Module TX_Gatelab10 **************
.subckt TX_Gatelab10 input output ckb ck example_param=1.0
m0 input ckb output vdd scmosp w='0.6u' l='0.4u' m='1' 
m1 input ck output gnd scmosn w='0.6u' l='0.4u' m='1' 
.ends TX_Gatelab10


.tran 5p 25n
.control
RUN
PLOT v(D) v(CK) v(Q)
.end

