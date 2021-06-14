
//buttons
const int yellowButton = A0;
const int redButton = A2;
const int greenButton = A4;

//leds
const int yellowLED = 8;
const int redLED = 10;
const int greenLED = 12;

//button states
int BSyellow = 0;
int BSred = 0;
int BSgreen = 0;


void setup() {
  Serial.begin(9600);
  
  pinMode(yellowButton, INPUT);
  pinMode(redButton, INPUT);
  pinMode(greenButton, INPUT);
  
  pinMode(yellowLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  pinMode(greenLED, OUTPUT);
}



void loop()
{
  BSyellow = digitalRead(yellowButton);
  if (BSyellow == HIGH)
  {
    digitalWrite(yellowLED, HIGH);
  } 
  else{
    digitalWrite(yellowLED, LOW);
  }
  
  BSred = digitalRead(redButton);
  if (BSred == HIGH)
  {
    digitalWrite(redLED, LOW);
  } 
  else{
    digitalWrite(redLED, HIGH);
  }

  BSgreen = digitalRead(greenButton);
  if (BSgreen == HIGH)
  {
    digitalWrite(greenLED, LOW);
  } 
  else{
    digitalWrite(greenLED, HIGH);
  }
}
