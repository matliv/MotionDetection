onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ref_image_RAM_opt

do {wave.do}

view wave
view structure
view signals

do {ref_image_RAM.udo}

run -all

quit -force
