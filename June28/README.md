# Intro to IM | 06/28/2021 : working with "Arduino"

## Serial communication with Arduino and Processing:

For this assignment, we needed to make a simple game involving communication between Arduino and Processing. I wanted to be able to understand how this communication works, so for my concept I decided to worked upon a puzzle I had already coded on [June 14th](https://github.com/andresugartechea/introToIM/tree/main/June14) using switches. For this new version, I wanted to replace the switches for buttons on the screen, so the user could control the LEDs from Processing.

For the code, I used as reference the [_Graph_](https://www.arduino.cc/en/Tutorial/BuiltInExamples/Graph/) example from Arduino.


#### Schematic and circuit:

This is the schematic of the circuit:

<img src="schematic.jpg" width="400" />

This is the circuit built:

<img src="circuit.jpg" width="600" />

#### Problems and results:

On Arduino:
````
    if ((yellowLS == HIGH && redLS == HIGH && greenLS == HIGH)) {                           //This part didn't work for the same reasons I explained above.
      Serial.write(win = 1);
    } else {
      Serial.write(win = 0);
    }
````
On Processing:
````
  if (win == 1) {                              //It doesn't work, but it was supposed to change the background when the player wins.
    background(255);
  }
````

### Final result:

[Click here to see how the program works](https://youtu.be/HfPBJU-Ug58) 
