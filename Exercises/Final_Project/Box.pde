//CHANGED The Box class is where the settings for the boxes are made
//CHANGED The challenge is for the player to exceed the borders of the box to gain points
//CHANGED once the player misses three boxes completely, the game will end



class Box {

  int x;
  int y;

  int vx;
  int vy;

  float tempWidth;
  float tempHeight;
  int startInterval;
  color fillColor = color(0,255,0);
  color insideColor = color(255,0,0);
  color currentColor = fillColor;
  

//////// CONSTRUCTOR ////////

  //CHANGED added constructor of the boxes
  Box(int _x, int _y, int _vx, int _vy, float _tempWidth, float _tempHeight, int interval) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    tempWidth = _tempWidth;
    tempHeight = _tempHeight;
    startInterval= interval;
  }


//////// UPDATE ////////


  void update() {
    
    // CHANGED checks if the amount of seconds accumulated from the open program is larger than the startInterval (10 seconds)
    if(millis()>startInterval)
    {
      // CHANGED the boxes will start moving at the velocity of 50 pixels per second
      vx=50;
    }
      x = x+vx;
  }
  

//////// DISPLAY ////////


  void display() {

    //CHANGED the box will be transparent, only the borders will show on the screen
    noFill();
    stroke(currentColor);
    //CHANGED the rectangle will appear in the middle of the screen
    rectMode(CENTER);
    rect(x, y, tempWidth, tempHeight);
  }
}