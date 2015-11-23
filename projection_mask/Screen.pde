// author: adam m pere
// november.2015
//
// Screen
// Class defining segmented areas of the mask

class Screen {
  PVector center;
  int numPoints;
  int mode;
  int r= 60;
  
  Screen(int m, PVector p, int nPoints) {
    mode = m;
    center = p;
    numPoints = nPoints;
  }
  
  void animate(int count, Movie vid, int heart) {
    beginShape();
      texture(vid);
      vertex(center.x - r, center.y - r, center.z + r, 0, 0);
      vertex(center.x + r, center.y - r, center.z + r, 4*r, 0);
      vertex(center.x + r, center.y + r, center.z - r, 4*r, 4*r);
      vertex(center.x - r, center.y + r, center.z- r, 0, 4*r);
    endShape();
  }
}