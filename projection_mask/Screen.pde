// author: adam m pere
// november.2015
//
// Screen
// Class defining segmented areas of the mask

class Screen {
  PVector center;
  PVector[] allPoints;
  int numPoints;
  int mode;
  int r= 60;
  color from, to;
  
  Screen(PVector p, int nPoints) {
    center = p;
    numPoints = nPoints;
    
    from = color(255, 230, 230);
    to = color(255, 100, 100);
    
    mode = 0; // center points given
  }
  
  Screen(int nPoints, PVector[] points) {
    allPoints = points;
    numPoints = nPoints;
    
    from = color(255, 230, 230);
    to = color(255, 10, 10);
    
    mode = 1; // vector of points given
  }
  
  void animate(int count, Movie vid, int heart) {
    float scale = map(heart, 0, 20, 2, 1);
    float ratio = map(heart, 0, 20, 0.1, 0.99);
    beginShape();
      texture(vid);
      tint(lerpColor(from, to, ratio));
      if(mode == 0) {
        vertex(center.x - r, center.y - r, center.z + r, 0, 0);
        vertex(center.x + r, center.y - r, center.z + r, 4*r*scale, 0);
        vertex(center.x + r, center.y + r, center.z - r, 4*r*scale, 4*r*scale);
        vertex(center.x - r, center.y + r, center.z- r, 0, 4*r*scale);
      } else if(mode == 1) {
        
      }
    endShape();
  }
}