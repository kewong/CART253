class Wave {



  void setup() {
  }

void update() {

for(int i = 0; i == width/2; i++);{
  
  
}
  
}

  void display() {
   
     fft.forward(input.mix);
//512 values below --> this loop is called 25 times per second
//try getting the highest value and making a shape based on that value
//maybe change color based on the size of the value?
  for(int i = 0; i < fft.specSize(); i++)
  {
 fill(250);
 ellipse(i,200,7,fft.getBand(i) * 10);
 
 
    // fft.getBand(i); //this is float which is very much like a double
 
 
}
 
  // keep us informed about the window being used
 // text("The window being used is: " + windowName, 5, 20);
    
    //stroke(255);
    //fft.forward(input.mix); // Apply the FFT to the current input
    //// Now go through the spectrum generated
    //for (int i = 0; i < fft.specSize(); i++) {
    //  // Get the value of this band
    //  float b = fft.getBand(i);
    //  // Map the location in the spectrum to x
    //  float x = map(i, height/2, fft.specSize(), width/2, height/2);
    //  // Map the amplitude of the band to height
    //  float h = map(b, 0, 10, 0, height);
    //  // Draw a line representing this band
    //  line(x, height/2 - h, x, width/2);
    //}
  }
}