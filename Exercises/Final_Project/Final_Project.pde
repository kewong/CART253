// Used a starter code from https://ideone.com/iYhvdW



import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;

AudioInput input;
FFT fft;


Wave wave;

Box[] box = new Box[100];

//Counter hitCounter;
//Counter missCounter;

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

  //CHANGED made an array of boxes of random heights
  for (int i = 0; i < box.length; i++) {
    box[i] = new Box(0 - width/2, height/2, 500, random(20, 1000));
    box[i].display();
    box[i].update();
  }

  //pointCounter.display();
}