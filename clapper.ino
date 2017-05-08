const int relay = 2;
const int soundPin = A0;
int state;
int clap;
const int clapThresh = 40;
bool light;
const long gap = 50; // puase to not count echo
const long quiet = 200; //period that must be quiet to distiguish between clap and noise
const long pause = 2000;
unsigned long startTime;

//states
const int idle = 0;
const int clap1  = 1;
const int wait = 2;
const int switching = 3;

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

void loop() {
  clap = analogRead(soundPin);
  switch (state) {
    case idle:
      if (clap > clapThresh) {
        state = wait;
        startTime = millis();
      }
      break;
    case wait:
      if (millis()- startTime > gap) {
        if (clap > clapThresh) {
          state = idle;
        }
        if (millis() - startTime > quiet) {
          state = clap1;
          startTime = millis();
        }
      }
      break;
    case clap1:
      if (millis()- startTime > pause) {
        state = idle;
      }
      if (clap > clapThresh) {
        state = switching;
      }
      break;
    case switching:
      light = !light;      
      toggle();
      state = idle;
      break;
  }
  if (clap > clapThresh) {
    Serial.print("Clap = ");
    Serial.print(clap);
    Serial.print("  State = ");
    Serial.println(state);
  }
}
      
