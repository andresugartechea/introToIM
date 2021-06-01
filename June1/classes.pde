/*
  name: Andres Ugartechea
  assignment: create either an artwork or a game using Object Oriented Programming.
  date: 06/01/2021
*/

/*for this assignment, I used as reference the code in  "Defining a Class Part II - Processing Tutorial" by The Coding Train
  (https://www.youtube.com/watch?v=XwfOVFelLoo&list=PLzJbM9-DyOZyMZzVda3HaWviHqfPiYN7e&index=35&ab_channel=TheCodingTrainTheCodingTrainVerified)
  and the examples seen in my Intro to IM class on Monday 05/31/2021
*/

//the classes 'Square' and 'Ball' are defined in different tabs
Square s;
Ball b;

void setup() {
  size(800,800);
  s = new Square();
  b = new Ball();
}

void draw() {
  background(0);
  stroke(255);
  fill(0);
  rect(0,0,740,740);       //I still have this problem: sizes differ when written in 'void draw()' "
  rect(830,830,800,800); 
  
  s.display();
  s.appear();
  
  b.display();
  b.appear();

}
