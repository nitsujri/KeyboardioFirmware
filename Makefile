# Arduino Make file. Refer to https://github.com/sudar/Arduino-Makefile

BOARD_TAG    = micro
MONITOR_PORT = /dev/cu.usbmodem*
ARDUINO_LIBS = 
ARDUINO_DIR = /Applications/Arduino_1.0.5.app/Contents/Resources/Java

include build/arduino-mk/Arduino.mk

astyle:
	astyle --style=linux ArduinoKeyboard.ino *.h

generate-keymaps:
	cd layouts && ( find . -type f |xargs -n 1 -I % sh -c 'perl ../tools/generate_keymaps.pl < % > ../layouts-generated/%.h' )
