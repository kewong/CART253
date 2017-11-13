import processing.sound.*;
SoundFile tempoSound;

//CHANGED Added two new beats which the user can control with the R and T keys
SoundFile firstBeat;
SoundFile secondBeat;
//CHANGED Added a third beat in which the user can control with the Y key
SoundFile thirdBeat;

Tempo tempo;


Beats beats;



void setup() {

  size(640, 480);
  background(50);

  //CHANGED created a ball that will bounce within the screen
  tempo = new Tempo(width/2, height/2);

  //CHANGED the user will be able to control the beats using the R and T keys
  //CHANGED the user will be able to control a new beat by using the Y key
  beats = new Beats('r', 't', 'y'); 


  // CHANGED added a sound to the code that will serve as a sound tempo
  tempoSound = new SoundFile(this, "tempo_ball.mp3");

  //CHANGED added new sound files for the new beats that the user will be able to control
  firstBeat = new SoundFile(this, "beat_1.mp3");
  secondBeat = new SoundFile(this, "beat_2.mp3");
  // CHANGED added the new sound file for the third beat that the user is able to control
  thirdBeat = new SoundFile(this, "beat_3.mp3");
}

// CHANGED drawing the background and the bouncer onto the screen with its update settings
// CHANGED added simple "instructions" advising which keys to press for the new beats
// CHANGED modified the settings of the text being shown on the screen
void draw() {
  background(50);
  tempo.display();
  tempo.update();


  textSize(100);
  fill(200, 100, 50);
  text("Beats", 200, height/4);


  textSize(50);
  fill(200, 80, 100);
  text("press R", 220, 200);

  textSize(50);
  fill(200, 80, 100);
  text("press T", 220, 280);
  
  textSize(50);
  fill(200, 80, 100);
  text("press Y", 220, 360);
}

void keyPressed() {
  tempo.keyPressed();
  beats.keyPressed();
}