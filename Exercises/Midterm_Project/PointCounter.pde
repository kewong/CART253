// this is where the counter's properties and settings are held
// the counters will count the player's score as well as their mistakes separately


class Counter {

  int value;
  int x;
  int y;
  int counterColor;


  Counter(int newX, int newY, int _counterColor ) {
    value = 0;
    x = newX;
    y = newY;
    counterColor = _counterColor;
  }

  void display() {
    textSize(100);
    text(value, x, y);
  }
}