// CHANGED the counter class is where the main settings of the points counters are made
// CHANGED one counter (hitCounter) will increase whenever the wave comes into contact with the height of the box
// CHANGED the other counter (missCounter) will start at 5 and decrease whenever the player misses the box
// CHANGED the game will be over once the missCounter reaches 0



class Counter {

  int value;
  int x;
  int y;
  int counterColor;


  //////// CONSTRUCTOR ////////


  // CHANGED added a constructor for the counters
  Counter(int newX, int newY, int _counterColor, int _value ) {
    value = _value;
    x = newX;
    y = newY;
    counterColor = _counterColor;
  }


  //////// DISPLAY ////////


  void display() {
    fill(counterColor);
    textSize(100);
    text(value, x, y);
  }
}