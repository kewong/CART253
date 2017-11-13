import processing.sound.*;
SoundFile stereoSound;

Bouncer bouncer;

void setup() {

  size(640, 480);
  background(80);

  //CHANGED created a ball that will bounce within the screen
  bouncer = new Bouncer(width/2, height/2);

  // CHANGED added a sound to the code that will serve as a sound tempo
  stereoSound = new SoundFile(this, "tempo_ball.mp3");
}

// CHANGED drawing the background and the bouncer onto the screen with its update settings
void draw() {
  background(80);
  bouncer.display();
  bouncer.update();
}

//void mouseClicked() {
//  stereoSound.loop(); // This doesn't work! It just plays once!
//}

void keyPressed() {
  bouncer.keyPressed();
}