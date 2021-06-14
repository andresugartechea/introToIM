## Day 3 | Wednesday 06/09/2021 : midterm Project

[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day2/Tuesday08.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day4/Thursday10.md)  

## Tasks:

·To learn more about collision detection on Processing.  
·To look for alternative ideas for my project.

## Progress:

Today, I didn't make a significant progress on my project. [The tutorial](https://www.youtube.com/watch?v=cXgA1d_E-jY&t=1026s&ab_channel=TheCodingTrainTheCodingTrainVerified) that I was using as reference works with p5.js, so I couldn't understand some parts. Also, the obstacles in my game behave differently. That's why I had to research how [collision detection](http://www.jeffreythompson.org/collision-detection/table_of_contents.php) works, specially for [rotated objects] (https://forum.processing.org/two/discussion/19402/collisions-with-rotated-objects).

I didn't know it was hard to work with collision detection. I had a hard time trying to understand how to make my program work and I got blocked. I don't want today's result to make me lose motivation, so I think I'll change the concept of my work if I don't figure out how to apply the collision detection to the rope.

## Results:

· I realized that the ball could keep jumping each time the mouse was clicked, as if it was flying. So I managed to fix this error:

````
  void jump(){
    if(yStart == height/2+85){        //so the ball only can fly if it's at the starting point.
      jSpeed = -10;
    }
  }
````

## Modifications:

· The ball only jumps when it's at the starting point.

## Problems to solve:

·To apply collision detection to the rope (or to start working on a different concept).

[← return](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day2/Tuesday08.md)  
[MAIN PAGE](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/journal.md)  
[next →](https://github.com/andresugartechea/introToIM/blob/main/midtermProject/day4/Thursday10.md)  
