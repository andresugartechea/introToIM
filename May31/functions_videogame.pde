/* 
name: Andres Ugartechea
assignment: create either an artwork or a game using functions
date: 05/31/2021
*/


void setup() {
  size(400, 400);
  background(255);

/*I found out that this part (lines 12-19) might not be necessary. The rectangles still appear if I delete it.
  //green rectangle
  strokeWeight (0);
  fill(0, 255, 0);
  rect(0, 0, 60, 60);

  //blue rectangle
  fill(0, 0, 255);
  rect(width-60, height-60, 60, 60);
*/
}

void draw() {
  
  //pressing on the green rectangle
  if ((mousePressed)&&(mouseX > 0)&&(mouseY > 0)&&(mouseX<60)&&(mouseY<60)) {                          //I used as reference the example seen in class on Thursday 05/27/2020
    piece();
  } else {
    stop();                                                                                            //'stop' is defined later. It disappears the path and changes the background color to white.
  }

  //pressing on the blue rectangle
  if ((mousePressed)&&(mouseX > width-60)&&(mouseY > height-60)&&(mouseX<width)&&(mouseY<height)) {   
    piece();
  }

  //pressing and following the white path
  if ((mousePressed)&&(mouseX>20)&&(mouseX<40)&&(mouseY>60)&&(mouseY<120)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>40)&&(mouseX<120)&&(mouseY>100)&&(mouseY<120)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>100)&&(mouseX<120)&&(mouseY>120)&&(mouseY<180)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>60)&&(mouseX<100)&&(mouseY>160)&&(mouseY<180)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>60)&&(mouseX<80)&&(mouseY>180)&&(mouseY<220)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>80)&&(mouseX<100)&&(mouseY>200)&&(mouseY<380)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>100)&&(mouseX<160)&&(mouseY>360)&&(mouseY<380)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>140)&&(mouseX<160)&&(mouseY>300)&&(mouseY<380)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>160)&&(mouseX<220)&&(mouseY>300)&&(mouseY<320)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>200)&&(mouseX<240)&&(mouseY>240)&&(mouseY<300)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>140)&&(mouseX<200)&&(mouseY>240)&&(mouseY<260)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>140)&&(mouseX<160)&&(mouseY>80)&&(mouseY<240)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>140)&&(mouseX<240)&&(mouseY>80)&&(mouseY<100)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>220)&&(mouseX<240)&&(mouseY>80)&&(mouseY<200)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>240)&&(mouseX<300)&&(mouseY>180)&&(mouseY<200)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>280)&&(mouseX<300)&&(mouseY>100)&&(mouseY<180)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>300)&&(mouseX<340)&&(mouseY>60)&&(mouseY<120)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>320)&&(mouseX<340)&&(mouseY>60)&&(mouseY<100)) {
    piece();
  }  
  if ((mousePressed)&&(mouseX>340)&&(mouseX<380)&&(mouseY>60)&&(mouseY<80)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>360)&&(mouseX<380)&&(mouseY>60)&&(mouseY<160)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>320)&&(mouseX<360)&&(mouseY>140)&&(mouseY<160)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>320)&&(mouseX<340)&&(mouseY>160)&&(mouseY<260)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>320)&&(mouseX<360)&&(mouseY>260)&&(mouseY<280)) {
    piece();
  }
  if ((mousePressed)&&(mouseX>360)&&(mouseX<380)&&(mouseY>260)&&(mouseY<340)) {
    piece();
  }
}

//this part makes appear the red square that has to follow the path
void piece() {
  path();                                                                                              //'path' is defined later. It draws the path for the game
  fill(255, 0, 0);
  rectMode (CENTER);
  rect(width-mouseX, height-mouseY, 15, 15);
}

void path() {
  background(0);
  stroke(255, 255, 255);
  strokeWeight (20);                                                                                   //instead of using rectangles for the path, I changed the stroke weight and drew line

  //white path
  line(30, 60, 30, 130);
  line(30, 130, 70, 130);
  line(70, 130, 70, 250);
  line(70, 250, 30, 250);
  line(30, 250, 30, 330);
  line(30, 330, 70, 330);
  line(70, 330, 70, 290);
  line(70, 290, 110, 290);
  line(110, 290, 110, 210);
  line(110, 210, 170, 210);
  line(170, 210, 170, 310);
  line(170, 310, 250, 310);
  line(250, 310, 250, 150);
  line(250, 150, 190, 150);
  line(190, 150, 190, 90);
  line(190, 90, 250, 90);
  line(250, 90, 250, 30); 
  line(250, 30, 310, 30);
  line(310, 30, 310, 190);
  line(310, 190, 330, 190);
  line(330, 190, 330, 230);
  line(330, 230, 290, 230);
  line(290, 230, 290, 290);
  line(290, 290, 370, 290);
  line(370, 290, 370, 350);

  //green rectangle
  strokeWeight (0);
  fill(0, 255, 0);
  rect(0, 0, 120, 120);                                                                                   //for some reason the size of the rectangles is different when we start the program

  //blue rectangle
  fill(0, 0, 255);
  rect(width-30, height-30, 60, 60);   
}

void stop() {
  background(255);

  //green rectangle
  strokeWeight (0);
  fill(0, 255, 0);
  rect(0, 0, 120, 120);  

  //blue rectangle
  fill(0, 0, 255);
  rect(width-30, height-30, 60, 60); 
}
