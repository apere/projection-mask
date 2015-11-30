// author: adam m pere
// november.2015
//
// Arduino:
// Pulse Sensor: A0
// Wind Sensor: A1
import processing.serial.*;
import processing.video.*;

Serial port;   

Movie vid;
ArrayList<Movie> vids;

JSONArray values;

int rawPulse, IBI, BPM, heart = 10; // IBI - time between heart beats
boolean beat = false;  
float windTemp, windVolts, windSpeed;

Mask m;

void setup() {
  fullScreen(P3D);
  pixelDensity(displayDensity());
  
  // comment out for testing w/o sensor input
  //port = new Serial(this, Serial.list()[5], 115200); 
  //port.clear(); // flush buffer
  //port.bufferUntil('\n'); 
  
  values = loadJSONArray("mapped_points.json");
  m = new Mask(values);
  
  frameRate(30);
  
  vid = new Movie(this, "birds/birds.mp4");
  vid.loop();
  
  //vids = new ArrayList<Movie>();
  //vids.add((new Movie(this,"birds/birds_01.mp4")));
  //vids.add((new Movie(this,"birds/birds_02.mp4")));
  //vids.add((new Movie(this,"birds/birds_03.mp4")));
  //vids.add((new Movie(this,"birds/birds_04.mp4")));
  //vids.add((new Movie(this,"birds/birds_05.mp4")));
  //vids.add((new Movie(this,"birds/birds_06.mp4")));
  
  //for(Movie video : vids) {
  //   video.loop();
  //}
  
  
}

void draw() {
  background(0);
  m.render(vid, heart, (int)windSpeed);
  
  // text useful for debugging
  text("Framerate: " + int(frameRate),120,height-10);
  fill(255);
  if(heart == 20) {
     fill(255, 20, 90); 
  }
  text("BPM: " + BPM, 10, height - 10);
  text("h: " + heart, 300, height-10);
  
  text("W: " + windSpeed, 375, height - 10);
  text("T: " + windTemp, 450, height - 10);
  text("Z: " + windVolts, 525, height - 10);
  
  if(heart > 0) { 
    heart--; // usefull for pulse animation
  }
}

void movieEvent(Movie m) { 
  m.read(); 
} 