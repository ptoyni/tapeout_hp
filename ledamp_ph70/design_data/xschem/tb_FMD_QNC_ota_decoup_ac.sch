v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 880 -120 880 -100 {
lab=GND}
N 880 -200 880 -180 {
lab=v_ss}
N 880 -200 980 -200 {
lab=v_ss}
N 730 -140 730 -120 {
lab=GND}
N 730 -580 730 -200 {
lab=v_dd}
N 980 -430 980 -340 {
lab=v_in}
N 980 -430 1300 -430 {lab=v_in}
N 980 -280 980 -200 {lab=v_ss}
N 1250 -580 1250 -560 {
lab=v_dd}
N 1250 -500 1250 -400 {
lab=#net1}
N 1250 -400 1300 -400 {lab=#net1}
N 730 -580 1250 -580 {lab=v_dd}
N 1670 -400 1750 -400 {lab=v_out}
N 1670 -400 1670 -290 {
lab=v_out}
N 1220 -370 1300 -370 {lab=v_out}
N 1220 -370 1220 -290 {lab=v_out}
N 1220 -290 1670 -290 {lab=v_out}
N 1470 -400 1670 -400 {lab=v_out}
N 1350 -580 1350 -460 {lab=v_dd}
N 1250 -580 1350 -580 {lab=v_dd}
N 980 -200 1350 -200 {lab=v_ss}
N 1350 -340 1350 -200 {lab=v_ss}
C {devices/vsource.sym} 880 -150 0 0 {name=Vss value=0}
C {devices/gnd.sym} 880 -100 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 880 -200 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {devices/vsource.sym} 730 -170 0 0 {name=Vdd value=1.5}
C {devices/gnd.sym} 730 -120 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 730 -210 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 980 -310 0 0 {name=Vin value="dc 0.7 ac 1"}
C {lab_wire.sym} 1040 -430 0 0 {name=p4 sig_type=std_logic lab=v_in}
C {spice_probe.sym} 1100 -430 0 0 {name=p5 attrs=""}
C {isource.sym} 1250 -530 0 0 {name=I0 value=14u}
C {lab_wire.sym} 1750 -400 0 0 {name=p3 sig_type=std_logic lab=v_out}
C {spice_probe.sym} 1630 -400 0 0 {name=p6 attrs=""}
C {devices/code_shown.sym} 30 -1000 0 0 {name=NGSPICE1 only_toplevel=true 
value="

         




.temp 27
.control
option sparse
save all
op
write tb_foldedcascode_nmos_ac.raw
set appendwrite

ac dec 101 1k 1G
write tb_foldedcascode_nmos_ac.raw
plot 20*log10(v_out)



meas ac dcgain MAX vmag(v_out) FROM=10 TO=10k
let f3db = dcgain/sqrt(2)
meas ac fbw WHEN vmag(v_out)=f3db FALL=1
let gainerror=(dcgain-1)/1
print dcgain
print fbw
print gainerror



plot 180/pi*ph(v_out) vs frequency

noise v(v_out) Vin dec 101 1k 100MEG
print onoise_total

.endc
"}
C {devices/code_shown.sym} 30 -130 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.include $::SG13G2_MODELS/sg13g2_bondpad.lib
.include $::SG13G2_MODELS/sg13g2_esd.lib
"}
C {FMD_QNC_ota_decoup.sym} 1450 -400 0 0 {name=x1}
