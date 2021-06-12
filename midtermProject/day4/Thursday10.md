## Day 4 | Thursday 06/10/2021 : midterm Project

[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day3/Wednesday09.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day5/Friday11.md)  

## Tasks:

## Progress:

## Code commented:

//Images
  PImage background; 
  PImage player; 
  PImage topPipe; 
  PImage bottomPipe;

//Variables background
  int bX;             //x coordinate
  int bY;             //y coordinate
  
//Variables player
  int plX;            //x coordinate
  int plY;            //y coordinate
  int g;              //"gravity"
  int jump;
  
//Variables pipes
  int [] pipeX;
  int [] pipeY;



void setup() {
  size(1200, 800);
  background(0);
  
  //to load images
  background = loadImage("background.png");
  player = loadImage("player.png");
  bottomPipe = loadImage("bottomPipe.png");
  topPipe = loadImage("topPipe.png");
  
  //Defining variables
  plX = 100;
  plY = 50;
  g = 1;
  pipeX = new int[5]; 
  pipeY = new int[pipeX.length];
  
  //Defining array
  for(int i = 0; i< pipeX.length; i++){
    pipeX[i] = width + 200*i;
    pipeY [i]= (int)random(-350, 0);
  }
}



void draw() {
  setBackground();
  player();
  
    for(int i = 0;i<pipeX.length; i++){
      image(topPipe, pipeX[i], pipeY[i]);
      image(bottomPipe, pipeX[i], pipeY[i]+800);
      pipeX[i]-=2;                                 //game speed
      if(pipeX[i] < -200){
        pipeX[i] = width;
      }
    }
}



//to control character
void mousePressed() {
  jump = -15;
}



//to give mobility to the character
void player (){
  image(player , plX, plY);
  plY = plY+jump;
  jump = jump +g;
}



//for the background
void setBackground() {
  image (background, bX, bY);
  image (background, bX + background.width, bY);
  bX = bX -1;
  if(bX < -background.width) {
    bX = 0;
  }
}

## Results:

## Modifications:

## Problems to solve:

[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day3/Wednesday09.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day5/Friday11.md)  
