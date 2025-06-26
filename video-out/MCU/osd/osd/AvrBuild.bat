@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Download\osd\labels.tmp" -fI -W+ie -o "C:\Download\osd\osd.hex" -d "C:\Download\osd\osd.obj" -e "C:\Download\osd\osd.eep" -m "C:\Download\osd\osd.map" "C:\Download\osd\vidoverlay.asm"
