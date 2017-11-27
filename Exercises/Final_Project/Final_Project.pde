// Used a starter code from https://ideone.com/iYhvdW



import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;

AudioInput input;
FFT fft;


Wave wave;

void setup() {
  //CHANGED the program goes to fullscreen when it starts up
  fullScreen();
  //CHANGED the mouse will not show up on the screen
  noCursor();

  background(0);

  wave = new Wave();

  minim = new Minim(this);


  input = minim.getLineIn();

  fft = new FFT(input.bufferSize(), input.sampleRate());
}

void draw() {
  background(0);
  stroke(255);

  wave.display();
}