float red = random(255);
float green = random(255);
float blue = random(255);
final color NO_CLICK_FILL_COLOR = color(red,green,blue); 
// generates a random color every time the program starts up
final int CIRCLE_SPEED = 7; 
//  integer of 7
final color CLICK_FILL_COLOR = color(100, 100, 250); 
// integer of color set to change when mouse's coordinates interact with the circle
final color BACKGROUND_COLOR = color(250, 150, 150); 
// integer of background color
final color STROKE_COLOR = color(250, 150, 150); 
// integer of the color of the outline of the circle
final int CIRCLE_SIZE = 50; 
// integer of 50

// 'final' means that these settings cannot be changed during the rest of the process

int circleX;
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(640, 480); 
  // the screen size is 640 pixels by 480 pixels
  circleX = width/2; 
  // half of the width of the screen
  circleY = height/2; 
  // half of the height of the screen
  circleVX = CIRCLE_SPEED; 
  // the circle's velocity rate along the x-axis is 7
  circleVY = CIRCLE_SPEED; 
  // the circle's velocity rate along the y-axis is 7
  stroke(STROKE_COLOR); 
  // the color of the outine of the circle
  fill(STROKE_COLOR); 
  // the color of the circle
  background(BACKGROUND_COLOR); 
  // background color
}

void draw() {
  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR); 
    // if the mouse's location interacts with the circle "in motion" the corresponding circle(s) will change color
  } else {
    fill(NO_CLICK_FILL_COLOR); 
    // if the mouse's location does not interact with the circle "in motion" the corresponding circle(s) will not change color
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX; 
  // this allows the circle to move 7 pixels hoizontally on the screen
  circleY += circleVY; 
  // this allows the circle to move 7 pixels vertically on the screen
  // because of this, the circle is able to move diagonally across the screen

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
  // once the mouse is pressed, the screen resets to the initial background color
}