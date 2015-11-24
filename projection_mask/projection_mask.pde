// author: adam m pere
// november.2015

import processing.serial.*;
import processing.video.*;

Serial port;   

Movie vid;

int rawPulse, IBI, BPM, heart = 10; // IBI - time between heart beats
boolean beat = false;  
float windTemp, windVolts, windSpeed;

Mask m;

void setup() {
  fullScreen(P3D);
  pixelDensity(displayDensity());
  
  port = new Serial(this, Serial.list()[5], 115200); 
  port.clear(); // flush buffer
  port.bufferUntil('\n'); 
  
  m = new Mask();
  frameRate(30);
  
  vid = new Movie(this, "5loop.mp4");
  vid.loop();
}

void draw() {
  background(0);
  m.render(vid, heart);
  
  if(heart > 0) { 
    heart--; // usefull for pulse animation
  } else {
     heart = 20; 
  }
  
  
  // text useful for debugging
  text("Framerate: " + int(frameRate),120,height-10);
  fill(255);
  if(heart == 20) {
     fill(255, 20, 90); 
  }
  text("BPM: " + BPM, 10, height - 10);
  text("h: " + heart, 300, height-10);
}

void movieEvent(Movie m) { 
  m.read(); 
} 