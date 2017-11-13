import processing.sound.*;
SoundFile tempoSound;

//CHANGED Added two new beats which the user can control with the R and T keys
SoundFile firstBeat;
SoundFile secondBeat;

Tempo tempo;


Beats beats;



void setup() {

  size(640, 480);
  background(50);

  //CHANGED created a ball that will bounce within the screen
  tempo = new Tempo(width/2, height/2);

  //CHANGED the user will be able to control the beats using the R and T keys
  beats = new Beats('r', 't'); 


  // CHANGED added a sound to the code that will serve as a sound tempo
  tempoSound = new SoundFile(this, "tempo_ball.mp3");

  //CHANGED added new sound files for the new beats that the user will be able to control
  firstBeat = new SoundFile(this, "beat_1.mp3");
  secondBeat = new SoundFile(this, "beat_2.mp3");
}

// CHANGED drawing the background and the bouncer onto the screen with its update settings
// CHANGED added simple "instructions" advising which keys to press for the new beats
void draw() {
  background(50);
  tempo.display();
  tempo.update();


  textSize(100);
  fill(200, 100, 50);
  text("Beats", 200, height/4);


  textSize(50);
  fill(200, 80, 100);
  text("press R", 100, height/2);

  textSize(50);
  fill(200, 80, 100);
  text("press T", 370, height/2);
}

void keyPressed() {
  tempo.keyPressed();
  beats.keyPressed();
}