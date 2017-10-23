// Snake uses the Brownian method, found on Processing website
// the program creates points at random locations 

class Snake {


  // CHANGED
  int num = 150;
  int range = 60;
  // CHANGED
  float[] ax = new float[num];
  float[] ay = new float[num]; 


  Snake() {
    // CHANGED
    for (int i = 0; i < num; i++) {
      ax[i] = width/2;
      ay[i] = height/2;
    }
  }

  void update() {
    // CHANGED
    //// Shift all elements 1 place to the left
    for (int i = 1; i < num; i++) {
      ax[i-1] = ax[i];
      ay[i-1] = ay[i];
    }
    // CHANGED
    // This changes the value at the end of the array
    ax[num-1] += random(-range, range);
    ay[num-1] += random(-range, range);

    // CHANGED
    // This constrains all of the points within the screen
    ax[num-1] = constrain(ax[num-1], 0, width);
    ay[num-1] = constrain(ay[num-1], 0, height);
  }

  void display() {
    // CHANGED
    // Draw a line that connects each point
    for (int i = 1; i < num; i++) {    
      stroke(0, 255, 0);
      line(ax[i-1], ay[i-1], ax[i], ay[i]);
    }
  }
}