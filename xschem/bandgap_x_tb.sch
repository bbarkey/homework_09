v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -250 0 -250 40 {lab=VDD}
N -250 100 -250 130 {lab=0}
N 180 280 180 300 {lab=0}
N 150 180 180 180 {lab=Vref}
N 180 180 180 220 {lab=Vref}
N -170 180 -150 180 {lab=VDD}
N -170 170 -170 180 {lab=VDD}
N -170 200 -170 210 {lab=0}
N -170 200 -150 200 {lab=0}
N 150 50 250 50 {lab=Vref_wizard}
N 250 50 250 220 {lab=Vref_wizard}
N 250 280 250 300 {lab=0}
N -170 50 -150 50 {lab=VDD}
N -170 40 -170 50 {lab=VDD}
N -170 70 -170 80 {lab=0}
N -170 70 -150 70 {lab=0}
C {vdd.sym} -250 0 0 0 {name=l1 lab=VDD}
C {vsource.sym} -250 70 0 0 {name=Vdd value=3.3 savecurrent=false}
C {gnd.sym} -250 130 0 0 {name=l2 lab=0}
C {capa.sym} 180 250 0 0 {name=C1
m=1
value=100n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 180 300 0 0 {name=l3 lab=0}
C {lab_wire.sym} 180 180 0 0 {name=p1 sig_type=std_logic lab=Vref}
C {code_shown.sym} -480 180 0 0 {name=NGSPICE only_toplevel=false 
value=".optionw nflag=1
.include ../gds/bandgap.spice
.save all
.control
tran 10n 10u
plot V(Vref) V(Vref_wizard) title 'Vref vs time'
dc VDD 3.0 3.5 0.1
plot V(Vref) V(Vref_wizard) vs V(VDD) title 'Vref vs Vdd'
dc VDD 3.0 3.5 0.1 TEMP -40 40 10
plot V(Vref) V(Vref_wizard) vs V(VDD) title 'Vref vs Vdd vs Temp'
dc TEMP -40 40 10
plot V(Vref) V(Vref_wizard) title 'Vref vs Temp at VDD=3.3'
.endc"}
C {code.sym} -420 -10 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {vdd.sym} -170 170 0 0 {name=l4 lab=VDD}
C {gnd.sym} -170 210 0 0 {name=l5 lab=0}
C {capa.sym} 250 250 0 0 {name=C2
m=1
value=100n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 250 300 0 0 {name=l6 lab=0}
C {vdd.sym} -170 40 0 0 {name=l7 lab=VDD}
C {gnd.sym} -170 80 0 0 {name=l8 lab=0}
C {lab_wire.sym} 250 50 0 0 {name=p2 sig_type=std_logic lab=Vref_wizard}
C {/home/bbarkey/Documents/ECE_5120/homework_05/xschem/bandgap_x.sym} 0 190 0 0 {name=x1}
C {/home/bbarkey/Documents/ECE_5120/homework_05/xschem/bandgap.sym} 0 60 0 0 {name=x2}
