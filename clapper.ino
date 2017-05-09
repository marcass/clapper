const int relay = 2;
const int soundPin = A0;
int state;
int sound;
const int clapThresh = 2;
bool light;
const long gap = 40; // puase to not count echo
const long quiet = 200; //period that must be quiet to distiguish between clap and noise
const long pause = 2000;
unsigned long startTime; //time for sequence of claps
unsigned long clapTime; //time for each clap

#define debug

//states
const int idle = 0;
const int clapCheck = 1;
const int clap1 = 2;
const int clap2 = 3;
const int switching = 4;
int nextState;

void setup() {
  Serial.begin(9600);
  pinMode(relay, OUTPUT);
  digitalWrite(relay, LOW);
  light = false;
  state = idle;
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

void loop() {
  sound = analogRead(soundPin);
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
      
