// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

// CHANGED scores for "Hits and Misses"
Counter counter;
Counter counter2;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);

// CHANGED Introducing the static values/information
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

// setup()
//
// Sets the size and creates the paddles and ball
Ball[] balls = new Ball[100];

// CHANGED this boolean controls whether the game ends or not
boolean gameOver =false;

void setup() {
  // Set the size
  size(640, 480);
  background(backgroundColor);
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height, '0');
  rightPaddle = new Paddle(width - PADDLE_INSET, -height, '1');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);

  // CHANGED added two scores 
  // CHANGED the firs counter is used to count how many points the player accumulates
  counter= new Counter(width/2, height/4, color(255, 255, 255));
  // CHANGED counter is used to count how many times the player misses the ball
  counter2= new Counter(width/2, height/2, color(255, 0, 0));
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {

  // CHANGED the main program will be checking every frame whether the game ends or not
  if (gameOver ==false) {

    drawNewBackground();
    counter.display();
    counter2.display();



    // CHANGED added static to the background
    for (int i = 0; i < numStatic; i++) {
      float x = random(0, width);
      float y = random(0, height);
      float staticSize = random(staticSizeMin, staticSizeMax);
      fill(staticColor);
      rect(x, y, staticSize, staticSize);
    }

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();


    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    //Display the paddles and the ball
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
  }

  // CHANGED if the game ends, this code will be called
  else {

    //CHANGED the whole screen will be filled with a darker linear static background
    for (int i = 0; i < width; i++) {
      float r = random(100);
      stroke(r);
      line(i, 0, i, height);
    }
    // CHANGED 'GAME OVER' will appear 
    fill(255, 0, 0);
    textSize(85);
    text("Game Over", width/6, height/4);
    // CHANGED the score that the player has accumulated from the first counter will appear under "GAME OVER"
    fill(0, 255, 0);
    textSize(75);
    text(counter.value, 300, height/2);
  }
}


// CHANGED added a linear static to the left half of the background
void drawNewBackground() {
  for (int i = 0; i < width/2; i++) {
    float r = random(255);
    stroke(r);
    line(i, 0, i, height);
  }
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}