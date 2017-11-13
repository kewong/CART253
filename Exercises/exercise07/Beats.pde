//This class is where the user will be allowed to add their own beats by pressing specific keys

class Beats {

  int beat1;
  int beat2;
  int beat3;

  Beats(char _beat1, char _beat2, char _beat3) {

    beat1 = _beat1;
    beat2 = _beat2;
    beat3 = _beat3;
  }


  void keyPressed() {
    //CHANGED Checks if the letter R is pressed
    if (key == beat1) {
      //CHANGED the imported sound for the first beat will play once
      firstBeat.loop();
    } //CHANGED Otherwise it checks if the letter T is pressed 
    else if (key == beat2) {
      //CHANGED the imported sound for the second beat will play once
      secondBeat.loop();
    }// CHANGED it checks if the letter Y is pressed
    else if (key == beat3) {
      //CHANGED the imported sound for the third beat will play once
      thirdBeat.loop();
    }
  }
}