// author: adam m pere
// date: nov.2015
//
// find_points - click to find the x-y coordinates for
// mapping x-y coordinates to mask screens
//
// maxPoints sets the number of points for each shape
//
// Click to choose a point, every time maxPoint # of mouse clicks, the shape
// will be written to the screen and points written to the file.
//
// enter to write all points to a txt file & close program.

ArrayList<PVector> points;
int numPoints;
int maxPoints;
String output;
PrintWriter printer;

void setup() {
  fullScreen(P3D);
  background(0);
  pixelDensity(displayDensity());
  smooth(8);
  noStroke();
  
  
  output = "";
  printer = createWriter("mapped_points.txt"); 
  
  numPoints = 0;
  maxPoints = 4;
  points = new ArrayList<PVector>();
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
  
   
   if (numPoints >= maxPoints) {
     for(int i = 0; i < numPoints; i++) {
       println("new PVector(" + points.get(i).x + ", " + points.get(i).y + ", 0)");
       printer.println("new PVector(" + points.get(i).x + ", " + points.get(i).y + ", 0)");
     }
     printer.println("---");
     println("---");
     points.clear();
     numPoints = 0;
   }
   points.add(new PVector(x, y)); 
   numPoints++;
}

void keyPressed() {
 if(key == ENTER || key == RETURN) {
   printer.flush();
   printer.close();
   exit();
 }
}