class Star {
  // CHANGED Star coordinates in 3D
  float x;
  float y;
  float z;


  Star() {
    x = random(-5000, 5000);
    y = random(-5000, 5000);
    z = random(0, 2000);
  }

  void update() {
    // CHANGED Move stars closer to viewport
    z-=40;    
    // CHANGED Reset stars if they go off screen
    if (z <= 0.0) 
      reset();
  }

  void reset() {
    // CHANGED Reset star to a position far away
    x = random(-5000, 5000);
    y = random(-5000, 5000);
    z = 2000.0;
  }

  void draw() {
    // CHANGED Project star only viewport
    float offsetX = 100.0*(x/z);
    float offsetY = 100.0*(y/z);
    float scaleZ = 0.0001*(2000.0-z);

    // CHANGED draw the stars
    pushMatrix();
    translate(offsetX, offsetY);
    scale(scaleZ);
    ellipse(0, 0, 200, 20);
    popMatrix();
  }
}