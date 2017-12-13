// Used a starter code from https://ideone.com/iYhvdW
// This is a game where the player has to control the volume of their voice to match the size of the boxes that appear on the screen
// The goal of the game is to gain as many points before the player's 5 chances run out
//


//////// IMPORT ////////

// Import Minim
import ddf.minim.analysis.*;
import ddf.minim.*;



//////// GLOBAL VARIABLES ////////



Minim minim;

AudioInput input;
FFT fft;


Wave wave;

// CHANGED added an array of 100 new boxes
Box[] box = new Box[100];

// CHANGED hitCounter will count how many points the player will obtain in the game
Counter hitCounter;
// CHANGED missCounter will count down from the amount of boxes the player misses 
Counter missCounter;



//////// SETUP ////////




void setup() {
  //CHANGED the program goes to fullscreen when it starts up
  fullScreen();
  //CHANGED the mouse will not show up on the screen
  noCursor();
  // CHANGED the background is set to black
  background(0);

  // CHANGED this determines the placement and color of the two counters
  hitCounter = new Counter(200, 200, 255);
  missCounter = new Counter(200, 300, 255);

  wave = new Wave();


  minim = new Minim(this);


  input = minim.getLineIn();

  fft = new FFT(input.bufferSize(), input.sampleRate());

  // CHANGED A new box will appear on the screen every 10 seconds(10000 milliseconds)
  // CHANGED Each box will appear with random dimensions
  int interval = 10000;
  for (int i = 0; i < 100; i++) {
    float w =random(500, 2000);
    box[i] = new Box(-int(w/2), height/2, 0, 0, w, random(20, 1000), interval*(i+1));
  }
}

//////// DRAW ////////

void draw() {
  background(0);
  stroke(255);

  // CHANGED display the wave on the screen
  wave.display();

  //CHANGED made an array of boxes of random heights
  for (int i = 0; i < box.length; i++) {
    box[i].display();
    box[i].update();
    // CHANGED checks if the height of the wave matches the height of the box
    if (wave.checkCollision(box[i]) ==true)
    {
      // CHANGED if it is true, the box will turn red
      box[i].currentColor = box[i].insideColor;
    } else
    {
      // CHANGED if not, the box will remain green
      box[i].currentColor = box[i].fillColor;
    }
  }
  // CHANGED display the two counters
  hitCounter.display();
  missCounter.display();
}