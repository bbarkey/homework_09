v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -60 -110 -20 -110 {lab=#net1}
N -60 -50 -20 -50 {lab=#net2}
N -170 -200 -170 -180 {lab=0}
N -170 -300 -170 -260 {lab=Vmid}
N 350 40 350 60 {lab=0}
N 350 -40 350 -20 {lab=#net3}
N 280 -20 300 -20 {lab=0}
N 300 -20 300 -0 {lab=0}
N 280 -40 350 -40 {lab=#net3}
N -250 70 -250 90 {lab=0}
N -250 -10 -20 -10 {lab=Vn}
N -250 -10 -250 10 {lab=Vn}
N -250 -40 -250 -10 {lab=Vn}
N -250 -130 -20 -130 {lab=Vp}
N -250 -130 -250 -100 {lab=Vp}
N 280 -130 330 -130 {lab=Vout}
N 280 -90 420 -90 {lab=Vref}
N 420 -90 420 -70 {lab=Vref}
N 420 -10 420 10 {lab=0}
N -110 -30 -20 -30 {lab=Vmid}
C {instamp_x.sym} 130 -70 0 0 {name=x1}
C {res.sym} -60 -80 0 1 {name=R2
value=90k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -170 -230 0 0 {name=Vmid value=1.65 savecurrent=false}
C {vdd.sym} -170 -300 0 0 {name=l9 lab=Vmid}
C {gnd.sym} -170 -180 0 0 {name=l11 lab=0}
C {vdd.sym} -110 -30 0 0 {name=l1 lab=Vmid}
C {vsource.sym} 350 10 0 0 {name=Vdd value=3.3 savecurrent=false}
C {gnd.sym} 350 60 0 0 {name=l2 lab=0}
C {gnd.sym} 300 0 0 0 {name=l3 lab=0}
C {vsource.sym} -250 40 0 0 {name=Vcm value=1.65 savecurrent=false}
C {gnd.sym} -250 90 0 0 {name=l5 lab=0}
C {capa.sym} 420 -40 0 0 {name=C1
m=1
value=100n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 420 10 0 0 {name=l4 lab=0}
C {vsource.sym} -250 -70 0 0 {name=Vdiff value="0 sin(0 10m 1k)AC=1" savecurrent=false}
C {lab_wire.sym} 330 -130 0 0 {name=p3 sig_type=std_logic lab=Vout
}
C {lab_wire.sym} -250 -110 0 0 {name=p1 sig_type=std_logic lab=Vp
}
C {lab_wire.sym} -250 -20 0 0 {name=p2 sig_type=std_logic lab=Vn
}
C {lab_wire.sym} 330 -90 0 0 {name=p4 sig_type=std_logic lab=Vref
}
C {code_shown.sym} 470 -310 0 0 {name=NGSPICE only_toplevel=false
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
C {code.sym} -90 -290 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {devices/launcher.sym} 130 -320 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
