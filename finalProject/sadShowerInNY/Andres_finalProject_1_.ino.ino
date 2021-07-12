
/* 
 name: Andres Ugartechea
 assignment: final project
 date: 07/11/2021

"Sad shower in New York" is an interactive painting working with sensors on Arduino, and reproduced and drawn on Processing. The serial communication between these
two software allows the user to be participant of the making of this melancholic piece.

For this code, I used as reference the example seen in my Introduction to Interactive Media class, which can be found in the following link:
https://github.com/michaelshiloh/resourcesForClasses/blob/master/src/arduinoSketches/serialExamples/basicArduinoToProcessing/basicArduinoToProcessing.ino

I'll use quote marks to distinguish between my professor's comments and mine.

 */
 

void setup() {
  // "initialize the serial communication:"
  Serial.begin(9600);

  // "Since both sides wait for each other before they send anything,
  // someone needs to start the conversation"
  Serial.println("0");
}

void loop() {
  while (Serial.available()) {
    Serial.parseInt(); // "no need to store the value since we don't need it"

    // "Only proceed if we have the end of line"
    if (Serial.read() == '\n') {
      int sensor1 = analogRead(A2);      //sensor 1: LDR
      delay(1);
      int sensor2 = analogRead(A5);      //sensor 2: potentiometer
      delay(1);
      int sensor3 = digitalRead(2);      //sensor 3: SPDT slide switch
      delay(1);
      int sensor4 = digitalRead(4);      //sensor 2: button switch
      Serial.print(sensor1);
      Serial.print(',');
      Serial.print(sensor2);
      Serial.print(',');
      Serial.print(sensor3);
      Serial.print(',');
      Serial.println(sensor4);           //note: '.println' is written only with the last sensor.
      
    }
  }
}
