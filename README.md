# Introduction

I made unique business cards for myself, they are just narrow "sticks" which fit into a USB connector directly. The simplest variants can just have a `ATMEGA88` chip with LED to perform 'morse code' and other types of blinkies:

![many](../assets/images/many.jpg)

However there are more populated variants which can have own dedicated ISP connector (1.27mm pin pitch) and with few more passives have software implemented USB HID capabilities:

![isp](../assets/images/isp.jpg)

One variant has soldered pin headers on the edges and is simple, yet full dev board:

![breadboard](../assets/images/breadboard.jpg)

This repository is documenting the "breadboard" variant, showing the pinout of the connectors and contains small morse code blinky project.

**Note**: In the images above I'm showing only one side of the PCB, the one which doesn't contain the contact details of the business card and therefore the traces for the USB connector are not visible on the photos.

# LED

The `PORTD6` is connected directly to a LED without a current limiting resistor which is a very bad design practice. But then why I did it? Because of the `mk2` goals, my first `mk1` revision of this stick dev board was doing everything by the spec but contained 5 components.

 - Shrinking the board to 2 components not just shaved off few cents.I'm always giving these away for free so I want it to be cheap.

 - But made assembly faster as well. As I'm making these by hand in bulk, each step, each component adds up with 100s of boards.

On real production boards this would be absolutely no-go, however with few design considerations the LED can be used fairly reliably.

The PCB has between `PORTD6` and LED purposefully long and thin trace. And it's setup to drive the LED instead of sinking, these MCUs can do ~40mA when sinking, but the driving currents are weaker ~20mA. And other constrains apply too, like combined current draw of all pins (good to read the spec). 

Still the USB is 5V and forward voltages for LEDs are ~3.3V, the increased trace resistance and using the pin in a weaker mode is not enough. Yet there are 2 approaches how to make the LED work:

## Safer method

If the `PORTD6` without current limiting resistor would be used as output and set to high the LED, PORT's PIN and/or MCU could be damaged.

Even when the PCB doesn't have resistors populated, there are resistors inside each IO pin (the pull-up resistors):

![io](../assets/images/gpio.png)


These resistors are not precise and according to the spec around 20k ohm to 50k ohm. Which might be on a higher side and limiting current too much (LED current is under 1mA), however it's enough to lit the LED. The input's pull-up resistor is designed to be shorted continuously so powering a LED has no effect on the ports longevity. And LED which can be driven with 20mA will be with this method driven with a current smaller than 1mA. Therefore both (port and LED) can operate within their spec and it's safe.

To turn on the LED the PORTD6 direction has to be as `input with pull-up`, to turn off the LED it needs to be set as `input in tri-state` or as output with low output (however be careful to not set the output to high).

## Exiting method

Second method is PWM which is abusing the spec slightly, but allows dimming control.

Use as fast PWM as possible and control the current and brightness with the duty cycle. Do not set duty cycle above 10% (in my examples I do not exceed 7% and still the LED is bright enough). It means that most of the time the LED should be powered off. Tested the board with 7% duty cycle continuously on for 100h and didn't affect brightness/draw/temperature or any noticeable aspect of operation, while the expectation of a gimmick USB dev board are expected to be used less than 100h so this looks as OK solution, even when it's abusing the HW and the spec.

The `PORTD6` is mapped as output pin `OC0A` for the Timer0, which can be configured to `Fast PWM` mode. In this mode it's recomended to use **inverted** output mode as that will allow to set the `OCR0A` to `0xff` which will result to 0% duty cycle. While non-inverting mode and `OCR0A` set to `0x00` will **not** produce 0% duty cycle and the LED will be always slightly lit.


**Warning**: In this mode it's unsafe to stop the PWM without careful timing and setting the output to safe state before the execution is intrestuped. Things like JTAG debugging would be exposing the LED to dangers where the LED could be left in bad state for too long, however the `ATMEGA88` has no JTAG features. In simple terms, when using PWM extra measures have to be made to make sure it will not get stuck with the high output set for too long.

# Pinout

## Board pinout

![pinout-whole](../assets/images/pinout-footprint.png)

The ISP/SPI is exposed (on J2) as well, so the device can be powered and programmed from the board J2 connector directly, or programmed from the separate ISP pin header.

| J1 | J2|
| --- | --- |
| PB2 | PD6 LED|
| PB1 | VCC |
| PB0 | GND |
| PD7 | SCK |
| PD5 | RST |
| PC4 | MISO |
| PC3 | MOSI |
| PC2 | PC1 |

## ISP pin-header pinout

**Note**: This is not the typical 2.54mm pin spacing, but 1.27mm pin-header.

![pinout-isp-schematic](../assets/images/pinout_isp_schematic.png)

![pinout-isp-pcb](../assets/images/pinout_isp_pcb.png)

| ISP1 pin | function |
| --- | --- |
| 1 | RST |
| 2 | GND |
| 3 | SCK |
| 4 | MOSI |
| 5 | MISO |
| 6 | VCC |

# Clock

For many projects the internal 8MHz oscillator is enough, however for the USB to work a external crystal (12Mhz for example) needs to be populated on the PCB together with two capacitors.

# Software USB

On top of having a stable clock, 4 more passives components have to be populated on the PCB:

 - zener diodes (two 3.6V) 
 - resistors (two 68 ohm)

