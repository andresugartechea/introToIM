/*
  Name: Andres Ugartechea
  Date: 06/28/21
  Assignment: Make a simple game that involves some kind of communication between Arduino and Processing.
              Always use handshaking
              Document as before.
              Post a screenshot and short description to Discord

  I worked upon a puzzle I've previously coded on June 14th using switches. In this new version I replace the switches for buttons on the Processing's screen.
*/


//LEDs
const int yellowLED = 10;
const int redLED = 7;
const int greenLED = 4;

int win;                                      //this part of the program didn't work. It was meant to communicate from Arduino to Processing after the 3 LEDs were on.

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


  Serial.write(win);                           //this part also didn't work. I was going to use the state of 'win' to make appear a "End game" screen when the puzzle is resolved.

  if (Serial.available() > 0) {

    char buttonPressed = Serial.read();        //"Handshaking", it starts working when it reads something from Processing


    //Different combinations (Y = Yellow button, G = Green button, R = Red Button)
    //On Processing (buttonPressed == '1' is the yellow one, '2' is red and '3' green)

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


    /////SOLUTION: GYR
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
    if ((buttonPressed == '2') && (yellowLS == LOW && redLS == HIGH && greenLS == HIGH))
    {

      //When resolved, the three LEDs blink 3 times

      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, HIGH);
      delay(300);

      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
      delay(300);

      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, HIGH);
      delay(300);

      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
      delay(300);

      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, HIGH);
      delay(300);

      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
      delay(300);

      digitalWrite(greenLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, HIGH);
      delay(300);

      digitalWrite(greenLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
      delay(1000);
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


    if ((yellowLS == HIGH && redLS == HIGH && greenLS == HIGH)) {                           //This part didn't work for the same reasons I explained above.
      Serial.write(win = 1);
    } else {
      Serial.write(win = 0);
    }

  }
}
