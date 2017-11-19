import ddf.minim.*;
import ddf.minim.analysis.*; // We need this one for FFT
Minim minim;
AudioInput mic; // Microphone input
FFT fft; // Fast Fourier Transforms
void setup() {
  size(500, 500);
  minim = new Minim(this); // Create Minim
  mic = minim.getLineIn(); // Get the microphone
  fft = new FFT(mic.bufferSize(), mic.sampleRate()); // Create our FFT
}
void draw() {
  background(255);
  fft.forward(mic.mix); // Apply the FFT to the current input
  // Now go through the spectrum generated
  for (int i = 0; i < fft.specSize(); i++) {
    // Get the value of this band
    float b = fft.getBand(i);
    // Map the location in the spectrum to x
    float x = map(i, height/2, fft.specSize(), width/2, height/2);
    // Map the amplitude of the band to height
    float h = map(b, 0, 10, 0, height);
    // Draw a line representing this band
    line(x,height/2 - h,x,width/2);
  }
}