import processing.serial.*;
Serial myPort;
String myText="";  //QPD

int D = 100;
int space= 150;

void setup(){
  size(700,400);
  printArray(Serial.list());
  String portname=Serial.list()[0];
  println(portname);
  myPort = new Serial(this,portname,9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}



void draw(){
  
  background (0);
  buttons();
  
  myText="";  //QUEPEDO
  
  //first button
  float d1 = dist(mouseX, mouseY, width/2-space, height/2);
  //second button
  float d2 = dist(mouseX, mouseY, width/2, height/2);
  //third button
  float d3 = dist(mouseX, mouseY, width/2+space, height/2);
  
  
  if(mousePressed && (d1 <= D/2)){
    fill(255,255,0);
    circle(width/2-space, height/2, D);
    myPort.write('1');
  }
  
  if(mousePressed && (d2 <= D/2)){
    fill(255,0,0);
    circle(width/2, height/2, D);
    myPort.write('2');
  }
  
  if(mousePressed && (d3 <= D/2)){
    fill(0,255,0);
    circle(width/2+space, height/2, D);
    myPort.write('3'); 
  } 
  
}






////////

void SerialEvent (Serial myPort){    //QUEPEDO
  myText = myPort.readStringUntil('\n'); 
}

void buttons(){
  
  //second button
  fill(150,0,0);
  circle(width/2, height/2, D);
  //first button
  fill(150,150,0);
  circle(width/2-space, height/2, D);
  //third button
  fill(0,150,0);
  circle(width/2+space, height/2, D);
  
}
