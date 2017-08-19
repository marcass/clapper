#include <avr/io.h>
#include "FastRunningMedian.h"

//#define debug
//#define nano
#define attiny
//#define avr
#define basic

#ifdef attiny
  const int relay = 1; //D1 on attiny, 6 on nano
  const int soundPin = 1; //A0 on arduino, A1 on attiny
#endif
#ifdef nano
  const int relay = 6; //1 on attiny, 6 on nano
  const int soundPin = 0; //A0 on arduino, 2 on attiny
#endif

int state;
int sound;
const int clapThresh = 2;
bool light;
const long gap = 40; // puase to not count echo
const long quiet = 200; //period that must be quiet to distiguish between clap and noise
const long pause = 2000;
unsigned long startTime; //time for sequence of claps
unsigned long clapTime; //time for each clap
FastRunningMedian<int, 16, 1> newMedian;



//states
const int idle = 0;
const int clapCheck = 1;
const int clap1 = 2;
const int clap2 = 3;
const int switching = 4;
int nextState;

void setup() {
  #ifdef avr
    ADMUX |= (1 << REFS0);   //sets reference voltage to internal 1.1V
    #ifdef attiny
      ADMUX |= (0 << MUX0);   //combined with next line…
      ADMUX |= (1 << MUX1);   //sets ADC1 as analog input channel
    #endif
    #ifdef nano
      ADMUX |= (0 << MUX0);
      ADMUX |= (0 << MUX1); //preceding and folling lines inlc this one for ADC on nano
      ADMUX |= (0 << MUX3);
    #endif
    ADMUX |= (1 << ADLAR);   //left adjusts for 8-bit resolution
    ADCSRA |= (1 << ADEN);   //enables the ADC
    ADCSRA |= (1 << ADPS1);   //with next line…
    ADCSRA |= (1 << ADPS0);   //set division factor-8 for 125kHz ADC clock
  #endif
  #ifdef debug
    Serial.begin(9600);
    Serial.println("Starting clapper");
  #endif
  pinMode(relay, OUTPUT);
  digitalWrite(relay, LOW);
  light = false;
  state = idle;
  //ADC setiup
  ADMUX |= (1 << REFS0);   //use internal reference voltage of 1.1V
}

void toggle() {
  //delay(1000);
  if (light) {
    digitalWrite(relay, HIGH);
    //light = false;
    delay(2000);
  }
  if (!light){
    digitalWrite(relay, LOW);
    delay(2000);
  }
}

void clap_detect(int target_state){
  //a clap is a short loud sound followed by no sound
  if (millis()- clapTime > gap){ //wipe effect of echoes
    if (sound > clapThresh) { //if clap happens in quite time go back to idle
      delay(1000);
      startTime = 0;
      clapTime = 0;
      state = idle;
      #ifdef debug
        Serial.println("Sound in gap -> idle");
      #endif
    }
    if (millis() - clapTime > quiet) {
      state = target_state;
      #ifdef debug
        Serial.print("Quiet for long enough, migrating to state ");
        Serial.println(target_state);
      #endif
    }
  }
}

int readMic(){
  ADCSRA |= (1 << ADSC);   //start conversion
  //delayMicroseconds(5);
  return ADCH;   //store data in analogData variable
}

void loop() {
  #ifdef avr
    sound = readMic();
  #endif
  #ifdef basic
    sound = analogRead(soundPin);
  #endif
  switch (state) {
    case idle:
      if (sound > clapThresh){
        startTime = millis();
        clapTime = millis();
        state = clapCheck;
        nextState = clap1;
        #ifdef debug
          Serial.print("Sound heard, going to ");
          Serial.println(state);
        #endif
      }
      break;
    case clapCheck:
      clap_detect(nextState);
      break;
    case clap1:
      if (millis() - startTime > pause) {
        state = idle;
        #ifdef debug
          Serial.print("No additional clap, going to ");
          Serial.println(state);
        #endif
      }
      if (sound > clapThresh){
        clapTime = millis();
        state = clapCheck;
        nextState = switching;
        #ifdef debug
          Serial.print("Sound heard, going to ");
          Serial.println(state);
        #endif
      }
      break;
    case switching:
      light = !light;      
      toggle();
      state = idle;
      startTime = 0;
      clapTime = 0;
      break;
  }
  #ifdef debug
    if (sound > clapThresh) {
      Serial.print("Sound = ");
      Serial.print(sound);
      Serial.print("  State = ");
      Serial.println(state);
    }
  #endif
}
      
