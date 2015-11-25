// author: adam m pere
// november.2015
//
// Screen
// Class defining segmented areas of the mask

class Screen {
  PVector center;
  ArrayList<PVector> allPoints;
  int r, numPoints, mode, id;
  color from, to;
  
  Screen(PVector p, int nPoints) {
    r = 60;
    center = p;
    numPoints = nPoints;
    
    from = color(255, 230, 230);
    to = color(255, 100, 100);
    
    mode = 0; // center points given
  }
  
  Screen(int screenID,  ArrayList<PVector> points) {
    r = 60;
    allPoints = points;
    numPoints = points.size();
    id = screenID;
    
    from = color(255, 230, 230);
    to = color(255, 10, 10);
    
    mode = 1; // vector of points given
  }
  
  void animate(int count, Movie vid, int heart) {
    float scale = map(heart, 0, 20, 2, 1);
    float ratio = map(heart, 0, 20, 0.1, 0.99);
    float[] texX = {0, 4*r, 4*r, 0};
    float[] texY = {0, 0, 4*r, 4*r};
    
      
      switch(mode) {
        case(0):
          beginShape();
            texture(vid);
            //tint(lerpColor(from, to, ratio));
            vertex(center.x - r, center.y - r, center.z + r, 0, 0);
            vertex(center.x + r, center.y - r, center.z + r, 4*r*scale, 0);
            vertex(center.x + r, center.y + r, center.z - r, 4*r*scale, 4*r*scale);
            vertex(center.x - r, center.y + r, center.z- r, 0, 4*r*scale);
          endShape();
          break;
         case(1):
           beginShape();
             texture(vid);
             //tint(lerpColor(from, to, ratio));
             for(int i = 0; i < numPoints; i++) {
               vertex(allPoints.get(i).x, allPoints.get(i).y, allPoints.get(i).z, texX[i%4], texY[i%4]); 
             }
           endShape();
           break;
      }
     
  }
}