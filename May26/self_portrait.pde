size (1000,1000);

// - BACKGROUND -
fill(255,random(255),0);
ellipse (500, 450, 900, 700);
ellipse (500, 450, 880, 700);
ellipse (500, 450, 860, 700);
ellipse (500, 450, 840, 700);
ellipse (500, 450, 820, 700);
ellipse (500, 450, 800, 700);
ellipse (500, 450, 780, 700);
ellipse (500, 450, 760, 700);
ellipse (500, 450, 740, 700);
ellipse (500, 450, 720, 700);
ellipse (500, 450, 700, 700);
ellipse (500, 450, 680, 700);
ellipse (500, 450, 660, 700);
ellipse (500, 450, 640, 700);
ellipse (500, 450, 620, 700);
ellipse (500, 450, 600, 700);
ellipse (500, 450, 580, 700);
ellipse (500, 450, 560, 700);
ellipse (500, 450, 540, 700);
ellipse (500, 450, 520, 700);
ellipse (500, 450, 500, 700);
ellipse (500, 450, 480, 700);
ellipse (500, 450, 460, 700);
ellipse (500, 450, 440, 700);
ellipse (500, 450, 420, 700);
ellipse (500, 450, 400, 700);
ellipse (500, 450, 380, 700);
ellipse (500, 450, 360, 700);
ellipse (500, 450, 340, 700);
ellipse (500, 450, 320, 700);
ellipse (500, 450, 300, 700);
ellipse (500, 450, 280, 700);
ellipse (500, 450, 260, 700);
ellipse (500, 450, 240, 700);
ellipse (500, 450, 220, 700);
ellipse (500, 450, 200, 700);
ellipse (500, 450, 180, 700);
ellipse (500, 450, 160, 700);
ellipse (500, 450, 140, 700);
ellipse (500, 450, 120, 700);
ellipse (500, 450, 100, 700);
ellipse (500, 450, 80, 700);
ellipse (500, 450, 60, 700);
ellipse (500, 450, 40, 700);
ellipse (500, 450, 20, 700);
ellipse (500, 450, 00, 700);


// - OUTLINE -

//hat
   fill(random(255),random(255),255);
   //hat crown
   ellipse (500, 260, 240, 150);
   //hat brim
   ellipse (500, 320, 500, 150);

//hair
fill(0,0,0);
rectMode (CENTER);
rect (500, 400, 310, 200);

//head
   //ears
   fill(random(255),random(255),255);
   ellipse (345, 500, 50, 66);
   ellipse (655, 500, 50, 66);
   //face
   ellipse (500, 500, 310, 400);
   //chin
   ellipse (500, 675, 150, 90);

// - FACE -

//nose
rectMode (CENTER);
rect (500, 450, 30, 90);
ellipse (500, 500, 60, 30);
ellipse (500, 498, 40, 40);

//pink cheeks
fill(random(255),random(255),255);
ellipse (395, 490, 55, 34);
ellipse (595, 490, 55, 34);

//eyes
fill(0,0,0);
ellipse (425, 440, 20, 20);
ellipse (565, 440, 20, 20);
noFill();
arc (425, 436, 50, 15, radians(180), radians(360));
arc (565, 436, 50, 15, radians(180), radians(360));

//brows
fill (0,0,0);
arc (425, 400, 70, 15, radians(190), radians(350));
arc (565, 400, 70, 15, radians(190), radians(350));

//smile
fill(0,0,0);
arc (500, 550, 140, 120, radians(0), radians(180));
