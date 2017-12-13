// CHANGED this class contains the settings for the soundwave
// CHANGED it will expand and contract depending on the frequency of the player's voice


class Wave {

  float ellipseX;
  float ellipseY;
  float ellipseW;
  float largestHeight = 0;

  Wave() {
    ellipseX = width/2;
    ellipseY =height/2;
    ellipseW =400;
  }


  //////// DISPLAY ////////


  void display() {
    largestHeight=0;
    // CHANGED analyzes the information recieved from the microphone
    fft.forward(input.mix);
    // CHANGED modified the soundwave to look like a circle

    for (int i = 0; i < fft.specSize(); i++)
    {
      //CHANGED the color that filled the wave to black, creating a linear-type of wave
      fill(0);
      //CHANGED the size, shape, and the sensitivity of the wave's reaction to sound frequency
      if ( fft.getBand(i) * 100>largestHeight)
      {
        largestHeight = fft.getBand(i)*100;
      }
      ellipse(ellipseX, ellipseY, ellipseW, fft.getBand(i) * 100);
    }
  }
  // CHANGED this boolean becomes true when the height of the wave matches the height of the box
  boolean checkCollision(Box b)
  {
    // CHANGED checks if the wave is inside the box
    if (ellipseX-ellipseW/2 > b.x-b.tempWidth/2 && ellipseX+ellipseW/2 < b.x+b.tempWidth/2 )
    {
      // CHANGED checks if the wave's height comes into contact with the height of the box
      if (ellipseY-largestHeight/2 > (b.y-b.tempHeight/2)-15 && ellipseY-largestHeight/2 < (b.y-b.tempHeight/2)+30)
      {
        hitCounter.value++;
        b.boxHit =true;
        // CHANGED If both if statements are true, the boolean will return true
        return true;
      }
    }
    // CHANGED if one or both if statements are false, 
    return false;
  }
}