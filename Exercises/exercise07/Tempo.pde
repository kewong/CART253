// The bouncer's settings will be made in this tab
// the bouncer will act as a sound base, where the user can make the tempo faster or slower

class Tempo {

  int x;
  int y;

  int SPEED = 5;
  int SIZE = 16;

  int vx;
  int vy;

  color ballColor = color(255);

  Tempo(int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }

  void update() {
    //CHANGED updates the location of the ball
    x += vx;
    y += vy;

    //CHANGED checks if the ball is going off the top or bottom walls
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      //CHANGED If it is, then it will "bounce" by reversing its velocity
      vy = -vy;
      //CHANGED whenever the ball hits the top or bottom walls, it sounds as though the imapct made a banging sound
      stereoSound.loop();
    }
    // CHANGED checks if the ball is going off the right or left sides
    if (x - SIZE/2 < 0 || x + SIZE/2 > width) {

      vx = -vx;
    }
  }

  //CHANGED trying to make the ball move faster and slower with the up and down keys
  void keyPressed() {
    if (keyCode == CODED) {
      if (keyCode == UP) {
        vx = vx+5;
        vy = vy+5;
      }
    } else if(keyCode == DOWN) {
        vx = vx-5;
        vy = vy-5;
      
    }
  }
  //  void keyReleased() {
  //   if(key == UP) {
  //     vx = vx;
  //     vy = vy;
  //  }
  //  if(key == DOWN) {
  //   vx = vx;
  //   vy = vy;
  //  }
  //}

  //CHANGED the ball will appear with these settings
  void display() {
    //CHANGED Set-up of the appearance of the ball
    noStroke();
    fill(ballColor);
    rectMode(CENTER);
    rect(x, y, SIZE, SIZE);
  }
}