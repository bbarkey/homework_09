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
N 280 -20 300 -20 {lab=0}
N 300 -20 300 -0 {lab=0}
N -250 70 -250 90 {lab=0}
N -250 -10 -20 -10 {lab=Vn}
N -250 -10 -250 10 {lab=Vn}
N -250 -40 -250 -10 {lab=Vn}
N -250 -130 -20 -130 {lab=Vp}
N -250 -130 -250 -100 {lab=Vp}
N 280 -90 420 -90 {lab=Vref}
N 420 -90 420 -70 {lab=Vref}
N 420 -10 420 10 {lab=0}
N 280 -130 310 -130 {lab=Vout}
N 310 -130 360 -130 {lab=Vout}
N -270 -200 -270 -180 {lab=0}
N -270 -300 -270 -260 {lab=VDD}
N 280 -40 310 -40 {lab=VDD}
N -100 -30 -20 -30 {lab=Vmid}
C {instamp_x.sym} 130 -70 0 0 {name=x1}
C {res.sym} -60 -80 0 1 {name=Rg
value=90k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -170 -230 0 0 {name=Vmid value=1.65 savecurrent=false}
C {vdd.sym} -170 -300 0 0 {name=l9 lab=Vmid}
C {gnd.sym} -170 -180 0 0 {name=l11 lab=0}
C {vsource.sym} -250 40 0 0 {name=Vcm value=1.65 savecurrent=false}
C {gnd.sym} -250 90 0 0 {name=l5 lab=0}
C {capa.sym} 420 -40 0 0 {name=C1
m=1
value=100n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 420 10 0 0 {name=l4 lab=0}
C {vsource.sym} -250 -70 0 0 {name=Vdiff value="0 sin(0 10m 1k)AC=1" savecurrent=false}
C {lab_wire.sym} 360 -130 0 0 {name=p3 sig_type=std_logic lab=Vout
}
C {lab_wire.sym} -250 -110 0 0 {name=p1 sig_type=std_logic lab=Vp
}
C {lab_wire.sym} -250 -20 0 0 {name=p2 sig_type=std_logic lab=Vn
}
C {lab_wire.sym} 330 -90 0 0 {name=p4 sig_type=std_logic lab=Vref
}
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
C {vsource.sym} -270 -230 0 0 {name=Vdd value=3.3 savecurrent=false}
C {vdd.sym} -270 -300 0 0 {name=Vdd1 lab=VDD}
C {gnd.sym} -270 -180 0 0 {name=Vdd2 lab=0}
C {vdd.sym} 310 -40 0 0 {name=Vdd3 lab=VDD}
C {code.sym} 290 -290 0 0 {name=AUGHHH only_toplevel=false value=".option wnflag=1
.option savecurrents
.save all

.control

* ==========================================
* INITIAL SETUP
* ==========================================

op
write instamp_x_tb.raw
set appendwrite
set gnuplot_terminal=png/quit


* ==========================================
* TRANSIENT ANALYSIS (DISABLED)
* ==========================================

if 0

  destroy all

  foreach val 90k 5k 1k
    alter Rg = $val
    tran 10u 3m 1m
  end

  let Rg90k = tran1.v(vout)
  let Rg5k = tran2.v(vout)
  let Rg1k = tran3.v(vout)

  gnuplot tran Rg90k Rg5k Rg1k
+ title 'Differential gain'
+ xlabel 'Time' ylabel 'Volts'

endif


* ==========================================
* SINGLE AC ANALYSIS (DISABLED)
* ==========================================

if 0

  destroy all
  ac dec 100 1 1Meg
  plot db(v(vout))

endif


* ==========================================
* MULTIPLE AC ANALYSES (ENABLED)
* ==========================================

if 1

  destroy all

* ==========================================
* 1. DIFFERENTIAL GAIN ANALYSIS
* ==========================================

  alter vdiff ac=1
  alter vcm ac=0
  alter vdd ac=0
  alter vmid ac=0

  foreach val 90k 5k 1k
    alter Rg = $val
    ac dec 100 1 1Meg
  end


* ==========================================
* 2. COMMON MODE ANALYSIS
* ==========================================

  alter vdiff ac=0
  alter vcm ac=1
  alter vdd ac=0
  alter vmid ac=0

  foreach val 90k 5k 1k
    alter Rg = $val
    ac dec 100 1 1Meg
  end


* ==========================================
* 3. POWER SUPPLY ANALYSIS
* ==========================================

  alter vdiff ac=0
  alter vcm ac=0
  alter vdd ac=1
  alter vmid ac=0

  foreach val 90k 5k 1k
    alter Rg = $val
    ac dec 100 1 1Meg
  end


* ==========================================
* 4. VMID REJECTION ANALYSIS
* ==========================================

  alter vdiff ac=0
  alter vcm ac=0
  alter vdd ac=0
  alter vmid ac=1

  foreach val 90k 5k 1k
    alter Rg = $val
    ac dec 100 1 1Meg
  end


* ==========================================
* 5. CALCULATE DIFFERENTIAL GAIN
* ==========================================

  let Rg90k = db(ac1.v(vout))
  let Rg5k = db(ac2.v(vout))
  let Rg1k = db(ac3.v(vout))


* ==========================================
* 6. CALCULATE CMRR
* ==========================================

  let Rg90k_cm = Rg90k-db(ac4.v(vout))
  let Rg5k_cm = Rg5k-db(ac5.v(vout))
  let Rg1k_cm = Rg1k-db(ac6.v(vout))


* ==========================================
* 7. CALCULATE PSRR
* ==========================================

  let Rg90k_psh = Rg90k-db(ac7.v(vout))
  let Rg5k_psh = Rg5k-db(ac8.v(vout))
  let Rg1k_psh = Rg1k-db(ac9.v(vout))


* ==========================================
* 8. CALCULATE VMID REJECTION
* ==========================================

  let Rg90k_vmid = Rg90k-db(ac10.v(vout))
  let Rg5k_vmid = Rg5k-db(ac11.v(vout))
  let Rg1k_vmid = Rg1k-db(ac12.v(vout))


* ==========================================
* 9. RAW COMMON MODE GAIN
* ==========================================

  let CM90k = db(ac4.v(vout))
  let CM5k = db(ac5.v(vout))
  let CM1k = db(ac6.v(vout))


* ==========================================
* 10. RAW SUPPLY TO OUTPUT GAIN
* ==========================================

  let PS90k = db(ac7.v(vout))
  let PS5k = db(ac8.v(vout))
  let PS1k = db(ac9.v(vout))


* ==========================================
* 11. PRINT CMRR VALUES AT 1 Hz
* ==========================================

  echo ========================================
  echo CMRR VALUES AT 1 Hz
  echo ========================================

  print Rg90k_cm[0]
  print Rg5k_cm[0]
  print Rg1k_cm[0]


* ==========================================
* 12. PRINT PSRR VALUES AT 1 Hz
* ==========================================

  echo ========================================
  echo PSRR VALUES AT 1 Hz
  echo ========================================

  print Rg90k_psh[0]
  print Rg5k_psh[0]
  print Rg1k_psh[0]


* ==========================================
* 13. DIFFERENTIAL GAIN GRAPH
* ==========================================

  gnuplot ac Rg90k Rg5k Rg1k
+ title 'Differential gain'
+ xlabel 'Frequency (Hz)' ylabel 'Gain (dB)'


* ==========================================
* 14. CMRR GRAPH
* ==========================================

  gnuplot cmrr Rg90k_cm Rg5k_cm Rg1k_cm
+ title 'CMRR'
+ xlabel 'Frequency (Hz)' ylabel 'CMRR (dB)'


* ==========================================
* 15. PSRR GRAPH
* ==========================================

  gnuplot psrr Rg90k_psh Rg5k_psh Rg1k_psh
+ title 'PSRR'
+ xlabel 'Frequency (Hz)' ylabel 'PSRR (dB)'


* ==========================================
* 16. VMID REJECTION GRAPH
* ==========================================

  gnuplot vmid_rej Rg90k_vmid Rg5k_vmid Rg1k_vmid
+ title 'Vmid Rejection'
+ xlabel 'Frequency (Hz)' ylabel 'Rejection (dB)'


* ==========================================
* 17. RAW COMMON MODE GAIN GRAPH (NEW)
* ==========================================

  gnuplot cm_gain CM90k CM5k CM1k
+ title 'Common Mode Gain'
+ xlabel 'Frequency (Hz)' ylabel 'Gain (dB)'


* ==========================================
* 18. RAW SUPPLY GAIN GRAPH (NEW)
* ==========================================

  gnuplot supply_gain PS90k PS5k PS1k
+ title 'Supply to Output Gain'
+ xlabel 'Frequency (Hz)' ylabel 'Gain (dB)'


endif

.endc"}
C {gnd.sym} 300 0 0 0 {name=l1 lab=0}
C {vdd.sym} -100 -30 3 0 {name=l2 lab=Vmid}
