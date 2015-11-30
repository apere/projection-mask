// author: adam m pere
// november.2015
//
// Screen
// Class defining segmented areas of the mask

class Screen {
  PVector center;
  ArrayList<PVector> allPoints;
  int r, numPoints, mode, id;
  color from, to, tint;
  
  Screen(PVector p, int nPoints) {
    r = 60;
    center = p;
    numPoints = nPoints;
    
    from = color(255, 230, 230);
    to = color(255, 100, 100);
    
    mode = 0; // center points given
  }
  
  Screen(int screenID,  ArrayList<PVector> points) {
    allPoints = points;
    numPoints = points.size();
    id = screenID;
    
    from = color(255, 230, 230);
    to = color(255, 10, 10);
    
    mode = 1; // vector of points given
  }
  
  void animate(int numScreens, Movie vid, int heart, int breath) {
    int h = vid.height;
    int w = vid.width;
    float w_alph = w/numScreens;
    
    float scale = map(heart, 0, 20, 2, 1);
    float ratio = map(heart, 0, 20, 0.1, 1);
    
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
       float minX = allPoints.get(0).x, maxX = allPoints.get(0).y, minY = allPoints.get(0).y, maxY = allPoints.get(0).y;
       for(int i = 0; i < numPoints; i++) {
           if(allPoints.get(i).x < minX) {
             minX = allPoints.get(i).x; 
           } else if(allPoints.get(i).x > maxX) {
             maxX = allPoints.get(i).x; 
           }
           if(allPoints.get(i).y < minY) {
             minY = allPoints.get(i).y; 
           } else if(allPoints.get(i).y > maxY) {
             maxY = allPoints.get(i).y; 
           }
       }
       
       float d = w_alph*id;
       float tW = maxX - minX;
       float tH = h*tW/w_alph;
       
       
       float[] texX = {d, d + (allPoints.get(1).x - minX), d + ( allPoints.get(2).x - minX) , d + (allPoints.get(3).x - minX)};
       float[] texY = {(allPoints.get(0).y - minY), (allPoints.get(1).y - minY), (allPoints.get(2).y - minY), (allPoints.get(3).y - minY)};
     
       beginShape();
         texture(vid);
         tint(lerpColor(from, to, ratio));
         for(int i = 0; i < numPoints; i++) {
           vertex(allPoints.get(i).x, allPoints.get(i).y, allPoints.get(i).z, texX[i%4], texY[i%4]);
           println(id + "-" + i%4 + ". " + texX[i%4] + ", " + texY[i%4]);
         }
       endShape();
       break;
    }
  }
}