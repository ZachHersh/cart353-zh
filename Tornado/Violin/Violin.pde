import java.util.Iterator;

Terrain terrain;
Tornado tornado;
NewsOver news;
JetStream jetStream;
Jet single;

void setup() {
  
  size(600,600,P2D);  
  //fullScreen();
  
  terrain = new Terrain(10);
  tornado = new Tornado();
  news = new NewsOver();
  jetStream = new JetStream();
  //single = new Jet();
  
}

void draw() {
  
  news.run();
  
}














/* Todo - fix so that all cows get affected , maybe
not running through whole array ?

make cows spin as opposed to get stuck once captured.
*/


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