class Terrain {

  PVector loc;
  PShape map;
  PVector zoom;
  Cow[] cows;
  boolean[] keys = {false, false, false, false};

  Terrain(int _n) {
    loc = new PVector(0, 0);
    zoom = new PVector(2800, 3000);
    map = loadShape("map.svg");
    cows = new Cow[3*_n];
    makeCows();
  }


  void makeCows() {
    
    // Instantiate cows for the cow array.
    for (int i=0; i<cows.length; i++) {
      cows[i] = new Cow(int(random(300, zoom.x-300)), int(random(300, zoom.y-300)));
    }
  } 


  void run() {
    update();
    display();
  }


  void update() {
    
    // Link keys pressed with their effect on matrix translation.
    if (keys[0] == true && loc.y<0) loc.y +=6;
    if (keys[1] == true && loc.x<0) loc.x +=6;
    if (keys[2] == true && loc.y>-2400) loc.y -=6;
    if (keys[3] == true && loc.x>-2196) loc.x -=6;
  } 


  void display() {
    
    pushMatrix();
    translate(loc.x, loc.y);
     
    // Show map
    shapeMode(CORNER);
    shape(map, 0, 0, zoom.x, zoom.y);

    // Show cows
    for (int i=0; i<cows.length; i++) { 
      shape(cows[i].cow, cows[i].loc.x, cows[i].loc.y, 30, 60);
    }
    
    // Show jetStream.
    jetStream.run();
    tornado.healthInc(jetStream);
    
    popMatrix();
  }
}

void keyPressed() {
//println("test");
  // Moves Tornado. Binds keys to boolean vars in updatePos().
  if (key == 'w' && news.state == 3) terrain.keys[0] = true;
  if (key == 'a' && news.state == 3) terrain.keys[1] = true;
  if (key == 's' && news.state == 3) terrain.keys[2] = true;
  if (key == 'd' && news.state == 3) terrain.keys[3] = true;

  // Increase/Deacrease map size.
  if (key == 'z') terrain.zoom.sub(100, 100); 
  if (key == 'x') terrain.zoom.add(100, 100);

  // Resets cow placement.
  if (key == 'c') terrain.makeCows();

  // Shortcuts to gamestates.
  if (key == '1') news.state = 1;
  if (key == '2') news.state = 2;
  if (key == '3') news.state = 3;
  if (key == '4') news.state = 4;

  // In game state control buttons.
  if (key == 'i' && news.state == 1) news.state = 2; 
  if (key == 'p' && news.state == 1) news.state = 3; 
  if (key == 'e' && news.state == 1) exit();
  
  // Instruction state control buttons.
  if (key == 'a' && news.state == 2 && news.instructSelect > 2) news.instructSelect--;
  if (key == 'd' && news.state == 2 && news.instructSelect < 5) news.instructSelect++;
  if (key == ' ' && news.state == 2 && news.instructSelect == 5) news.state = 3;
  
}

void keyReleased() {

  // Resets boolean values.
  if (key == 'w') terrain.keys[0] = false;
  if (key == 'a') terrain.keys[1] = false;
  if (key == 's') terrain.keys[2] = false;
  if (key == 'd') terrain.keys[3] = false;
}