//LEDs
const int yellowLED = 10;
const int redLED = 7;
const int greenLED = 4;



void setup() {
  Serial.begin(9600);

  pinMode(yellowLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  pinMode(greenLED, OUTPUT);

}

void loop() {

    //LED states
    int yellowLS = digitalRead(yellowLED);
    int redLS = digitalRead(redLED);
    int greenLS = digitalRead(greenLED);
    
    if(Serial.available() >0) {

    char buttonPressed = Serial.read();

    //YGR
    if ((buttonPressed == '1') && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(yellowLED, HIGH);
    }
    if ((buttonPressed == '3') && (yellowLS == HIGH && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, LOW);
    }
    if ((buttonPressed == '2') && (yellowLS == LOW && redLS == HIGH && greenLS == HIGH))
    {
      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, HIGH);
      Serial.println("YOU WIN");
    }

  //YRG
    if ((buttonPressed == '1') && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(yellowLED, HIGH);
    }
    if ((buttonPressed == '2') && (yellowLS == HIGH && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, HIGH);
    }
    if ((buttonPressed == '3') && (yellowLS == HIGH && redLS == LOW && greenLS == HIGH))
    {
      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
    }

//////////
      //GYR
    if ((buttonPressed == '3') && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(greenLED, HIGH);
    }
    if ((buttonPressed == '1') && (yellowLS == LOW && redLS == LOW && greenLS == HIGH))
    {
      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, LOW);
    }
  
  
  //GRY
    if ((buttonPressed == '3') && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(greenLED, HIGH);
    }
    if ((buttonPressed == '2') && (yellowLS == LOW && redLS == LOW && greenLS == HIGH))
    {
      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, HIGH);
    }
    if ((buttonPressed == '1') && (yellowLS == HIGH && redLS == LOW && greenLS == HIGH))
    {
      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
    }
  
  
  //Solution: GYR
    if ((buttonPressed == '3') && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(greenLED, HIGH);
    }
    if ((buttonPressed == '1') && (yellowLS == LOW && redLS == LOW && greenLS == HIGH))
    {
      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, LOW);
    }
  
  
  //RYG
    if ((buttonPressed == '2') && (yellowLS == LOW && redLS == LOW && greenLS == LOW))
    {
      digitalWrite(redLED, HIGH);
    }
    if ((buttonPressed == '1') && (yellowLS == LOW && redLS == HIGH && greenLS == LOW))
    {
      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, LOW);
    }
    if ((buttonPressed == '3') && (yellowLS == LOW && redLS == HIGH && greenLS == HIGH))
    {
      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
    }
  
  
  //reset
    if ((buttonPressed == '3') && (yellowLS == HIGH && redLS == HIGH && greenLS == HIGH))
    {
      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
    }
    if ((buttonPressed == '1') && (yellowLS == HIGH && redLS == HIGH && greenLS == HIGH))
    {
      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
    }

  }
}
