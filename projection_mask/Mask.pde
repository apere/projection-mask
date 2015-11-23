// author: adam m pere
// november.2015
//
// Mask

class Mask {
   ArrayList<Screen> screens;
   
   Mask(int numScreens) {
     screens = new ArrayList<Screen>();
     
     for(int i = 0; i < numScreens; i++) {
       screens.add(new Screen(1, new PVector(i*140, 200, 0), 4));
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