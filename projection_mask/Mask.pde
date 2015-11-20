// author: adam m pere
// november.2015
//
// Mask

class Mask {
   ArrayList<Screen> screens;
   
   Mask(int numScreens) {
     screens = new ArrayList<Screen>();
     
     for(int i = 1; i <= numScreens; i++) {
       screens.add(new Screen(1, new PVector(i*20, i*20, 0), 3, 20));
     }
   }
   
   void render(int n) {
     for(Screen screen : screens) {
       screen.animate(n);
     }
   }
}