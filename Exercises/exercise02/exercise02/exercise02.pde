// the background color is set to black
color backgroundColor = color(0);

// these are the settings for the static's size, frequency, and color
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

int paddleX;
int paddleY;
int paddleVX;
int paddleVY;
// allowed the paddle to move up and down the y-axis by adding the paddleVY integer

// these are the settings for the paddle's speed, size, and color
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

int ballX;
int ballY;
int ballVX;
int ballVY;

// these are the settings for the ball's speed, size, and color
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);


void setup() {
  // The screen's size is 640 pixels by 480 pixels
  size(640, 480);
  setupPaddle();
  setupBall();
  background(backgroundColor);
}


// this will tell the program where to set up the paddle
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
  paddleVY = 0;
  // added a value to paddleVY
}

// this will tell the program where to set up the ball and which direction it will go
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {
  // the background was removed, letting the black background to  slowly fade away from the static.

  drawStatic();
  drawNewBackground();
  updatePaddle();
  updateBall();
  drawPaddle();
  drawBall();
}

// CHANGED created new function that holds a loop which creates a different background on the upper half of the screen
void drawNewBackground() {
  for (int i = 0; i < width; i++) {
    float r = random(255);
    stroke(r);
    line(i, 0, i, r);
  }
}

// this allows the static to appear on the screen
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}

// this function allows the paddle to move, constraining the paddle within the screen
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);

  paddleY += paddleVY;
  paddleY = constrain(paddleY, 0+paddleHeight/2, height-paddleHeight/2);
}

// this allows the ball to move diagonally
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

// this allows the paddle to appear on the screen
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

// this allows the ball to appear on the screen
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

// if the ball hits the paddle, the ball will "bounce off"
// the background will reset to black whenever the ball comes in contact with the paddle
// the ball will become smaller every time it hits the paddle
// the paddle will become bigger every time the ball hits it
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    ballSize = ballSize-5;
    paddleWidth = paddleWidth+10;
    background(backgroundColor);
  }
}

boolean ballOverlapsPaddle() {
  // if the ball hits the paddle, ballOverlapsPaddle will be summoned
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  // if the ball does not hit the paddle, ballOverlapsPaddle will not be summoned
  return false;
}

//  the ball will become bigger every time it misses the paddle
//  the paddle will become smaller every time the ball misses it
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
    ballSize = ballSize+5;
    paddleWidth = paddleWidth-10;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

void handleBallHitWall() {
  // if the ball hits either side along the x-axis, it will "bounce off"
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  // if the ball hits the side where the y-axis is 0, it will "bounce off"
  // if the ball hits the side where the y-axis is highest, it resets to the initial starting point
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

void keyPressed() {
  // if the left key is pressed, the "paddle" will move down the x-axis, decreasing toward 0
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
    // if the right key is pressed, the "paddle" will move up the x-axis, increasing towards the highest number
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
    // the paddle will move up the screen when the UP key is pressed
  } else if (keyCode == UP) {
    paddleVY = -paddleSpeed; 
    // the paddle will move down the screen when the DOWN key is pressed
  } else if (keyCode == DOWN) {
    paddleVY = paddleSpeed;
  }
}

void keyReleased() {
  // if the left key is released, the "paddle" will stop moving
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
    // if the right key is released, the "paddle" will stop moving
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
    // the paddle will stop moving when the UP key is released
  } else if (keyCode == UP && paddleVY < 0) {
    paddleVY = 0; 
    // the paddle will stop moving when the DOWN key is released
  } else if (keyCode == DOWN && paddleVY > 0) {
    paddleVY = 0;
  }
}