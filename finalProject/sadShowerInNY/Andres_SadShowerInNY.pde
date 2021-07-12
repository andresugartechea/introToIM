/* 

 name: Andres Ugartechea
 assignment: final project
 date: 07/11/2021

"Sad shower in New York" is an interactive painting working with sensors on Arduino, and reproduced and drawn on Processing. The serial communication between these
two software allows the user to be participant of the making of this melancholic piece. 

The program was tested in a room with good illumination. Processing prints all the values detected by the sensors; in the case of the LDR, is the first one
detected from left to right. To make sure that the program works correctly, please WRITE the higher value that the LDR can detect 
in the place where you are after "int maxLight = " (REPLACE the default value on Processing). Then, cover the LDR and WRITE the value
detected  after "int minLight = " (REPLACE the default value as well).


 */
 
 
 
///////////////

//light detected
int maxLight = 950;
int minLight = 780;

//library for serial communication with Arduino
import processing.serial.*;
Serial myPort;

//library for adding sound
import processing.sound.*;
SoundFile showerSound;
SoundFile cryingSound;

//images
PImage sad;
PImage woman;
PImage water;
PImage shower;

//variables for sensors
int LDRtext = 0;                //LDR sensor: displays text
int LDRangle = 0;               //rotation angle of each letter from the text
int potTransparency = 0;        //(pot) potentiometer: changes de transparency of "water.png"
int potColor = 0;               //changes de color of each figure
int potAngle = 0;               //rotation angle of each figure
float potSound = 0;             //changes amplitude of "showerSound.mp3"
int slideSwitch = 0;            //SPDT switch: displays "woman.png"
int buttonSound = 0;            //button switch: plays "crying.wav" if pressed
//int buttonColor = 0;

///////////////

void setup() {
  size (800, 800);              //same size as original image to keep the same quality    
  background(255);

  //load images
  sad = loadImage ("sad.jpg");
  woman = loadImage("woman.png");
  water = loadImage("water.png");
  shower= loadImage("shower.png");

  //load sound
  showerSound = new SoundFile(this, "showerSound.mp3");
  cryingSound = new SoundFile(this, "crying.wav");


  //available serial ports
  printArray(Serial.list());
  String portname=Serial.list()[2];                      //SELECT the correct port
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');

  //play all sounds available (the sensors control de amplitude of each one)
  showerSound.loop();
  cryingSound.loop();
  
}

///////////////

void draw() {

  background(255);
  tint(255);

  //display all figures and "shower.png"
  thing2();
  trapezoid();
  thing1();
  Triangle();
  bigCircle();
  quarter();
  image(shower, 130, -80);
  lines();


  //displays "water.png" with a transparency that varies according to the potentiometer position
  tint(255, 255, 255, potTransparency);
  image(water, 95, -150);

  //displays "woman.png" when the SPDT is switched
  if (slideSwitch == 1) {
    tint(255);
    image(woman, 70, -35);
  }

  //displays the text when the LDR is covered
  if (LDRtext <=85) {
    texto();
  }
  
  //links the amplitude of the sounds to the position of the potentiometer and button switch respectively
  showerSound.amp(potSound);
  cryingSound.amp(buttonSound);
}

///////////////

void serialEvent (Serial myPort) {

  // "get the ASCII string:" 
  String s = myPort.readStringUntil('\n');
  // "trim off any whitespace:"
  s = trim(s);

  // "Always check to make sure the string isn't empty"
  if (s != null) {
    println(s);
    int values[]= int(split(s, ','));

    if (values.length==4) {
      LDRtext = (int)map(values[0], minLight, maxLight, 0, 100);   //minLight' and 'maxLight' change according to the lightning conditions
      LDRangle = (int)map(values[0], minLight, maxLight, 0, 20); 

      potTransparency = (int)map(values[1], 0, 1023, 0, 255); 
      potColor = (int)map(values[1], 0, 1023, 100, 255); 
      potAngle = (int)map(values[1], 0, 1023, 0, 360);             //max value = 360, because is a rotation in degrees
      potSound = map(values[1], 0, 1023, 0, 1);                    //max value = 1, because is an amplitude

      slideSwitch = values[2];                                     //it only has 0 and 1 as values

      buttonSound = values[3];
      //buttonColor = (int)map(values[3], 0, 1, 0, 255);          (not used anymore)
    }
  }

  //println(LDRtext);                                              (used to check if each variable was working correctly)

  // "Tell Arduino we're ready for another"
  myPort.write(1 + "\n"); // "could be any value"
}

///////////////

void lines() {
  stroke(0);
  strokeWeight(2);

  line(0, 518, 576, 510);
  line(378, 319, 365, 798);

  //same case for all the figures: the values change according to the potentiometer position. The values that are substracted to
  //'potColor' were calculated with (255 - orginal RGB value in the image).
  fill(potColor-97, potColor-83, potColor-132, potColor);
  
  beginShape();
  vertex(103, 743);
  vertex(99, 516);
  vertex(99, 516);
  vertex(104, 517);
  vertex(104, 517);
  vertex(106, 622);
  vertex(106, 622);
  vertex(369, 628);
  vertex(369, 628);
  vertex(368, 634);
  vertex(368, 634);
  vertex(106, 628);
  vertex(106, 628);
  vertex(109, 744);
  vertex(109, 744);
  vertex(103, 743);
  endShape();
}

///////////////

void Triangle() {
  push();
  translate(507, 800);
  rotate(radians(potAngle-360));                                    //this makes rotate the figure depending on the potentiometer position
  fill (potColor, potColor-191, potColor-236, potColor);
  noStroke();
  triangle(66, -269, -138, -148, 0, 0);
  pop();
}

///////////////

void bigCircle() {
  push();
  translate(800, 800);
  rotate(radians(potAngle));
  fill(potColor-116, potColor, potColor, potColor);
  noStroke();
  circle(-691, -182, 200);
  pop();
}

///////////////

void quarter() {
  push();
  translate(368, 800);
  rotate(radians(-potAngle));
  fill(potColor, potColor-98, potColor-236, potColor);
  noStroke();
  arc(-262, -179, 208, 208, radians(269), radians(362));
  pop();
}

///////////////

void thing1() {
  fill(0, potColor-68, potColor-123, potColor);
  noStroke();
  arc(152, 623, 220, 302, radians(315), radians(361));
}

///////////////

void thing2() {
  fill(0, potColor-68, potColor-123, potColor);
  noStroke();
  quad(228, 515, 104, 517, 106, 622, 228, 624);
}

///////////////

void trapezoid() {
  push();
  translate(0, 425);
  rotate(radians(-potAngle));
  noStroke();
  fill(potColor-194, potColor-234, potColor-97, potColor);
  quad(40, -181, 356, -111, 290, 87, 0, 0);
  pop();
}

///////////////

void texto() {

  fill(0, 130);

  //first line: "it's" (separation of 4 px)
  textSize(14);
  //text("it's", 567, 247);
  push();
  translate(567, 247);
  rotate(radians(-LDRangle));          //each letter rotates slightly 
  text("i", 0, 0);
  pop();

  push();
  translate(571, 247);
  rotate(radians(LDRangle));
  text("t", 0, 0);
  pop();

  push();
  translate(575, 247);
  rotate(radians(LDRangle));
  text("'", 0, 0);
  pop();

  push();
  translate(579, 247);  
  rotate(radians(-LDRangle));
  text("s", 0, 0);  
  pop();

  //2nd line: "it's" (separation of 13)
  textSize(22);
  //text("okay,", 563, 261);
  push();
  translate(563, 261);
  rotate(radians(-LDRangle));
  text("o", 0, 0);
  pop();

  push();
  translate(576, 261);
  rotate(radians(LDRangle));
  text("k", 0, 0);
  pop();

  push();
  translate(589, 261);
  rotate(radians(LDRangle));
  text("a", 0, 0);
  pop();

  push();
  translate(602, 261);
  rotate(radians(-LDRangle));
  text("y", 0, 0);
  pop();

  push();
  translate(612, 261);
  rotate(radians(LDRangle));
  text(",", 0, 0);
  pop();


  //3rd line: "you'll" (separation  of aprox 9);
  textSize(15);
  //text("you'll", 565, 272);
  push();
  translate(565, 272);
  rotate(radians(-LDRangle));
  text("y", 0, 0);
  pop();

  push();
  translate(573, 272);
  rotate(radians(-LDRangle));
  text("o", 0, 0);
  pop();

  push();
  translate(582, 272);
  rotate(radians(LDRangle));
  text("u", 0, 0);
  pop();

  push();
  translate(591, 272);
  rotate(radians(-LDRangle));
  text("'", 0, 0);
  pop();

  push();
  translate(595, 272);
  rotate(radians(LDRangle));
  text("l", 0, 0);
  pop();

  push();
  translate(599, 272);
  rotate(radians(LDRangle));
  text("l", 0, 0);
  pop();

  //4th line: "okay" (separation of aprox 11)
  textSize(17);
  //text("be okay", 563, 285);
  push();
  translate(563, 285);
  rotate(radians(LDRangle));
  text("b", 0, 0);
  pop();

  push();
  translate(574, 285);
  rotate(radians(-LDRangle));
  text("e", 0, 0);
  pop();

  push();
  translate(589, 285);
  rotate(radians(LDRangle));
  text("o", 0, 0);
  pop();

  push();
  translate(599, 285);
  rotate(radians(-LDRangle));
  text("k", 0, 0);
  pop();

  push();
  translate(609, 285);
  rotate(radians(LDRangle));
  text("a", 0, 0);
  pop();

  push();
  translate(618, 285);
  rotate(radians(-LDRangle));
  text("y", 0, 0);
  pop();
}
