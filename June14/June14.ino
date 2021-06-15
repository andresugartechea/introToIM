/*
 * Name: Andres Ugartechea 
 * Date: 06/14/21
 * Assignment: using at least three momentary switches (often called buttons), and at least three LEDs, create a puzzle that can be solved by pressing the buttons. Each switch must not simply turn on a corresponding LED.
 */


//buttons
const int yellowButton = A0;
const int redButton = A2;
const int greenButton = A4;

//LEDs
const int yellowLED = 8;
const int redLED = 10;
const int greenLED = 12;

//button states
int yellowBS = 0;
int redBS = 0;
int greenBS = 0;

//LED states
int yellowLS = 0;
int redLS = 0;
int greenLS = 0;



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
  //button states
  yellowBS = digitalRead(yellowButton);
  redBS = digitalRead(redButton);
  greenBS = digitalRead(greenButton);
  //LED states
  yellowLS = digitalRead(yellowLED);
  redLS = digitalRead(redLED);
  greenLS = digitalRead(greenLED);


///Here I start testing the combinations. There's only one posible solution: GYR (Green, Yellow and Red)

//YGR
  if ((yellowBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(yellowLED, HIGH);
  }
  if ((greenBS == HIGH) && (yellowLS == HIGH && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, HIGH);
    digitalWrite(yellowLED, LOW);
  }
  if ((redBS == HIGH) && (yellowLS == LOW && redLS == HIGH && greenLS == HIGH))
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, HIGH);
    digitalWrite(yellowLED, HIGH);
  }


//YRG
  if ((yellowBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(yellowLED, HIGH);
  }
  if ((redBS == HIGH) && (yellowLS == HIGH && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, LOW);
    digitalWrite(yellowLED, HIGH);
  }
  if ((greenBS == HIGH) && (yellowLS == HIGH && redLS == LOW && greenLS == HIGH))
  {
    digitalWrite(greenLED, LOW);
    digitalWrite(redLED, LOW);
    digitalWrite(yellowLED, LOW);
  }


//GYR
  if ((greenBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(greenLED, HIGH);
  }
  if ((yellowBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == HIGH))
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, HIGH);
    digitalWrite(yellowLED, LOW);
  }


//GRY
  if ((greenBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(greenLED, HIGH);
  }
  if ((redBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == HIGH))
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, LOW);
    digitalWrite(yellowLED, HIGH);
  }
  if ((yellowBS == HIGH) && (yellowLS == HIGH && redLS == LOW && greenLS == HIGH))
  {
    digitalWrite(greenLED, LOW);
    digitalWrite(redLED, LOW);
    digitalWrite(yellowLED, LOW);
  }


//Solution: GYR
  if ((greenBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(greenLED, HIGH);
  }
  if ((yellowBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == HIGH))
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, HIGH);
    digitalWrite(yellowLED, LOW);
  }


//RYG
  if ((redBS == HIGH) && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
  {
    digitalWrite(redLED, HIGH);
  }
  if ((yellowBS == HIGH) && (yellowLS == LOW && redLS == HIGH && greenLS == LOW))
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, HIGH);
    digitalWrite(yellowLED, LOW);
  }
  if ((greenBS == HIGH) && (yellowLS == LOW && redLS == HIGH && greenLS == HIGH))
  {
    digitalWrite(greenLED, LOW);
    digitalWrite(redLED, LOW);
    digitalWrite(yellowLED, LOW);
  }



//reset
  if ((greenBS == HIGH) && (yellowLS == HIGH && redLS == HIGH && greenLS == HIGH))
  {
    digitalWrite(greenLED, LOW);
    digitalWrite(redLED, LOW);
    digitalWrite(yellowLED, LOW);
  }
  if ((yellowBS == HIGH) && (yellowLS == HIGH && redLS == HIGH && greenLS == HIGH))
  {
    digitalWrite(greenLED, LOW);
    digitalWrite(redLED, LOW);
    digitalWrite(yellowLED, LOW);
  }

}
