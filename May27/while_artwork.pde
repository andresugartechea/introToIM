/* 
name: Andres Ugartechea
assignment: make a simple work of art using for() or while()
date: 05/27/2021
*/

void setup() {
  size(800, 800);                       
  background(0, 255, 255);               
  strokeWeight (2);                     //stroke thicker

  //diagonal lines with bottom left corner as vanishing point
  fill(0, 0, 255);
  int a = 0;   
  while (a < width) {
  line(a, 0, 2, height);
  a = a + 20;
  } 
  
  //vertical stripes
  fill(0, 0, 255);
  int f = 0;
  while (f < width) {
  line(f, 0, f, height);
  f = f + 5;
  }  

  //red cone (background for the next cone)
  fill(255, 0, 0);
  int b = 0;
  while (b < width) {
  ellipse (b, b, b+10, b+10);
  b = b + 20;
  }
  
  //cone with parallel lines, upper left corner as vanishing point
  noFill();
  int c = 0;
  while (c < width) {
  ellipse (c, c, c+10, c+10);
  c = c + 5;
  }
  
  //yellow circle in the center
  fill(220, 220,0);
  ellipse(width/2, width/2, 50, 50);
}
