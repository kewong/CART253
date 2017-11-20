// Used a starter code from https://ideone.com/iYhvdW



import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;

AudioInput input;
FFT fft;
int[][] colo=new int[300][3];
//AudioIn in;

Wave wave;
 
void setup()
{
  size(480, 320);
   //fullScreen();
  noCursor();
  
 wave = new Wave();
 
  minim = new Minim(this);
 
 
  input = minim.getLineIn();
 
  fft = new FFT(input.bufferSize(), input.sampleRate());
 
 // textFont(createFont("Arial", 16));
 
 // windowName = "None";
}
 
void draw()
{
  background(0);
  stroke(255);
 
 wave.display();
}








//import ddf.minim.*;
//import ddf.minim.analysis.*; // We need this one for FFT
//Minim minim;
//AudioInput mic; // Microphone input
//FFT fft; // Fast Fourier Transforms

//Wave wave;


//void setup() {
//  size(500, 500);
//  minim = new Minim(this); // Create Minim
//  mic = minim.getLineIn(); // Get the microphone
//  fft = new FFT(mic.bufferSize(), mic.sampleRate()); // Create our FFT

//  wave = new Wave();
//}
//void draw() {

//  background(0);
  
//  wave.display();
//  wave.update();
//}