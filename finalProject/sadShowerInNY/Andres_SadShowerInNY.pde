//communication with Arduino
import processing.serial.*;       //library for communicating with Arduino
Serial myPort;



//Sound: https://www.youtube.com/watch?v=69IuP6uOmRA&ab_channel=MeriEngel
import processing.sound.*;
SoundFile showerSound;
SoundFile cryingSound;

//Images
PImage sad;
PImage woman;
PImage water;
PImage shower;

//variables for sensors
int LDRtext = 0;
int LDRangle = 0;
int potTransparency = 0;
int potColor = 0;
int potAngle = 0;
float potSound = 0;
int slideSwitch = 0;
int buttonSound = 0;
int buttonColor = 0;


//Light detected
int maxLight = 950;
int minLight = 780;



void setup() {
  size (800, 800);
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
  //choose the correct port
  String portname=Serial.list()[2];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');

  //el volumen sube o baja dependiendo del potenciómetro
  showerSound.loop();
  cryingSound.loop();
}




void draw() {

  background(255);
  tint(255);

  //figuras geométricas
  thing2();
  trapezoid();
  thing1();
  Triangle();
  bigCircle();
  quarter();
  image(shower, 130, -80);
  lines();


  //agua transparencia
  tint(255, 255, 255, potTransparency);
  image(water, 95, -150);

  if (slideSwitch == 1) {
    tint(255);
    image(woman, 70, -35);
  }

  if (LDRtext <=85) {
    texto();
  }


  showerSound.amp(potSound);
  cryingSound.amp(buttonSound);
}






void serialEvent (Serial myPort) {

  // get the ASCII string:
  String s = myPort.readStringUntil('\n');
  // trim off any whitespace:
  s = trim(s);

  // Always check to make sure the string isn't empty
  if (s != null) {
    println(s);
    int values[]= int(split(s, ','));

    if (values.length==4) {
      LDRtext = (int)map(values[0], minLight, maxLight, 0, 100);   //los valores cambian dependiendo de la hora)
      LDRangle = (int)map(values[0], minLight, maxLight, 0, 20);

      potTransparency = (int)map(values[1], 0, 1023, 0, 255); 
      potColor = (int)map(values[1], 0, 1023, 100, 255);
      potAngle = (int)map(values[1], 0, 1023, 0, 360);  
      potSound = map(values[1], 0, 1023, 0, 1); 

      slideSwitch = values[2];

      buttonSound = values[3];
      buttonColor = (int)map(values[3], 0, 1, 0, 255);
    }
  }

  //println(LDRtext);

  // Tell Arduino we're ready for another
  myPort.write(1 + "\n"); // could be any value
}

void lines() {
  stroke(0);
  strokeWeight(2);

  line(0, 518, 576, 510);
  line(378, 319, 365, 798);

  fill(potColor-97, potColor-83, potColor-132, potColor);
  //éstas sí van pegadas PEGAR!
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



//gira el triángulo con el potenciómetro
void Triangle() {
  push();
  translate(507, 800);
  rotate(radians(potAngle-360));
  fill (potColor, potColor-191, potColor-236, potColor);
  noStroke();
  triangle(66, -269, -138, -148, 0, 0);
  pop();
}



void bigCircle() {
  push();
  translate(800, 800);
  rotate(radians(potAngle));
  fill(potColor-116, potColor, potColor, potColor);
  noStroke();
  circle(-691, -182, 200);
  pop();
}

void quarter() {
  push();
  translate(368, 800);
  rotate(radians(-potAngle));
  fill(potColor, potColor-98, potColor-236, potColor);
  noStroke();
  arc(-262, -179, 208, 208, radians(269), radians(362));
  pop();
}

void thing1() {
  fill(0, potColor-68, potColor-123, potColor);
  noStroke();
  arc(152, 623, 220, 302, radians(315), radians(361));
}

void thing2() {
  fill(0, potColor-68, potColor-123, potColor);
  noStroke();
  quad(228, 515, 104, 517, 106, 622, 228, 624);
}


void trapezoid() {
  push();
  translate(0, 425);
  rotate(radians(-potAngle));
  noStroke();
  fill(potColor-194, potColor-234, potColor-97, potColor);
  quad(40, -181, 356, -111, 290, 87, 0, 0);
  pop();
}

void texto() {

  fill(0, 130);

  //first line: "it's" (separation of 4 px)
  textSize(14);
  //text("it's", 567, 247);
  push();
  translate(567, 247);
  rotate(radians(-LDRangle));
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
