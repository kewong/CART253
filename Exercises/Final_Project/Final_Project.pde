// Used a starter code from https://ideone.com/iYhvdW
// Stars modified from https://cs.brynmawr.edu/gxk2013/examples/transformations/starfield/
// This is a game where the player has to control the volume of their voice to match the size of the boxes that appear on the screen
// The goal of the game is to gain as many points before the player's 5 chances run out
//
//
//
//
//
//
///////// ARTIST STATEMENT ////////
//
//    This past semester, I have learned a lot about programming which has challenged my creativity in a more technological sense. For my final project,
// I have created a game where the player must use their voice to control the soundwave in the center of the screen, where they would have to match
// the size of the soundwave to the height of the boxes that appear on the screen. I have used several codes from exterior sources and modified them 
// to work in my game. While the game is running, the player will see red star-like objects flying towards them. The shape is similar to the shape of 
// the soundwave in the center, which I belive is to be a very interesting and appealing detail.
//    In my past exercises, I have reused and recycled one of my old codes, a linear background made of a loop of randomized strokes of different sizes and 
// greyscale shades. Judging from how frequently I have reused it, I could safely say that this is my favorite piece of code that I have used. My coding
// and ideas are very simple and unelaborate, making my game easy to play. The simplicity of the game allows me the ability to make the game more difficult
// to win, or to gain points. I do not like to overwhelm the aesthetic of my codes with colors because I believe that it takes too much of the viewer/player's 
// attention, unless it is able to coexist with the rest of the game harmoniously. 
//    It fascinates me how much a person can create using simple coding and beginner's knowledge. I mainly work with experimentation more than concrete ideas so 
// this project was a bit of a challenge for me, but I eventually built up my code into a funtional and playable game. 






//////// IMPORT ////////

// Import Minim
import ddf.minim.analysis.*;
import ddf.minim.*;



//////// GLOBAL VARIABLES ////////



Minim minim;

AudioInput input;
FFT fft;

//CHANGED created an array of 400 stars
Star[] stars = new Star[400];

Wave wave;

// CHANGED added an array of 100 new boxes
Box[] box = new Box[100];

// CHANGED hitCounter will count how many points the player will obtain in the game
Counter hitCounter;
// CHANGED missCounter will count down from the amount of boxes the player misses 
Counter missCounter;

// CHANGED this determines that the game is not over
boolean gameOver = false;



//////// SETUP ////////



void setup() {
  //CHANGED the program goes to fullscreen when it starts up
  fullScreen();
  //CHANGED the mouse will not show up on the screen
  noCursor();
  // CHANGED the background is set to black
  background(0);

  // CHANGED this determines the placement and color of the two counters
  hitCounter = new Counter(200, 200, color(255), 0);
  missCounter = new Counter(200, 300, color(255, 0, 0), 5);

  wave = new Wave();


  minim = new Minim(this);


  input = minim.getLineIn();

  fft = new FFT(input.bufferSize(), input.sampleRate());


  // CHANGED Initialize all stars
  for (int i=0; i<stars.length; i++) 
    stars[i] = new Star();

  // CHANGED A new box will appear on the screen every 10 seconds(10000 milliseconds)
  // CHANGED Each box will appear with random dimensions
  int interval = 11000;
  for (int i = 0; i < 100; i++) {
    float w =random(500, 1500);
    box[i] = new Box(-(int(w/2)+10), height/2, 0, 0, w, random(20, 1000), interval*(i+1));
  }
}

// CHANGED linear background of a loop of random strokes of different sizes and shades (along the greyscale)
void drawNewBackground() {
  for (int i = 0; i < width; i++) {
    float r = random(255);
    float randomHeight = random(height);
    stroke(r);
    line(i, height/2, i, randomHeight);
  }
}

//////// DRAW ////////

void draw() {
  background(0);
  stroke(255);

  // CHANGED the game will run the code below if gameOver is false
  if (gameOver == false) {
    //  wave.display();


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
      box[i].checkIfOffScreen();
    }

    // CHANGED display the two counters
    hitCounter.display();
    missCounter.display();

    // CHANGED Draw all stars wrt center of screen
    translate(width/2, height/2);

    // CHANGED Update and draw all stars
    for (int i=0; i<stars.length; i++) {
      stars[i].update();
      stars[i].draw();
    }
  } 
  // CHANGED game will run the code below if gameOver is true
  else {
    background(40);
    drawNewBackground();

    fill(0);
    stroke(255);
    textSize(200);
    text("Game Over", width/3, height/2);

    fill(255, 40, 10);
    textSize(200);
    text("Your Score", width/3, height/1.5);

    fill(10, 200, 10);
    textSize(150);
    text(hitCounter.value, width/2, height/1.2);
  }
}