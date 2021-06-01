class Ball {
  
  float x;
  float y;
  float xspeed = 10;                                        //I chose this speed so we can be able to see how the colors change and the ball moves.
  
  Ball() {
    x = width/2;
    y = height/2;
  }
  void display(){
    noStroke();
    fill(random(255),random(255),random(255));              //the color of the ball changes then it's moving
    ellipse(x,y,60,60);
  }
  void appear(){
    x += xspeed;
    if ((x<0)||(x>height)){                               
    x = -xspeed;                                             //at first, I wanted the ball to bounce, but then I prefered it to appear and disappear at the same place. This code could be improved.
    }
  }
}
