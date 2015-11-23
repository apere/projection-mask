// author: adam m pere
// date: nov.2015

import processing.serial.*;

Serial port;   

int rawPulse;
int IBI; // time between heart beats
int BPM; 
boolean beat = false;  
int heart = 10; 

void setup() {
  fullScreen(P3D);
  pixelDensity(displayDensity());
  background(0);
  smooth(8);
  
  port = new Serial(this, Serial.list()[5], 115200); 
  port.clear(); // flush buffer
  port.bufferUntil('\n'); 
  
  
}

void draw() {
  
  
  
}