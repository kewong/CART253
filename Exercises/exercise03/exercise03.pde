// this is the main program where the main functions will be called
// whatever functions that allow the main functions to work are on another tab
// This layout looks cleaner and more organized


// the background color and both bouncers are introduced to the program
color backgroundColor = color(200,150,150);
Bouncer bouncer;
Bouncer bouncer2;

// the screen size, background color and both bouncers are given values
void setup() {
  size(640,480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

// this allows the bouncers to appear on the screen
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}