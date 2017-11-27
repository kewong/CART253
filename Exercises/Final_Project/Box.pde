//CHANGED The Box class is where the settings for the boxes are made
//CHANGED The challenge is for the player to exceed the borders of the box to gain points
//CHANGED once the player misses three boxes completely, the game will end



class Box {

  int x;
  int y;

  float tempWidth;
  float tempHeight;

  void update() {
    
    //CHANGED the size of the box will vary in size and will regenerate at random dimensions
    tempWidth = random(100, 1600);
    tempHeight = random(20, 1000);
  }

  void display() {
    
    x = width/2;
    y = height/2;
    
    //CHANGED the box will be transparent, only the borders will show on the screen
    noFill();
    stroke(0, 255, 0);
    //CHANGED the rectangle will appear in the middle of the screen
    rectMode(CENTER);
    rect(x, y, tempWidth, tempHeight);
    
  }
}