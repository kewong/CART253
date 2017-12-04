
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
    fill(255);
    textSize(100);
    text(value, x, y);
  }

}