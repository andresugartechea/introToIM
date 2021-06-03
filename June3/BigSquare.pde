class BigSquare {

  void allBigSquares() {

    //BigSquare 1
    push();
    translate(width/6, height/6);
    display();
    pop();

    //BigSquare 2
    push();
    translate(width/2, height/6);
    display();
    pop();

    //BigSquare 3
    push();
    translate(width*5/6, height/6);
    display();
    pop();

    //BigSquare 4
    push();
    translate(width/6, height/2);
    display();
    pop();

    //BigSquare 5
    push();
    translate(width/2, height/2);
    display();
    pop();

    //BigSquare 6
    push();
    translate(width*5/6, height/2);
    display();
    pop();

    //BigSquare 7
    push();
    translate(width/6, height*5/6);
    display();
    pop();

    //BigSquare 8
    push();
    translate(width/2, height*5/6);
    display();
    pop();

    //BigSquare 9
    push();
    translate(width*5/6, height*5/6);
    display();
    pop();
  }

  void display() {
    noFill();
    //I chose this value of 'x' after doing the math. "+ 6" is because the grid has a strokeWeight of 3
    float x = ((width)*2/9)+6;

    //This part draws a square that spins
    rotate(angle);
    stroke(round(random(255)), round(random (255)), round(random(255)));
    rectMode(CENTER);
    rect(0, 0, x, x);
    
    //This draws a point at the center of the square
    strokeWeight(10);
    point(0, 0);
    angle = angle+speed;
  }
}
