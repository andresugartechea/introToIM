/*
 * Name: Andres Ugartechea 
 * Date: 06/17/21
 * Assignment: Get information from at least one analog sensor and at least one digital sensor (switch), 
 *             and use this information to control at least two LEDs, 
 *             one in a digital fashion and the other in an analog fashion, 
 *             in some creative way.
 */

//sensors
const int button = A0;
const int LDR = A2;

//LEDs
const int LED1 = 3;
const int LED2 = 6;

//sensors states
int buttonState = 0;
int LDRvalue = 0;

//LEDs states
int  LED1State = 0;
int  LED2State = 0;


void setup() {
  Serial.begin(9600);
  
  pinMode(button, INPUT);
  pinMode(LDR, INPUT);
  
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
}



void loop() {
  
  buttonState = digitalRead(button);
  LDRvalue = analogRead(LDR);
  LED1State = digitalRead(LED1);
  LED2State = digitalRead(LED2);


  //instructions for the button

  //1. if button non-pressed, LEDs are on
  if (buttonState == LOW){
    digitalWrite(LED1, HIGH);
    digitalWrite(LED2, HIGH);
  }
  
  //2. if buttton pressed, LEDs blink
  if (buttonState == HIGH){
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, HIGH);
    delay(100);
    digitalWrite(LED1, HIGH);
    digitalWrite(LED2, LOW);
    delay(100);
  }



  //instructions for the LDR

  //1. if normal light, LEDs are on (interval set after testing AnalogReadSerial)
  if (LDRvalue >= 960 && LDRvalue <=970){
    digitalWrite(LED1, HIGH);
    digitalWrite(LED2, HIGH);
  }
  
  //2. if shadow, LEDs fade slowly
  if (LDRvalue < 960){
    for (int fadeValue = 0 ; fadeValue <= 255; fadeValue += 5) {
      analogWrite(LED1, fadeValue);
      analogWrite(LED2, fadeValue);
      delay(20);
    }
    for (int fadeValue = 255 ; fadeValue >= 0; fadeValue -= 5) {
      analogWrite(LED1, fadeValue);
      analogWrite(LED2, fadeValue);
      delay(20);
    }
  }

  //3. if more light (flashlight), LEDs fade fast
  if (LDRvalue > 970){
    for (int fadeValue = 0 ; fadeValue <= 255; fadeValue += 5) {
      analogWrite(LED1, fadeValue);
      analogWrite(LED2, fadeValue);
      delay(5);
    }
    for (int fadeValue = 255 ; fadeValue >= 0; fadeValue -= 5) {
      analogWrite(LED1, fadeValue);
      analogWrite(LED2, fadeValue);
      delay(5);
    }
  }
}


 
