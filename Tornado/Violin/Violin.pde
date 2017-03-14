Terrain terrain;
Tornado tornado;
NewsOver newsO;

void setup() {
  size(600,600);  
  //fullScreen();
  
  terrain = new Terrain(10);
  tornado = new Tornado();
  newsO = new NewsOver();
  
}

void draw() {
  
  background(255);
  
  for(int i=0; i<terrain.cows.length; i++) {
    
    // Calculate gravity.
    PVector force = tornado.attract(terrain.cows[i]); 
    
    // Apply gravity to cows and stick them to tornado.
    terrain.cows[i].applyForce(force, tornado);
    
    // If cow is not captured by tornado..
    //if(!terrain.cows[i].capture) {
      // Update cow location
      terrain.cows[i].update();
      // Keep cows within terrain edges
      terrain.cows[i].checkEdges();
    //}
    
  }
  
  //display terrain
  pushMatrix();
  translate(terrain.loc.x,terrain.loc.y);
  terrain.showMap();
  popMatrix();
  
  //display tornado
  tornado.display();
  
  /*
  textSize(16);
  String myText = "tornado: " + int(tornado.trsLoc.x) + ", " + int(tornado.trsLoc.y) +
  "\ncow: " + int(terrain.cows[0].loc.x) + ", " + int(terrain.cows[0].loc.y) +
  "\ncow: " + int(terrain.cows[1].loc.x) + ", " + int(terrain.cows[1].loc.y) +
  "\ncow: " + int(terrain.cows[2].loc.x) + ", " + int(terrain.cows[2].loc.y) +
  "\ncow: " + int(terrain.cows[3].loc.x) + ", " + int(terrain.cows[3].loc.y) +
  "\ncow: " + int(terrain.cows[4].loc.x) + ", " + int(terrain.cows[4].loc.y) +
  "\ncow: " + int(terrain.cows[5].loc.x) + ", " + int(terrain.cows[5].loc.y);
  text(myText,20,20);
  text(tornado.tLoc,220,20);
  //println(terrain.loc.x, terrain.loc.y);
  //println(terrain.zoom.x, terrain.zoom.y);
  */
  
  newsO.display();
  
}

/* Todo - fix so that all cows get affected , maybe
not running through whole array ?

make cows spin as opposed to get stuck once captured.
*/