onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tf2/clk
add wave -noupdate -format Logic /tf2/sw1
add wave -noupdate -format Logic /tf2/sw2
add wave -noupdate -format Logic /tf2/sw3
add wave -noupdate -format Logic /tf2/sw4
add wave -noupdate -format Logic /tf2/rst
add wave -noupdate -format Logic /tf2/teststart
add wave -noupdate -format Logic /tf2/teststop
add wave -noupdate -format Literal /tf2/led
add wave -noupdate -format Logic /tf2/clkout
add wave -noupdate -format Literal -radix unsigned /tf2/uut/cs
add wave -noupdate -format Logic /tf2/uut/trig_pulse
add wave -noupdate -format Literal -radix unsigned /tf2/uut/pulse_cnt
add wave -noupdate -format Literal -radix unsigned /tf2/uut/delay_cnt
add wave -noupdate -format Logic /tf2/uut/time_5sec
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {2406500000 ps}
WaveRestoreZoom {2405871573 ps} {2406741341 ps}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
