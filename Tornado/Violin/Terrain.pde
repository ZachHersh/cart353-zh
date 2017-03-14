class Terrain {
  
  PVector loc;
  PShape map;
  PVector zoom;
  Cow[] cows;
  boolean[] keys = {false, false, false, false};
  
  Terrain(int _n) {
    loc = new PVector(0,0);
    zoom = new PVector(2800,3000);
    map = loadShape("map.svg");
    cows = new Cow[3*_n];
    makeCows();
  }
   
  void makeCows() {
  // Instantiate cows for the cow array in random location on terrain
    for(int i=0;i<cows.length;i++){
      cows[i] = new Cow(int(random(300,zoom.x-300)),int(random(300,zoom.y-300)));
    }
  } 
    
  void updatePos() {
  // Link keys pressed with their effect on matrix translation.
    if (keys[0] == true && loc.y<0) loc.y +=6;
    if (keys[1] == true && loc.x<0) loc.x +=6;
    if (keys[2] == true && loc.y>-2400) loc.y -=6;
    if (keys[3] == true && loc.x>-2200) loc.x -=6;
  } 
  
  void showMap() {
  // displays map and updates its position
    updatePos();
    shape(map,0,0,zoom.x,zoom.y);
    for(int i=0;i<cows.length;i++) {
      cows[i].showCow(); 
    }
  }
  
}
  
void keyPressed() {
  // Binds keys to boolean vars in updatePos().
  if (key == 'w') terrain.keys[0] = true;
  if (key == 'a') terrain.keys[1] = true;
  if (key == 's') terrain.keys[2] = true;
  if (key == 'd') terrain.keys[3] = true;
  // Increase/Deacrease map size.
  if (key == 'z') terrain.zoom.sub(100,100); 
  if (key == 'x') terrain.zoom.add(100,100);
  // Resets cow placement.
  if (key == 'c') terrain.makeCows();
}

void keyReleased() {
  // Resets boolean values.
  if (key == 'w') terrain.keys[0] = false;
  if (key == 'a') terrain.keys[1] = false;
  if (key == 's') terrain.keys[2] = false;
  if (key == 'd') terrain.keys[3] = false;
}
  