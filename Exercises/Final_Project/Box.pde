//CHANGED The Box class is where the settings for the boxes are made
//CHANGED The challenge is for the player to exceed the borders of the box to gain points
//CHANGED once the player misses three boxes completely, the game will end



class Box {

  int x;
  int y;

  int tempWidth;
  float tempHeight;

  //CHANGED added constructor
  Box(int _x, int _y, int _tempWidth, float _tempHeight) {
    x = _x;
    y = _y;
    tempWidth = _tempWidth;
    tempHeight = _tempHeight;
  }

  //  void setup() {
  //  }

  void update() {

    //CHANGED the box will regenerate once every second
    //frameRate(1);

    // CHANGED trying to make the boxes move across the screen from left to right
    // I know this is definitely not right..
    if (tempWidth < 0 ) {
      x++;
    }
  }

  void display() {

    //CHANGED the box will be transparent, only the borders will show on the screen
    noFill();
    stroke(0, 255, 0);
    //CHANGED the rectangle will appear in the middle of the screen
    rectMode(CENTER);
    rect(x, y, tempWidth, tempHeight);
  }
}