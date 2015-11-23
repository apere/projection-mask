// author: adam m pere
// november.2015
//
// Mask

class Mask {
   ArrayList<Screen> screens;
   PVector[] points;
   
   Mask(int numScreens) {
     screens = new ArrayList<Screen>();
     points=new PVector[] {
      new PVector(886.0, 218.0, 0),
      new PVector(1059.0, 230.0, 0),
      new PVector(1007.0, 444.0, 0),
      new PVector(862.0, 427.0, 0),
      new PVector(1073.0, 146.0, 0),
      new PVector(1225.0, 256.0, 0),
      new PVector(1175.0, 497.0, 0),
      new PVector(1037.0, 395.0, 0),
      new PVector(1041.0, 397.0, 0),
      new PVector(1176.0, 504.0, 0),
      new PVector(1070.0, 1018.0, 0),
      new PVector(997.0, 1023.0, 0),
      new PVector(1291.0, 204.0, 0),
      new PVector(1378.0, 334.0, 0),
      new PVector(1299.0, 587.0, 0),
      new PVector(1232.0, 478.0, 0),
      new PVector(1296.0, 595.0, 0),
      new PVector(1215.0, 443.0, 0),
      new PVector(1084.0, 1036.0, 0),
      new PVector(1153.0, 1039.0, 0),
      new PVector(1380.0, 380.0, 0),
      new PVector(1452.0, 446.0, 0),
      new PVector(1340.0, 623.0, 0),
      new PVector(1378.0, 702.0, 0),
      new PVector(1338.0, 797.0, 0),
      new PVector(1333.0, 602.0, 0),
      new PVector(1249.0, 1004.0, 0),
      new PVector(1259.0, 1009.0, 0),
      new PVector(854.0, 178.0, 0),
      new PVector(1028.0, 180.0, 0),
      new PVector(1029.0, 458.0, 0),
      new PVector(883.0, 450.0, 0),
      new PVector(873.0, 462.0, 0),
      new PVector(1015.0, 475.0, 0),
      new PVector(1002.0, 990.0, 0),
      new PVector(898.0, 1019.0, 0),
      new PVector(664.0, 291.0, 0),
      new PVector(862.0, 244.0, 0),
      new PVector(868.0, 493.0, 0),
      new PVector(740.0, 516.0, 0),
      new PVector(756.0, 542.0, 0),
      new PVector(860.0, 523.0, 0),
      new PVector(878.0, 1008.0, 0),
      new PVector(802.0, 1023.0, 0),
      new PVector(564.0, 470.0, 0),
      new PVector(729.0, 383.0, 0),
      new PVector(740.0, 587.0, 0),
      new PVector(674.0, 604.0, 0)
     };
     PVector[] temp = new PVector[4];
     for(int i = 0; i < points.length; i++) {
       if(i%4 == 0 && i != 0) {
         screens.add(new Screen(4,temp));
         temp = new PVector[4];
       }
       temp[i%4] = points[i];
       
     }
   
   }
   
   void render(Movie vid, int heart) {
     int count = 1;
     for(Screen screen : screens) {
       screen.animate(count, vid, heart);
       count++;
     }
   }
}