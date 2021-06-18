# Intro to IM | 06/14/2021 : working with "Arduino"

## Puzzle on Arduino

The instructions for this assignment were to _"get information from at least one analog sensor and at least one digital sensor (switch), and use this information to control at least two LEDs, one in a digital fashion and the other in an analog fashion, in some creative way."_

#### Schematic and circuit:

We saw in class that we could make the LEDs fade with an analog sensor (LDR), and I liked when we made them blink using a _delay()_. So for this project I wanted to mixed both example to practice.

The LEDs can behave in 3 different ways depending on the conditions:
- 1. With morning light, if the button is not being pressed, the LEDs are on.
- 2. With morning light, if the button is being pressed, the LEDs blink.
- 3. Without the button being pressed, with faint light, the LEDs fade slowly.
- 4. Without the button being pressed, with extra light, the LEDs fade fast.

#### Schematic and circuit:

This is the schematic of the circuit:

<img src="schematic2.jpg" width="800" />

This is the circuit built:

<img src="circuit.jpg" width="800" />

#### Problems and results:



````
  //1. if normal light, LEDs are on (interval set after testing AnalogReadSerial)
  if (LDRvalue >= 960 && LDRvalue <=970){
    digitalWrite(LED1, HIGH);
    digitalWrite(LED2, HIGH);
  }
````

### Final result:

[Click here to see how this program works.](https://youtu.be/BTft7RbqRRs) 

