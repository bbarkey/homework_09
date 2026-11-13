v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 0 -0 0 {lab=Vref}
N -60 20 -0 20 {lab=VDD}
N -60 20 -60 60 {lab=VDD}
N -400 60 -60 60 {lab=VDD}
N -400 -0 -380 -0 {lab=VDD}
N -400 0 -400 60 {lab=VDD}
N -380 20 -380 80 {lab=GND}
N -380 80 -20 80 {lab=GND}
N -20 40 -20 80 {lab=GND}
N -20 40 -0 40 {lab=GND}
N 300 -40 320 -40 {lab=Vout}
N -420 0 -400 -0 {lab=VDD}
N -450 20 -380 20 {lab=GND}
N -60 -90 -40 -90 {lab=Vref}
N -60 -90 -60 -0 {lab=Vref}
C {/home/bbarkey/Documents/ECE_5120/homework_05/xschem/bandgap_x.sym} -230 10 0 0 {name=x1}
C {opamp_x.sym} 150 0 0 0 {name=x2}
C {ipin.sym} 0 -40 2 1 {name=p1 lab=Vn
}
C {opin.sym} 320 -40 0 0 {name=p2 lab=Vout}
C {opin.sym} -40 -90 0 0 {name=p3 lab=Vref}
C {ipin.sym} 0 -20 2 1 {name=p4 lab=Vp}
C {ipin.sym} -420 0 2 1 {name=p5 lab=VDD
}
C {ipin.sym} -450 20 2 1 {name=p6 lab=GND}
