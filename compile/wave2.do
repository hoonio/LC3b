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
add wave -noupdate -format Literal -radix hexadecimal -expand /cpu/i2/i13/ram
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/irout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/pcoffset11
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/adj9out
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/braddout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/f
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/rfmuxout
add wave -noupdate -format Literal /cpu/aluop
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/rfaout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/aluout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/pcmuxout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/shiftout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i2/alumuxout
add wave -noupdate -format Literal /cpu/i0/current_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {62093 ns}
WaveRestoreZoom {61797 ns} {62311 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
