/*
Author                  : anton.krug@gmail.com
Chip type               : ATmega88
Program type            : Application
AVR Core Clock frequency: 8.000000 MHz (internal resontator)
Memory model            : Small
Data Stack size         : 256
*/

#include <mega88.h>
#include <delay.h>
#include <stdint.h>

#define LED_USE_PULLUP  // Comment out this define to us PWM instead of the pull-up

#define LED_OFF 0xff
#define LED_DIM 0xfe
#define LED_ON  0xee

// https://morsecode.world/international/timing.html
// Speed is 20 words per minute, word PARIS is 50 units (20*50=1000 units per minute), 60000ms/1000units = 60ms (per unit)  
// Slower 10 WPM used as android app likes it slower => 120ms (per unit)
#define MORSE_UNIT ((60*1000)/(10*50)) 
#define START_UP_DELAY 2000

typedef struct {
  uint8_t length;
  uint8_t code;
} morse_code;

// http://www.sckans.edu/~sireland/radio/code.html
// https://morsecode.world/international/morse2.html
const morse_code morse_alphabet[] = {
  { 2, 0x02 }, // A
  { 4, 0x01 }, // B
  { 4, 0x05 }, // C
  { 3, 0x01 }, // D
  { 1, 0x00 }, // E
  { 4, 0x04 }, // F
  { 3, 0x03 }, // G
  { 4, 0x00 }, // H
  { 2, 0x00 }, // I
  { 4, 0x0E }, // J
  { 3, 0x05 }, // K
  { 4, 0x02 }, // L
  { 2, 0x03 }, // M
  { 2, 0x01 }, // N
  { 3, 0x07 }, // O
  { 4, 0x06 }, // P
  { 4, 0x0B }, // Q
  { 3, 0x02 }, // R
  { 3, 0x00 }, // S
  { 1, 0x01 }, // T
  { 3, 0x04 }, // U
  { 4, 0x08 }, // V
  { 3, 0x06 }, // W
  { 4, 0x09 }, // X
  { 4, 0x0D }, // Y
  { 4, 0x03 }, // Z
    
  { 5, 0x1F }, // 0 (26) 
  { 5, 0x1E }, // 1 (27)
  { 5, 0x1C }, // 2 (28)
  { 5, 0x18 }, // 3 (29)
  { 5, 0x10 }, // 4 (30)
  { 5, 0x00 }, // 5 (31)
  { 5, 0x01 }, // 6 (32)
  { 5, 0x03 }, // 7 (33)
  { 5, 0x07 }, // 8 (34)
  { 5, 0x0F }, // 9 (35)
    
  { 8, 0x00 }, // Del word (36)
    
  { 5, 0x02 }, // & (37)
  { 6, 0x1E }, // ' (38)
  { 6, 0x22 }, // @ (39)
  { 6, 0x07 }, // : (40)
  { 6, 0x33 }, // , (41)
  { 5, 0x14 }, // = (42)
  { 6, 0x2A }, // . (43)
  { 6, 0x1E }, // - (44)
  { 5, 0x2A }, // + (45)
  { 6, 0x12 }, // " (46)
  { 6, 0x0C }, // ? (47)
  { 5, 0x09 }, // / (48)   
};

// https://www.asciitable.com/
const int8_t ascii_to_morse_alphabet[] = {
  -1, -1, -1, -1, -1, -1, -1, -1,  // 0   - 7
  -1, -1, -1, -1, -1, -1, -1, -1,  // 8   - 15
  -1, -1, -1, -1, -1, -1, -1, -1,  // 16  - 23
  -1, -1, -1, -1, -1, -1, -1, -1,  // 24  - 31
    
  -1, -1, 46, -1, -1, -1, 37, 38,  // 32  - 39
  -1, -1, -1, 45, 41, 44, 43, 48,  // 40  - 47
  26, 27, 28, 29, 30, 31, 32, 33,  // 48  - 55
  34, 35, 40, -1, -1, 42, -1, 47,  // 56  - 63
    
  39,  0,  1,  2,  3,  4,  5,  6,  // 64  - 71
   7,  8,  9, 10, 11, 12, 13, 14,  // 72  - 79
  15, 16, 17, 18, 19, 20, 21, 22,  // 80  - 87
  23, 24, 25, -1, -1, -1, -1, -1,  // 88  - 95

  38,  0,  1,  2,  3,  4,  5,  6,  // 96  - 103
   7,  8,  9, 10, 11, 12, 13, 14,  // 104 - 111
  15, 16, 17, 18, 19, 20, 21, 22,  // 112 - 119
  23, 24, 25, -1, -1, -1, -1, 36,  // 120 - 127        
};

void reset() {
  // Crystal Oscillator division factor: 1
  #pragma optsize-
  CLKPR=(1<<CLKPCE);
  CLKPR=(0<<CLKPCE) | (0<<CLKPS3) | (0<<CLKPS2) | (0<<CLKPS1) | (0<<CLKPS0);
  #ifdef _OPTIMIZE_SIZE_
  #pragma optsize+
  #endif

  // GPIOs reset
  DDRB=(0<<DDB7) | (0<<DDB6) | (0<<DDB5) | (0<<DDB4) | (0<<DDB3) | (0<<DDB2) | (0<<DDB1) | (0<<DDB0);
  PORTB=(0<<PORTB7) | (0<<PORTB6) | (0<<PORTB5) | (0<<PORTB4) | (0<<PORTB3) | (0<<PORTB2) | (0<<PORTB1) | (0<<PORTB0);

  DDRC=(0<<DDC6) | (0<<DDC5) | (0<<DDC4) | (0<<DDC3) | (0<<DDC2) | (0<<DDC1) | (0<<DDC0);
  PORTC=(0<<PORTC6) | (0<<PORTC5) | (0<<PORTC4) | (0<<PORTC3) | (0<<PORTC2) | (0<<PORTC1) | (0<<PORTC0);

  DDRD=(0<<DDD7) | (0<<DDD6) | (0<<DDD5) | (0<<DDD4) | (0<<DDD3) | (0<<DDD2) | (0<<DDD1) | (0<<DDD0);
  PORTD=(0<<PORTD7) | (0<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<<PORTD2) | (0<<PORTD1) | (0<<PORTD0);

  // Timer/Counter 0 reset
  TCCR0A=(0<<COM0A1) | (0<<COM0A0) | (0<<COM0B1) | (0<<COM0B0) | (0<<WGM01) | (0<<WGM00);
  TCCR0B=(0<<WGM02) | (0<<CS02) | (0<<CS01) | (0<<CS00);
  TCNT0=0x00;
  OCR0A=0x00;
  OCR0B=0x00;

  // Timer/Counter 1 reset
  TCCR1A=(0<<COM1A1) | (0<<COM1A0) | (0<<COM1B1) | (0<<COM1B0) | (0<<WGM11) | (0<<WGM10);
  TCCR1B=(0<<ICNC1) | (0<<ICES1) | (0<<WGM13) | (0<<WGM12) | (0<<CS12) | (0<<CS11) | (0<<CS10);
  TCNT1H=0x00;
  TCNT1L=0x00;
  ICR1H=0x00;
  ICR1L=0x00;
  OCR1AH=0x00;
  OCR1AL=0x00;
  OCR1BH=0x00;
  OCR1BL=0x00;

  // Timer/Counter 2 reset
  ASSR=(0<<EXCLK) | (0<<AS2);
  TCCR2A=(0<<COM2A1) | (0<<COM2A0) | (0<<COM2B1) | (0<<COM2B0) | (0<<WGM21) | (0<<WGM20);
  TCCR2B=(0<<WGM22) | (0<<CS22) | (0<<CS21) | (0<<CS20);
  TCNT2=0x00;
  OCR2A=0x00;
  OCR2B=0x00;

  // Timer/Counter 0,1 and 2 Interrupt(s) resets
  TIMSK0=(0<<OCIE0B) | (0<<OCIE0A) | (0<<TOIE0);
  TIMSK1=(0<<ICIE1) | (0<<OCIE1B) | (0<<OCIE1A) | (0<<TOIE1);
  TIMSK2=(0<<OCIE2B) | (0<<OCIE2A) | (0<<TOIE2);

  // External Interrupt(s) reset
  EICRA=(0<<ISC11) | (0<<ISC10) | (0<<ISC01) | (0<<ISC00);
  EIMSK=(0<<INT1) | (0<<INT0);
  PCICR=(0<<PCIE2) | (0<<PCIE1) | (0<<PCIE0);

  // USART reset
  UCSR0B=(0<<RXCIE0) | (0<<TXCIE0) | (0<<UDRIE0) | (0<<RXEN0) | (0<<TXEN0) | (0<<UCSZ02) | (0<<RXB80) | (0<<TXB80);

  // Analog Comparator reset
  ACSR=(1<<ACD) | (0<<ACBG) | (0<<ACO) | (0<<ACI) | (0<<ACIE) | (0<<ACIC) | (0<<ACIS1) | (0<<ACIS0);
  ADCSRB=(0<<ACME);
  DIDR1=(0<<AIN0D) | (0<<AIN1D);

  // ADC reset
  ADCSRA=(0<<ADEN) | (0<<ADSC) | (0<<ADATE) | (0<<ADIF) | (0<<ADIE) | (0<<ADPS2) | (0<<ADPS1) | (0<<ADPS0);

  // SPI reset
  SPCR=(0<<SPIE) | (0<<SPE) | (0<<DORD) | (0<<MSTR) | (0<<CPOL) | (0<<CPHA) | (0<<SPR1) | (0<<SPR0);

  // TWI reset
  TWCR=(0<<TWEA) | (0<<TWSTA) | (0<<TWSTO) | (0<<TWEN) | (0<<TWIE);
}


void setup_pullup() {    
  // Port D6 set as input with pull-up    
  // Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
  DDRD=(0<<DDD7) | (0<<DDD6) | (0<<DDD5) | (0<<DDD4) | (0<<DDD3) | (0<<DDD2) | (0<<DDD1) | (0<<DDD0);
  // State: Bit7=T Bit6=P Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
  PORTD=(0<<PORTD7) | (1<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<<PORTD2) | (0<<PORTD1) | (0<<PORTD0);
}

void setup_pwm() {
  // Port D6 set as output (active high)
  // Function: Bit7=In Bit6=Out Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
  DDRD=(0<<DDD7) | (1<<DDD6) | (0<<DDD5) | (0<<DDD4) | (0<<DDD3) | (0<<DDD2) | (0<<DDD1) | (0<<DDD0);
  // State: Bit7=T Bit6=0 Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
  PORTD=(0<<PORTD7) | (0<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<<PORTD2) | (0<<PORTD1) | (0<<PORTD0);

  // Timer/Counter 0 initialization
  // Clock source: System Clock
  // Clock value: 8000.000 kHz
  // Mode: Fast PWM top=0xFF
  // OC0A output: Inverted PWM
  // OC0B output: Disconnected
  // OC0A Period: 32 ns
  TCCR0A=(1<<COM0A1) | (1<<COM0A0) | (0<<COM0B1) | (0<<COM0B0) | (1<<WGM01) | (1<<WGM00);
  TCCR0B=(0<<WGM02) | (0<<CS02) | (0<<CS01) | (1<<CS00);
  TCNT0=0x00;
  OCR0A=0xFF;
  OCR0B=0x00;
}

void set_led_on() {
#ifdef LED_PULLUP
  PORTD=PORTD | (1<<PORTD6);
#else
  OCR0A = LED_ON;
#endif
}

void set_led_dim() {
#ifdef LED_PULLUP
  PORTD=PORTD | (1<<PORTD6);
#else
  OCR0A = LED_DIM;
#endif
}

void set_led_off() {
#ifdef LED_PULLUP
  PORTD=PORTD & ~(1<<PORTD6);
#else
  OCR0A = LED_OFF;
#endif
}

void main(void) {
//const unsigned char message[] = " 0123456789 qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM &'@:,=.-+\"?/";    
  const unsigned char message[] = "  blink";    
//const unsigned char message[] = "  blink http://www.antonkrug.eu";
    
  const unsigned char *end      = message + sizeof(message);
  unsigned char       *index    = end;
    
  morse_code    letter;  

  // Initialise peripherals                      
  reset();     
#ifdef LED_PULLUP
  setup_pullup();
#else
  setup_pwm();
#endif

                   
  set_led_dim();

  while (1) {
    int8_t morse_alphabet_index;
    
    if (end == index) {
      index = message;  
      delay_ms(START_UP_DELAY);
    }
                            
    morse_alphabet_index = ascii_to_morse_alphabet[*index];  
    if (-1 == morse_alphabet_index) {
      // SPACE
      set_led_off();
      delay_ms(MORSE_UNIT * 7);
    } else {  
      // any other morse character
      letter = morse_alphabet[morse_alphabet_index];
           
      while (letter.length > 0) {
        set_led_on();
        if (letter.code & 1) {
          delay_ms(MORSE_UNIT * 3);      
        } else {
          delay_ms(MORSE_UNIT * 1);
        }
        
        set_led_off();
        delay_ms(MORSE_UNIT * 1);
          
        letter.code = letter.code >> 1;
        letter.length--;
      }  
      delay_ms(MORSE_UNIT * 3);
    }
           
    index++;        
  }
}
