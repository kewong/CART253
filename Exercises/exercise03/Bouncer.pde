//this tab is where the bouncers' functions settings are created



class Bouncer {

  int x;
  int y;
  int vx;
  int vy;
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;

//CHANGED these are the declarations for the random colors that will be called later in the program
  float randomNumber1;// = random(0, 255);
  float randomNumber2;// = random(0, 255);
  float randomNumber3;// = random(0, 255);
  float bouncerColor;// = color(randomNumber1, randomNumber2, randomNumber3);



  // these are the settings for the balls
  // the "temp" integers are the settings for the current location/colors of the ball on the screen 
  // These settings are changeable throughout the program
  // The default settings are in the main program 
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }

  // This allows the balls to move diagonally
  void update() {
    x += vx;
    y += vy;

    handleBounceChangeColor();
    handleBounce();
    handleMouse();
  }

// CHANGED I DON'T UNDERSTAND WHY IT'S NOT WORKING??
  void handleBounceChangeColor() {
    if (x + size/2 == width) { //Right wall
      randomNumber1 = random(255);
      randomNumber2 = random(255);
      randomNumber3 = random(255);
      bouncerColor = color(randomNumber1, randomNumber2, randomNumber3);
      fill(bouncerColor);
    }
    if (x - size/2 == 0) { //Left wall
      randomNumber1 = random(255);
      randomNumber2 = random(255);
      randomNumber3 = random(255);
      bouncerColor = color(randomNumber1, randomNumber2, randomNumber3);
      fill(bouncerColor);
    }
    if (y - size/2 == 0) { //Top wall
      randomNumber1 = random(255);
      randomNumber2 = random(255);
      randomNumber3 = random(255);
      bouncerColor = color(randomNumber1, randomNumber2, randomNumber3);
      fill(bouncerColor);
    }
    if (y - size/2 == height) {
      randomNumber1 = random(255);
      randomNumber2 = random(255);
      randomNumber3 = random(255);
      bouncerColor = color(randomNumber1, randomNumber2, randomNumber3);
      fill(bouncerColor);
    }
  }

  // if the edges of the balls hit the sides of the screen, they will "bounce off" in the opposite direction
  // the ball is constrained within the screen
  void handleBounce() {
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
    }

    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
    }

    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }

  // if the mouse's location interacts with the location of either of the balls, the corresponding ball will change to a lighter color
  void handleMouse() {
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }

  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}