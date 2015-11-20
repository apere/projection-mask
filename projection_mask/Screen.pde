// author: adam m pere
// november.2015
//
// Screen
// Class defining segmented areas of the mask

class Screen {
  PVector center;
  int numPoints;
  int mode;
  int animateFrames;
  
  
  Screen(int m, PVector p, int nPoints, int numFrames) {
    mode = m;
    center = p;
    numPoints = nPoints;
    animateFrames = numFrames;
  }
  
  void animate(int currFrame) {
    float scale = map(currFrame, 0, 20, 1, 5);
    beginShape();
      vertex(center.x - 20*scale, 20*scale, 20*scale);
      vertex(center.x + 20*scale, 20, center.z);
      vertex(center.x, center.y - 20*scale, center.z);
    endShape();
  }
}