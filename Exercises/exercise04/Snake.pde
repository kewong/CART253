// Snake uses the Brownian method, found on Processing website
// the program creates points at random locations 

class Snake {


  // CHANGED
  // The range from one point to another in the array
  int num = 150;
  int range = 7;
  // CHANGED
  // The points will always land on a point on the grid
  int[] ax = new int[num];
  int[] ay = new int[num]; 


  Snake() {
    // CHANGED
    // The snake will appear in the center of the screen and will expand until its maximum length(num)
    for (int i = 0; i < num; i++) {
      ax[i] = width/2;
      ay[i] = height/2;
    }
  }

  void update() {
    // CHANGED
    // Shifts all elements one place to the left, creating the snake's trail
    for (int i = 1; i < num; i++) {
      ax[i-1] = ax[i];
      ay[i-1] = ay[i];
    }
    // CHANGED
    // This changes the value at the end of the array
    ax[num-1] += gridSize * (int) random(-range, range);
    ay[num-1] += gridSize * (int) random(-range, range);

    // CHANGED
    // This constrains all of the points within the screen
    ax[num-1] = constrain(ax[num-1], 0, width);
    ay[num-1] = constrain(ay[num-1], 0, height);
  }

  // CHANGED
  // Added the collide function that is called whenever one of the snake's points in the array align with one of the griddies
  void collide(Griddie other) {
    // If the griddie is not there/the snake does not touch a griddie, the program skips the statement below
    if (other.energy == 0) {
      return;
    }

    // CHANGED
    // This for loop checks whether the skake collides with the griddies
    for (int i = 0; i <150; i++) {
      // If it does, the griddie will immediately die
      if (ax[i] == other.x && ay[i] == other.y) {
        other.energy = 0;
      }
    }
  }

  void display() {
    // CHANGED
    // Draws a line that connects each point
    for (int i = 1; i < num; i++) {    
      stroke(0, 255, 0);
      line(ax[i-1], ay[i-1], ax[i], ay[i]);
    }
  }
}