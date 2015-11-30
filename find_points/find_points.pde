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
int numShapes;

int textX, textY;

// Keep track of which screen we're drawing by having a list of 'screens'
// click on shape to hide all others, click again to revert
// modes: enter number of points, click for shapes, etc
//(change that word shape to screen... this is for a specific task)


void setup() {
  fullScreen(P3D);
  background(0);
  pixelDensity(displayDensity());
  smooth(8);
  noStroke();
  
  output = "";
  printer = createWriter("mapped_points.json"); 
  printer.println("[");
  
  numShapes = 0;
  numPoints = 0;
  maxPoints = 4;
  points = new ArrayList<PVector>();
  
  textSize(36);
  textAlign(CENTER,BOTTOM);
}


void draw() {
  background(0);
  if(numPoints == maxPoints) {
     fill(200, 200, 10);
     textX = 0;
     textY = 0;
     beginShape();
       for(int i = 0; i < numPoints; i++) {
          vertex(points.get(i).x, points.get(i).y); 
          textX += points.get(i).x;
          textY += points.get(i).y;
       }
     endShape();
     
     
     fill(255,255, 255/(numShapes+1)+1);
     textX = (textX/numPoints);
     textY = (textY/numPoints);
     
     text(numShapes, textX, textY); 
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
     if(numShapes > 0) {
       printer.print(",");
     }
     
     printer.println("  {");
     printer.println("    \"screen\" : " + numShapes + ",");
     printer.println("    \"numberOfPoints\" : " + points.size() + ",");
     printer.println("    \"points\" : [");
     for(int i = 0; i < numPoints; i++) {
       printer.println("      {");
       printer.println("        \"x\" : " + points.get(i).x + ",");
       printer.println("        \"y\" : " + points.get(i).y + ",");
       printer.println("        \"z\" : 0");
       
       if(i < numPoints - 1) {
         printer.println("      },");
       } else {
         printer.println("      }");
       }
     }
     printer.println("    ]");
     printer.println("  }");
     points.clear();
     numPoints = 0;
     numShapes++;
   }
   points.add(new PVector(x, y)); 
   numPoints++;
}

void keyPressed() {
 if(key == ENTER || key == RETURN) {
   printer.println("]");
   printer.flush();
   printer.close();
   exit();
 }
}