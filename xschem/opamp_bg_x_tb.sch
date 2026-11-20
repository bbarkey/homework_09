v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 280 -70 360 -70 {lab=Vout}
N 280 -50 340 -50 {lab=Vref}
N 340 -50 340 -30 {lab=Vref}
N -40 -70 -20 -70 {lab=#net1}
N -40 -120 -40 -70 {lab=#net1}
N 300 -120 300 -70 {lab=Vout}
N -40 -120 20 -120 {lab=#net1}
N 80 -120 140 -120 {lab=#net2}
N 200 -120 300 -120 {lab=Vout}
N -40 -160 -40 -120 {lab=#net1}
N -40 -240 -40 -220 {lab=Vmid}
N -40 -240 -0 -240 {lab=Vmid}
N 0 -240 0 -230 {lab=Vmid}
N -140 -50 -20 -50 {lab=Vin}
N -140 -50 -140 -40 {lab=Vin}
N -140 20 -140 60 {lab=Vmid}
N -240 20 -240 40 {lab=0}
N -320 20 -320 40 {lab=0}
N -320 -80 -320 -40 {lab=VDD}
N -240 -80 -240 -40 {lab=Vmid}
N 340 50 340 70 {lab=0}
N 340 -30 340 -10 {lab=Vref}
N -40 -10 -20 -10 {lab=0}
N -40 -10 -40 10 {lab=0}
N -50 -30 -20 -30 {lab=VDD}
C {opamp_bg_x.sym} 130 -40 0 0 {name=x1}
C {res.sym} 50 -120 1 0 {name=R1
value=1Meg
footprint=1206
device=resistor
m=1}
C {ind.sym} 170 -120 1 0 {name=L1
m=1
value=1G
footprint=1206
device=inductor}
C {res.sym} -40 -190 0 1 {name=R2
value=1Meg
footprint=1206
device=resistor
m=1}
C {vdd.sym} 0 -230 2 0 {name=l2 lab=Vmid}
C {vsource.sym} -140 -10 0 0 {name=Vin value="0 sin(0 0.7 1k) AC=1" savecurrent=false}
C {vdd.sym} -140 60 2 0 {name=l3 lab=Vmid}
C {vsource.sym} -240 -10 0 0 {name=Vmid value=1.65 savecurrent=false}
C {vsource.sym} -320 -10 0 0 {name=Vdd value=3.3 savecurrent=false}
C {vdd.sym} -240 -80 0 0 {name=l4 lab=Vmid}
C {vdd.sym} -320 -80 0 0 {name=l5 lab=VDD}
C {gnd.sym} -240 40 0 0 {name=l6 lab=0}
C {gnd.sym} -320 40 0 0 {name=l7 lab=0}
C {capa.sym} 340 20 0 0 {name=C1
m=1
value=100n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 340 70 0 0 {name=l8 lab=0}
C {lab_wire.sym} -90 -50 0 0 {name=p1 sig_type=std_logic lab=Vin
}
C {lab_wire.sym} 360 -70 0 0 {name=p2 sig_type=std_logic lab=Vout
}
C {lab_wire.sym} 340 -20 0 0 {name=p3 sig_type=std_logic lab=Vref
}
C {code_shown.sym} -910 -200 0 0 {name=NGSPICE only_toplevel=false 
value=".option wnflag=1
.option savecurrents
.save all

.control
op
write opamp_bg_x_tb.raw
print Vref I(v.x1.x2.vmeas_iref) V(x1.x2.Vq1)

alter L1 1n
tran 1u 2m
plot V(Vin) V(Vout) title 'Vin and Vout vs time'

alter L1 10G
ac dec 100 1 100Meg
plot db(V(Vout)) title 'Mag Vout Open loop'
plot cph(V(Vout))*180/pi title 'Phase Vout Open loop'

alter L1 1n
alter R1 1
ac dec 100 1 100Meg
plot db(V(Vout)) title 'Mag Vout Unity gain'
plot cph(V(Vout))*180/pi title 'Phase Vout Unity gain'

.endc"}
C {vdd.sym} -50 -30 3 0 {name=l9 lab=VDD}
C {gnd.sym} -40 10 0 0 {name=l10 lab=0}
C {code.sym} 20 70 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {devices/launcher.sym} -290 -230 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
