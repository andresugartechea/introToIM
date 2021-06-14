## Day 5 | Saturday 06/12/2021 : midterm Project

[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day4/Thursday10.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day7/Sunday13.md)  

## Tasks:

## Progress:

## Code commented:

//Images
  PImage background; 
  PImage player; 
  PImage topPipe; 
  PImage bottomPipe;
  PImage startMenu;
  PImage loseGame;
 
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
  
  int score;
  
  String gameState;



void setup() {
  size(1200, 800);
  background(0);
  
 
  //to load images
  background = loadImage("background.png");
  player = loadImage("player.png");
  bottomPipe = loadImage("bottomPipe.png");
  topPipe = loadImage("topPipe.png");
  startMenu = loadImage ("startMenu.png");
  loseGame = loadImage ("loseGame.png");
  
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
  
  gameState = "START";
}



void draw() {

  if(gameState == "START"){
    startGame();
  } else if (gameState == "PLAY"){
    playGame();
  } else if (gameState == "LOSE"){
    loseGame();
  }
}




void startGame(){
  plY = height/2;
  image(startMenu, 0, 0);
  
  if(mousePressed){
    gameState = "PLAY";
  }
}


//to control character
void mousePressed() {
  jump = -15;
}


void playGame(){
    setBackground();
    pipes();
    player();
    score();
}



void loseGame(){
  image (loseGame, 0,0);
  
  if(mousePressed){
    gameState = "PLAY";
  }
}



//to give mobility to the character
void player (){
  image(player , plX, plY);
  plY = plY+jump;
  jump = jump +g;
  
  if(plY > height+100 ||plY<-100) {
    losing.play();
    gameState = "LOSE";
  }
}



//for the pipes
void pipes(){
  for(int i = 0;i <pipeX.length; i++){
    image(topPipe, pipeX[i], pipeY[i]);
    image(bottomPipe, pipeX[i], pipeY[i]+800);
    pipeX[i]-=2;                                 //game speed
      if(pipeX[i] < -200){
        pipeX[i] = width;
      }
      if(plX >(pipeX[i]-96) && plX < pipeX[i]+100){
        if(!(plY > pipeY[i]+500 && plY < pipeY[i] + 500 + 200)){
          gameState = "LOSE";
        }
        else if (plX == pipeX[i]){
          score++;
        }
      }
    }
}



void score() {
  fill(255,0,0);
  rect(40,35, 160,37);
  fill(0);
  textSize(32);
  text (" Score:  " + score, 43, 65);
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

[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day4/Thursday10.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day7/Sunday13.md)  
