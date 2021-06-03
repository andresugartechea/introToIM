/*
 name: Andres Ugartechea
 assignment: Create a work of art using transformations and classes in some way. 
 date: 06/03/2021
 
 The concept of this project was inspired by psychedelic art. I wanted to create an animation that was attractive but hard to watch after a moment. 
 Based on my experience, this program can cause nausea and headache after a long exposure. That's why the message 'sorry :(' appears on screen if you click the mouse.
 
 
 Before running the program:
 WARNING: the following contains imagery that may cause discomfort and/or seizures for those with photosensitive epilepsy.
 CLICK the mouse if you want to stop the visuals for a moment.
 */

//This class is defined in a new tab.
BigSquare bs;

float angle = 0;
//I tried different values for 'speed' and this is the one I liked the most. (11 is also a good value to try)
int speed = 100;


void setup() {
  size(800, 800);
  background(0);
  bs = new BigSquare();           //I was planning on draw squares of different size, but I changed the concept.
}


void draw() {

  if (mousePressed) { 
    sorry();                      //text on screen
    speed = -speed;               //change direction of rotation
  } else {
    bs.allBigSquares();           //draw all the squares spinning
    grid();                       //draw grid
  }
}


void grid() {
  stroke(round(random(255)), round(random (255)), round(random(255)));
  strokeWeight(3);
  line(width/3, 0, width/3, height);
  line(width*2/3, 0, width*2/3, height);
  line(0, height/3, width, height/3);
  line(0, height*2/3, width, height*2/3);


  //border
  line(1.5, 0, 1.5, height);                      
  line(0, 1.5, width, 1.5);
  line(width-1.5, 0, width-1.5, height);
  line(0, height-1.5, width, height-1.5);

  //This erases the text after a click
  noStroke();
  fill(0);
  rectMode(CENTER);
  rect(width/2, height/2, 105, 50);
}


   //Text on screen
void sorry() {
  background (0);
  fill(round(random(255)), round(random (255)), round(random(255)));
  textSize(32);
  textAlign(CENTER);
  text("sorry :(", width/2, height/2);
}
