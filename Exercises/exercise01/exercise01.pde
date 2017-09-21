float red = random(255); 
// generates a random shade of red
float green = random(255); 
// generates a random shade of green
float blue = random(255); 
// generates a random shade of blue
final color NO_CLICK_FILL_COLOR = color(red, green, blue); 
// generates a random color every time the program starts up
final int CIRCLE_SPEED = 7; 
final color CLICK_FILL_COLOR = color(100, 100, 250); 
final color BACKGROUND_COLOR = color(250, 150, 150); 
final color STROKE_COLOR = color(250, 150, 150); 
final int CIRCLE_SIZE = 50; 

int circleX;
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(640, 480); 
  circleX = width/2; 
  circleY = height/2; 
  circleVX = CIRCLE_SPEED; 
  circleVY = CIRCLE_SPEED; 
  stroke(STROKE_COLOR); 
  fill(NO_CLICK_FILL_COLOR); 
  background(BACKGROUND_COLOR);
}

void draw() {
  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  } else {
    fill(NO_CLICK_FILL_COLOR);
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX; 
  circleY += circleVY; 
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) { 
    circleVX = -circleVX; 
    background(NO_CLICK_FILL_COLOR);
    // if the circle's central point reaches a distance of its radius from either side of the screen along the x-axis the circle will "bounce off" in the opposite 
    // direction while resetting and changing the color of the background
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) { 
    circleVY = -circleVY;
    background(NO_CLICK_FILL_COLOR);
    // if the circle's central point reaches a distance of it's radius from either side of the screen along the y-axis the circle will "bounce off" in the opposite 
    // direction while resetting and changing the color of the background
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);
}

void keyPressed() {
  if (key ==  CODED) {
    if (keyCode == UP) {
      circleVY = -circleVY;
      // if the UP key is pressed, the circle will change its direction vertically
    }
    if (keyCode == DOWN) {
      circleVX = -circleVX;
      // if the DOWN key is pressed, the circle will change its direction horizontally
  }
}
}