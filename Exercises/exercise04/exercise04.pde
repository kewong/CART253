// Griddies
// by Pippin Barr
// MODIFIED BY: Kelsey Wong
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 7;
// An array storing all the griddies
Griddie[] griddies = new Griddie[1200];

Snake snake;



// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(50);

  snake = new Snake();

  // QUESTION: What does this for loop do?
  // ANSWER: This allows the griddies to appear in different areas of the screen
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {

  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // CHANGED
    // Draw function checks whenever the griddles and the snake's points align
    snake.collide(griddies[i]);


    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // ANSWER: it is commanded if the second round of griddies are inequal to the first round of griddies
      if (j != i) {
        // QUESTION: What does this line check?
        // ANSWER: This line checks whether any of the griddies collide with one another
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }
  // CHANGED 
  // Displays the snake
  snake.display();
  snake.update();
}