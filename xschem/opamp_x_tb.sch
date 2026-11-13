v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -40 -10 -20 -10 {lab=0}
N -40 -10 -40 10 {lab=0}
N -40 -90 -20 -90 {lab=Vn}
N 280 -90 300 -90 {lab=Vout}
N -270 -70 -270 -50 {lab=Vp}
N -270 -70 -20 -70 {lab=Vp}
N -210 -50 -210 -10 {lab=Vref}
N -210 -50 -20 -50 {lab=Vref}
N 300 -90 320 -90 {lab=Vout}
N -60 -160 -60 -110 {lab=Vn}
N -60 -160 0 -160 {lab=Vn}
N 60 -160 120 -160 {lab=#net1}
N 180 -160 280 -160 {lab=Vout}
N -60 -200 -60 -160 {lab=Vn}
N -60 -280 -60 -260 {lab=Vmid}
N -60 -280 -20 -280 {lab=Vmid}
N -20 -280 -20 -270 {lab=Vmid}
N -60 -90 -40 -90 {lab=Vn}
N -60 -110 -60 -90 {lab=Vn}
N 280 -160 320 -160 {lab=Vout}
N 320 -160 320 -90 {lab=Vout}
N -270 -50 -270 -40 {lab=Vp}
N -270 20 -270 60 {lab=Vmid}
N -360 60 -360 80 {lab=0}
N -360 -40 -360 0 {lab=Vmid}
N -210 -10 -210 60 {lab=Vref}
N -110 50 -110 70 {lab=0}
N -110 -30 -110 -10 {lab=#net2}
N -110 -30 -20 -30 {lab=#net2}
N -210 120 -210 140 {lab=0}
C {opamp_x.sym} 130 -50 0 0 {name=x1}
C {vsource.sym} -110 20 0 0 {name=Vdd value=3.3 savecurrent=false}
C {gnd.sym} -110 70 0 0 {name=l1 lab=0}
C {gnd.sym} -40 10 0 0 {name=l2 lab=0}
C {vsource.sym} -210 90 0 0 {name=Vref_source value=1.2 savecurrent=false}
C {code.sym} 270 -10 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {code_shown.sym} -880 -220 0 0 {name=NGSPICE only_toplevel=false
value=".option savecurrents
.save all

.control
op
write opamp_x_tb.raw
print v(vout)
print v(x1.net17)

print v(Vp) v(Vn) v(Vout) v(Vref)

ac dec 100 1 100Meg

plot db(v(Vout)/v(Vp)) title 'AC Magnitude'

plot 180/pi*cph(v(Vout)/v(Vp)) title 'AC Phase'

.endc"}
C {lab_wire.sym} 320 -90 0 0 {name=p2 sig_type=std_logic lab=Vout
}
C {lab_wire.sym} -80 -50 0 0 {name=p3 sig_type=std_logic lab=Vref
}
C {res.sym} 30 -160 1 0 {name=R1
value=1Meg
footprint=1206
device=resistor
m=1}
C {ind.sym} 150 -160 1 0 {name=L4
m=1
value=1G
footprint=1206
device=inductor}
C {res.sym} -60 -230 0 1 {name=R2
value=1Meg
footprint=1206
device=resistor
m=1}
C {vdd.sym} -20 -270 2 0 {name=l15 lab=Vmid}
C {vsource.sym} -270 -10 0 0 {name=Vin value="0 AC=1" savecurrent=false}
C {vdd.sym} -270 60 2 0 {name=l7 lab=Vmid}
C {vsource.sym} -360 30 0 0 {name=Vmid value=1.65 savecurrent=false}
C {vdd.sym} -360 -40 0 0 {name=l9 lab=Vmid}
C {gnd.sym} -360 80 0 0 {name=l11 lab=0}
C {gnd.sym} -210 140 0 0 {name=l8 lab=0}
C {lab_wire.sym} -30 -70 0 0 {name=p4 sig_type=std_logic lab=Vp

}
C {lab_wire.sym} -30 -90 0 0 {name=p5 sig_type=std_logic lab=Vn

}
C {devices/launcher.sym} -330 -340 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
