// author: adam m pere
// date: nov.2015
//
// find_points - click to find the x-y coordinates for
// mapping x-y coordinates to mask screens

ArrayList<PVector> points;
int numPoints = 0;
int maxPoints = 4;

void setup() {
  fullScreen();
  background(0);
  
  points = new ArrayList<PVector>();
  noStroke();
  smooth();
}


void draw() {
  if(numPoints == maxPoints) {
     beginShape();
       for(int i = 0; i < numPoints; i++) {
          vertex(points.get(i).x, points.get(i).y); 
       }
     endShape();
  }
}

void mousePressed() {
   int x = mouseX;
   int y = mouseY;
   println("new PVector(" + x + ", " + y + ", 0)");
   
   if (numPoints >= maxPoints) {
     println("---");
     points.clear();
     numPoints = 0;
   }
   points.add(new PVector(x, y)); 
   numPoints++;
}