v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1150 -140 1150 -120 {
lab=GND}
N 1150 -220 1150 -200 {
lab=v_ss}
N 1150 -220 1250 -220 {
lab=v_ss}
N 1000 -160 1000 -140 {
lab=GND}
N 1000 -600 1000 -220 {
lab=v_dd}
N 1250 -450 1250 -360 {
lab=v_in}
N 1250 -450 1570 -450 {lab=v_in}
N 1250 -300 1250 -220 {lab=v_ss}
N 1520 -600 1520 -580 {
lab=v_dd}
N 1520 -520 1520 -420 {
lab=#net1}
N 1520 -420 1570 -420 {lab=#net1}
N 1000 -600 1520 -600 {lab=v_dd}
N 1940 -420 2020 -420 {lab=v_out}
N 1940 -420 1940 -310 {
lab=v_out}
N 1490 -390 1570 -390 {lab=v_out}
N 1490 -390 1490 -310 {lab=v_out}
N 1490 -310 1940 -310 {lab=v_out}
N 1740 -420 1940 -420 {lab=v_out}
N 1620 -600 1620 -480 {lab=v_dd}
N 1520 -600 1620 -600 {lab=v_dd}
N 1250 -220 1620 -220 {lab=v_ss}
N 1620 -360 1620 -220 {lab=v_ss}
C {devices/vsource.sym} 1150 -170 0 0 {name=Vss value=0}
C {devices/gnd.sym} 1150 -120 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 1150 -220 0 0 {name=p1 sig_type=std_logic lab=v_ss}
C {devices/vsource.sym} 1000 -190 0 0 {name=Vdd value=1.55}
C {devices/gnd.sym} 1000 -140 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 1000 -230 0 0 {name=p2 sig_type=std_logic lab=v_dd}
C {devices/vsource.sym} 1250 -330 0 0 {name=Vin value="dc 0.7 ac 1"}
C {lab_wire.sym} 1310 -450 0 0 {name=p4 sig_type=std_logic lab=v_in}
C {spice_probe.sym} 1370 -450 0 0 {name=p5 attrs=""}
C {isource.sym} 1520 -550 0 0 {name=I0 value=14u}
C {lab_wire.sym} 2020 -420 0 0 {name=p3 sig_type=std_logic lab=v_out}
C {spice_probe.sym} 1900 -420 0 0 {name=p6 attrs=""}
C {devices/code_shown.sym} 340 -810 0 0 {name=NGSPICE1 only_toplevel=true 
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
C {devices/title.sym} 830 150 0 0 {name=l5 author="(c) 2025 Thesis_HP, Apache-2.0 license"}
C {devices/code_shown.sym} 330 -90 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.include $::SG13G2_MODELS/sg13g2_bondpad.lib
.include $::SG13G2_MODELS/sg13g2_esd.lib
"}
C {/foss/designs/thesis/tapeout_hp/Amplifier_with_decoupling/design_data/xschem/FMD_QNC_ota_decoup.sym} 1720 -420 0 0 {name=x1}
