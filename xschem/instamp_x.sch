v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -40 10 -20 10 {lab=Rgn}
N -40 -60 -40 10 {lab=Rgn}
N 230 -60 300 -60 {lab=#net1}
N 300 -60 300 10 {lab=#net1}
N 280 10 300 10 {lab=#net1}
N 140 -110 300 -110 {lab=#net1}
N 300 -110 300 -60 {lab=#net1}
N -120 -160 -120 -110 {lab=Rgp}
N -120 -290 -20 -290 {lab=Rgp}
N -120 -110 80 -110 {lab=Rgp}
N -160 -270 -20 -270 {lab=Vp}
N -120 -160 180 -160 {lab=Rgp}
N 240 -160 300 -160 {lab=Vout}
N 280 -290 300 -290 {lab=Vout}
N 300 -290 300 -160 {lab=Vout}
N 300 -290 330 -290 {lab=Vout}
N -60 -60 -40 -60 {lab=Rgn}
N -20 -60 170 -60 {lab=Rgn}
N -20 -90 -20 -60 {lab=Rgn}
N -120 -180 -120 -160 {lab=Rgp}
N -40 -60 -20 -60 {lab=Rgn}
N 210 140 250 140 {lab=VDD}
N 210 170 250 170 {lab=GND}
N -120 -290 -120 -180 {lab=Rgp}
N -40 90 -20 90 {lab=GND}
N -40 70 -20 70 {lab=VDD}
N -40 50 -20 50 {lab=Vref}
N -40 -250 -20 -250 {lab=Vref}
N -40 -230 -20 -230 {lab=VDD}
N -40 -210 -20 -210 {lab=GND}
N -160 30 -20 30 {lab=Vn}
N -160 -60 -120 -60 {lab=Vmid}
N -160 -90 -20 -90 {lab=Rgn}
N -160 -180 -120 -180 {lab=Rgp}
N 230 240 250 240 {lab=Vref}
C {opamp_x.sym} 130 -250 0 0 {name=x1}
C {opamp_x.sym} 130 50 0 0 {name=x2}
C {ipin.sym} 210 140 2 1 {name=p2 lab=VDD
}
C {ipin.sym} 210 170 2 1 {name=p3 lab=GND
}
C {res.sym} 210 -160 3 1 {name=R1
value=40k
footprint=1206
device=resistor
m=1}
C {res.sym} 110 -110 3 1 {name=R2
value=10.1k
footprint=1206
device=resistor
m=1}
C {res.sym} 200 -60 3 1 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {opin.sym} 330 -290 0 0 {name=p6 lab=Vout}
C {res.sym} -90 -60 3 1 {name=R4
value=40k
footprint=1206
device=resistor
m=1}
C {ipin.sym} -160 30 2 1 {name=p8 lab=Vn
}
C {ipin.sym} -160 -270 2 1 {name=p9 lab=Vp
}
C {ipin.sym} -160 -90 2 1 {name=p10 lab=Rgn
}
C {ipin.sym} -160 -180 2 1 {name=p11 lab=Rgp
}
C {lab_pin.sym} 250 140 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 250 170 0 1 {name=p12 sig_type=std_logic lab=GND}
C {lab_pin.sym} -40 90 2 1 {name=p13 sig_type=std_logic lab=GND}
C {lab_pin.sym} -40 70 2 1 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -40 50 2 1 {name=p15 sig_type=std_logic lab=Vref}
C {lab_pin.sym} -40 -250 2 1 {name=p16 sig_type=std_logic lab=Vref}
C {lab_pin.sym} -40 -230 2 1 {name=p17 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -40 -210 2 1 {name=p18 sig_type=std_logic lab=GND}
C {bandgap_x.sym} 80 250 0 0 {name=x3}
C {lab_pin.sym} -70 240 0 0 {name=p19 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -70 260 0 0 {name=p20 sig_type=std_logic lab=GND}
C {opin.sym} 250 240 0 0 {name=p21 lab=Vref
}
C {ipin.sym} -160 -60 2 1 {name=p1 lab=Vmid
}
