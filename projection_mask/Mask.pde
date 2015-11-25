// author: adam m pere
// november.2015
//
// Mask

class Mask {
   ArrayList<Screen> screens;
   PVector[] points;
   
   Mask(JSONArray values) {
     screens = new ArrayList<Screen>();    
     
     ArrayList<PVector> temp = new ArrayList<PVector>();
     int screenID;
     JSONArray points;
     JSONObject point;
     
     for (int i = 0; i < values.size(); i++) {
       JSONObject screen = values.getJSONObject(i); 
    
       screenID = screen.getInt("screen");
       points = screen.getJSONArray("points");
       
       for(int j = 0; j < points.size(); j++) {
         point = points.getJSONObject(j);
         temp.add(new PVector(point.getFloat("x"), point.getFloat("y"), point.getFloat("z")));
       }
       screens.add(new Screen(screenID, temp));
     }
   }
   
   Mask() {
     screens = new ArrayList<Screen>();

     ArrayList<PVector> temp = new ArrayList<PVector>();
     for(int i = 0; i < 4; i++) {
       if(i%4 == 0 && i != 0) {
         screens.add(new Screen(4,temp));
         temp.clear();
       }
       temp.add(points[i]);
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