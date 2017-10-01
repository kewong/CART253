color backgroundColor = color(0);
// the background color is set to black

int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);
// these are the settings for the static's size, frequency, and color

int paddleX;
int paddleY;
int paddleVX;
int paddleVY;
// CHANGED allowed the paddle to move up and down the y-axis by adding the paddleVY integer

int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);
// these are the settings for the paddle's speed, size, and color

int ballX;
int ballY;
int ballVX;
int ballVY;

int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);
// these are the settings for the ball's speed, size, and color

void setup() {
  size(700, 500);
  // The screen's size is 640 pixels by 480 pixels
  
  setupPaddle();
  setupBall();
 background(backgroundColor);
}

void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
  paddleVY = 0;
  // this will tell the program where to set up the paddle
  // CHANGED added a value to paddleVY
}

void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
  // this will tell the program where to set up the ball and which direction it will go
}

void draw() {
  // CHANGED the background was removed, letting the black background to  slowly fade away from the static.

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
   // this allows the static to appear on the screen
  }
}

void updatePaddle() {
 paddleX += paddleVX;  
 paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
 
 paddleY += paddleVY;
 paddleY = constrain(paddleY,0+paddleHeight/2,height-paddleHeight/2);
 // this function allows the paddle to move, constraining the paddle within the screen
}

void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  // this allows the ball to move diagonally
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  // this allows the paddle to appear on the screen
}

void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
  // this allows the ball to appear on the screen
}

void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    background(backgroundColor);
    // if the ball hits the paddle, the ball will "bounce off"
    // CHANGED the background will reset to black whenever the ball comes in contact with the paddle
  }
}

boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
      // if the ball hits the paddle, ballOverlapsPaddle will be summoned
   }
  }
  return false;
  // if the ball does not hit the paddle, ballOverlapsPaddle will not be summoned
}

void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
    // if the ball hits either side along the x-axis, it will "bounce off"
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
    // if the ball hits the side where the y-axis is 0, it will "bounce off"
    // if the ball hits the side where the y-axis is highest, it resets to the initial starting point
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
    // if the left key is pressed, the "paddle" will move down the x-axis, decreasing toward 0
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
    // if the right key is pressed, the "paddle" will move up the x-axis, increasing towards the highest number
  } else if (keyCode == UP) {
   paddleVY = -paddleSpeed; 
   // CHANGED the paddle will move up the screen when the UP key is pressed
  } else if (keyCode == DOWN) {
   paddleVY = paddleSpeed; 
   // CHANGED the paddle will move down the screen when the DOWN key is pressed
  }
}

void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
    // if the left key is released, the "paddle" will stop moving
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
    // if the right key is released, the "paddle" will stop moving
  } else if (keyCode == UP && paddleVY < 0) {
   paddleVY = 0; 
   // CHANGED the paddle will stop moving when the UP key is released
  } else if (keyCode == DOWN && paddleVY > 0) {
   paddleVY = 0; 
   // CHANGED the paddle will stop moving when the DOWN key is released
  }
}