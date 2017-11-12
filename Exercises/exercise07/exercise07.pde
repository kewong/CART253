import processing.sound.*;
SoundFile stereoSound;
void setup() {
  // This time we're loading a file that is created in stereo
  stereoSound = new SoundFile(this, "zapsplat_sound_design_hit_heavy_metal_hard_reverb_cinematic_003_14563.mp3");
}
void draw() {
}
void mouseClicked() {
  stereoSound.loop(); // This doesn't work! It just plays once!
}