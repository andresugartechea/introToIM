/*
 * Name: Andres Ugartechea 
 * Date: 06/21/21
 * Assignment: Make a musical instrument:
 *             You must use at least one digital sensor (switch, either momentary or toggle).
 *             You must use at least one analog sensor (photoresistor, potentiometer, or distance measuring sensor).
 *             
 * In this program, we're going to create a instrument that plays all the notes in the C major scale, using an ultrasonic distance sensor and a switch. 
 * The principle is to play the instrument placing a hand in front of the sensor. The note played changes according to the distance and the switch changes the notes in the scale.
 */

#include "pitches.h"


//button
const int button = A2;
int buttonState = 0;


//for this code, to understand how the ultrasonic distance sensor works, I used as reference the example in https://learn.sparkfun.com/tutorials/sparkfun-inventors-kit-experiment-guide---v41/circuit-3b-distance-sensor. 
//(I'll write with quotation marks the comments that belong to the original code)

//ultrasonic distance sensor
const int trigPin = 10;           //trigger pin (see schematic)
const int echoPin = 12;
float distance = 0;




void setup()
{
  Serial.begin (9600);        //"set up a serial connection with the computer"

 //for the distance sensor
  pinMode(echoPin, INPUT);    //"the echo pin will measure the duration of pulses coming back from the distance sensor"
  pinMode(trigPin, OUTPUT);   //"the trigger pin will output pulses of electricity"

  //for the button
  pinMode(button, INPUT);
}




void loop() {

  //the button state now changes if the button is pressed or not in the real world
  buttonState = digitalRead(button);
   
  distance = getDistance();   //'getDistance()' is defined later. It stores de distance captured by the sensor
  //these next two lines are not necessary to make the instrument work, but they helped defined the distances between each note in the scale
  Serial.print(distance);
  Serial.println(" in");

 
  //BUTTON NON-PRESSED: C, D, E, and F can  be played
  if ((buttonState == LOW)&&(distance <= 3)) {
    tone(8, NOTE_C5);
  } else if ((buttonState == LOW)&&(3 < distance && distance < 6)) { //if the object is a medium distance
    tone(8, NOTE_D5);
  } else if ((buttonState == LOW)&&(6 < distance && distance < 9)) { //if the object is a medium distance
    tone(8, NOTE_E5);
  } else if ((buttonState == LOW)&&(9 < distance && distance < 12)) { //if the object is a medium distance
    tone(8, NOTE_F5);
  } else if ((buttonState == LOW)&&(12 <= distance)) { //if the object is a medium distance
    noTone(8);          //nothing sounds when the hand isn't placed in front of the sensor
  }

  
  //BUTTON PRESSED: G, A, B, and C can  be played
  if ((buttonState == HIGH)&&(distance <= 3)) {
    tone(8, NOTE_G5);
  } else if ((buttonState == HIGH)&&(3 < distance && distance < 6)) { //if the object is a medium distance
    tone(8, NOTE_A5);
  } else if ((buttonState == HIGH)&&(6 < distance && distance < 9)) { //if the object is a medium distance
    tone(8, NOTE_B5);
  } else if ((buttonState == HIGH)&&(9 < distance && distance < 12)) { //if the object is a medium distance
    tone(8, NOTE_C6);
  }

  delay(50);      //"delay 50ms between each reading"
}



float getDistance()
{
  float echoTime;                   //"variable to store the time it takes for a ping to bounce off an object"
  float calculatedDistance;         //"variable to store the distance calculated from the echo time"

  //"send out an ultrasonic pulse that's 10ms long"
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  echoTime = pulseIn(echoPin, HIGH);      //"use the pulsein command to see how long it takes for the
                                          //pulse to bounce back to the sensor"

  calculatedDistance = echoTime / 148.0;  //"calculate the distance of the object that reflected the pulse (half the bounce time multiplied by the speed of sound)"

  return calculatedDistance;              //"send back the distance that was calculated"
}
