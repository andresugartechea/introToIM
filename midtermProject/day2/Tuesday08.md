## Day 2 | Tuesday 06/08/2021 : midterm Project
  
[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day1/Monday07.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day3/Wednesday09.md)  

## Tasks:

·Give a format to my journal.  
·Continue working on the code.  
·Plan the tasks for the next days.  

## Progress:

Today, I started giving a format to my journal so I can organize and divide my tasks better and to keep a record of my progress. I also started formating my code, rewriting the parts I'd already worked on in different classes.

<img src="firstTab.png" width="800" />

I already figured out how to make the ball jump. I took me more than expected, so I think from now on I'm going to watch more videos as reference so I don't get blocked again.

<img src="secondTab.png" width="800" />

<img src="thirdTab.png" width="800" />

I also started drawing some sketches for the design of the characters and different elements of the videogame. I plan to dedicate more time to this, but first I need to focus on the playability and check that everything's working well.

<img src="characters.jpg" width="400" />

## Code commented: 

I put the functions that control the ball in a new class _(Ball)_ and I edited the code here.

````
class Ball {
  float x;
  float start;
  float D;
  float jump;
  float jSpeed;         //Jump speed
  float gravity;
 
  
  Ball(){
    x = width/2;                //This measure will always be the same.
    start = height/2+85;        //Starting point of the ball in the y-axis
    jump = height/2;            //Max height reached
    D = 30;                     //Diameter of the ball
    gravity = 0.55;             //"Gravity" to counteract the speed of the jump.
  }  
  
  void display(){
    noStroke();
    fill(0, 0, 255);
    ellipse (x, start, D, D);
  }
    
  void jump(){
    jSpeed = -10;
  }
  
  void move(){
    start += jSpeed;
    jSpeed += gravity;
    start = constrain(start, jump, height/2+85);     //this keeps the ball inside the circle after jumping
  }
}
````

[This](https://youtu.be/tTa7B9S-_hw) is what we obtain when we run the program.

## Modifications:

## Problems to solve:

[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day1/Monday07.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day3/Wednesday09.md) 
