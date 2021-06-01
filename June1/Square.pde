class Square {
  
 //same comments as for Ball 
 
  float x;
  float y;
  float yspeed = 10;
  
  Square() {
    x = width/2;
    y = height/2;
  }
  void display(){
    noStroke();
    fill(random(255),random(255),random(255));
    rectMode (CENTER);
    rect(x,y,60,60);
  }
  void appear(){
    y += yspeed;
    if ((y<0)||(y>width)){
    y = -yspeed;
    }
  }
}
