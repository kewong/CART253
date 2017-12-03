// CHANGED this class contains the settings for the soundwave
// CHANGED it will expand and contract depending on the frequency of the player's voice


class Wave {



  void setup() {
  }


  void display() {
    // CHANGED analyzes the information recieved from the microphone
    fft.forward(input.mix);
    // CHANGED modified the soundwave to look like a circle
    for (int i = 0; i < fft.specSize(); i++)
    {
      //CHANGED the color that filled the wave to black, creating a linear-type of wave
      fill(0);
      //CHANGED the size, shape, and the sensitivity of the wave's reaction to sound frequency
      ellipse(width/2, height/2, 400, fft.getBand(i) * 200);
    }
  }
}