onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix hexadecimal /cpu/i0/current_state
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/i0/current_state
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/clk
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/address
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/index
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/offset
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/tag
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/dataout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/datain
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/pmdataout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/pmdatain
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/cacheline0
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/cacheline1
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/data_cacheout
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/data_wordout
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/valid0
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/valid1
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/tag0match
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/tag1match
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/comp_out1
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/comp_out2
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/writeen0
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/writeen1
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/lrusel
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/lruload
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/lruupdate
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/tag0_out
add wave -noupdate -format Literal -radix hexadecimal /cpu/i1/tag1_out
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mread_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mwriteh_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mwritel_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/mresp_h
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/linesel
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/pmread_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/pmresp_h
add wave -noupdate -format Logic -radix hexadecimal /cpu/i1/pmwrite_l
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {668 ns}
WaveRestoreZoom {0 ns} {664 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
