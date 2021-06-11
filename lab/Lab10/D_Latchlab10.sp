***** Spice Netlist for Cell 'D_Latchlab10' *****
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27
.GLOBAL vdd gnd

***********************Testbench*****************
v0 vdd gnd DC 2.5
v1 D gnd pulse 0 2.5 1.5n 100p 100p 3n 6n
v2 CK gnd pulse 0 2.5 1.5n 100p 100p 6n 12n
Xdlatch D CK Q D_Latchlab10



************** Module D_Latchlab10 **************
.subckt D_Latchlab10 d ck q example_param=1.0
xi0 d n2 Lab10_inv
xi1 n0 q Lab10_inv
xi2 q n1 Lab10_inv
xi3 ck cklb Lab10_inv
xi4 clkb clk Lab10_inv                         
xi5 n2 n0 clkb clk TX_Gatelab10
xi6 n1 n0 clk clkb TX_Gatelab10
.ends D_Latchlab10


************** Module TX_Gatelab10 **************
.subckt TX_Gatelab10 input output ckb ck example_param=1.0
m0 input ck output vdd scmosp w='0.6u' l='0.4u' m='1'
m1 input ckb output gnd scmosn w='0.6u' l='0.4u' m='1'
.ends TX_Gatelab10

************** Module Lab10_inv **************
.subckt Lab10_inv input output example_param=1.0
m0 output input vdd vdd scmosp w='2.5u' l='0.4u' m='1' 
m1 output input gnd gnd scmosn w='1u' l='0.4u' m='1' 
.ends Lab10_inv


.tran 5p 25n
.control
RUN
PLOT v(D) v(CK) V(Q)
.endc
.end

