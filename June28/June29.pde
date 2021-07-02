/*
  Name: Andres Ugartechea 
 Date: 06/28/21
 Assignment: Make a simple game that involves some kind of communication between Arduino and Processing.
 Always use handshaking
 Document as before.
 Post a screenshot and short description to Discord
 
 I worked upon a puzzle I've previously coded on June 14th using switches. In this new version I replace the switches for buttons on the Processing's screen.
 */

import processing.serial.*;       //library for communicating with Arduino
Serial myPort;

int D = 100;                      //Diameter buttons
int space= 150;                   //space between each button
int win;                          //This was supposed to indicate the state of the game. It changes when the three LEDs are on.

void setup() {
  size(700, 400);

  //Seen in class
  printArray(Serial.list());
  String portname=Serial.list()[0];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}



void draw() {

  background (0);
  buttons();                                  //this draws the buttons

  //Distances between the cursor and the buttons. This helps to make them clickable
  //first button
  float d1 = dist(mouseX, mouseY, width/2-space, height/2);
  //second button
  float d2 = dist(mouseX, mouseY, width/2, height/2);
  //third button
  float d3 = dist(mouseX, mouseY, width/2+space, height/2);

  if (myPort.available()>0) {                  //handshaking

    win = myPort.read();                       //it didn't work as expected. See Arduino code for reference

    if (mousePressed && (d1 <= D/2)) {
      fill(255, 255, 0);
      circle(width/2-space, height/2, D);
      myPort.write('1');                       //'myPort.write();' communicates with Arduino to change the state of the buttons and turn on each LED.
    }

    if (mousePressed && (d2 <= D/2)) {
      fill(255, 0, 0);
      circle(width/2, height/2, D);
      myPort.write('2');
    }

    if (mousePressed && (d3 <= D/2)) {
      fill(0, 255, 0);
      circle(width/2+space, height/2, D);
      myPort.write('3');
    }
  }

  if (win == 1) {                              //It doesn0t work, but it was supposed to change the background when the player wins.
    background(255);
  }
}





////////This was part of the first test that I did, following the examples seen in class
/*
void SerialEvent (Serial myPort){
 String win = myPort.readStringUntil('\n'); 
 win=trim(win);
 
 }
 */

void buttons() {

  //second button
  fill(150, 0, 0);
  circle(width/2, height/2, D);
  //first button
  fill(150, 150, 0);
  circle(width/2-space, height/2, D);
  //third button
  fill(0, 150, 0);
  circle(width/2+space, height/2, D);
}
