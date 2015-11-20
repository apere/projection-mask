// author: adam m pere
// november.2015

import processing.serial.*;

Serial port;   

int rawPulse;
int IBI; // time between heart beats
int BPM; 
boolean beat = false;  
int heart = 10; 

Mask m;

void setup() {
  size(600, 400, P3D);
  //fullscreen();
  
  //port = new Serial(this, Serial.list()[5], 115200); 
  //port.clear(); // flush buffer
  //port.bufferUntil('\n'); 
  
  m = new Mask(7);
  frameRate(30);
}

void draw() {
  background(0);
  m.render(heart);
  
  if(heart > 0) { 
    heart--; // usefull for pulse animation
  } else {
     heart = 20; 
  }
  
  
  // text useful for debugging
  text("Framerate: " + int(frameRate),90,height-10);
  fill(255);
  if(heart == 20) {
     fill(255, 20, 90); 
  }
  text("BPM: " + BPM, 10, height - 10);
}