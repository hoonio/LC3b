onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/address
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/dataout
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mread_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mwriteh_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mwritel_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/reset_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/clk
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/datain
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mresp_h
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/pcout
add wave -noupdate -format Logic -radix hexadecimal /cpu/i0/start_h
add wave -noupdate -format Literal /cpu/i0/current_state
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/i6/data1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {80475 ns}
WaveRestoreZoom {82742 ns} {83905 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
