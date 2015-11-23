// author: adam m pere
// date: nov.2015
//
// find_points - click to find the x-y coordinates for
// mapping x-y coordinates to mask screens

ArrayList<PVector> points;
int numPoints = 0;
int maxPoints = 4;

void setup() {
  fullScreen(P3D);
  background(0);
  pixelDensity(displayDensity());
  
  points = new ArrayList<PVector>();
  noStroke();
  smooth(8);
}


void draw() {
  background(0);
  if(numPoints == maxPoints) {
     beginShape();
       for(int i = 0; i < numPoints; i++) {
          vertex(points.get(i).x, points.get(i).y); 
       }
     endShape();
  }
  
  fill(255);
  noStroke();
  triangle(mouseX, mouseY, mouseX - 20, mouseY + 50, mouseX + 20, mouseY + 50);
  
  noFill();
  stroke(255);
  ellipse(mouseX, mouseY, 40, 40);
  
  fill(255);
  noStroke();
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