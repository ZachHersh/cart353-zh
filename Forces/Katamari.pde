class Katamari {
  float mass;
  PVector location;
  float G;
  //W A S D controls - Viktor Ivanov sketch
  boolean[] keys = {false, false, false, false};
  
  Katamari() {
    location = new PVector(width/2,height/2);
    mass=20;
    G=1.8;
  }
  
  // gravity that attracts material
  PVector attract(Material m) {
     
     PVector force = PVector.sub(location,m.position);
     float distance = force.mag();
     distance = constrain(distance,5,25.0);
     force.normalize();
     
     float strength = (G * mass * m.mass) / (distance * distance);
     
     force.mult(strength);
     
     return force;  
  }
  
  void updatePos() {
    if (keys[0] == true) location.y --;
    if (keys[1] == true) location.x --;
    if (keys[2] == true) location.y ++;
    if (keys[3] == true) location.x ++;
 
  }
  
  void display() {
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
  
  
}

//Victor Ivanov sketch
  void keyPressed() {
    if (key == 'w') kat.keys[0] = true;
    if (key == 'a') kat.keys[1] = true;
    if (key == 's') kat.keys[2] = true;
    if (key == 'd') kat.keys[3] = true;
  }

  void keyReleased() {
    if (key == 'w') kat.keys[0] = false;
    if (key == 'a') kat.keys[1] = false;
    if (key == 's') kat.keys[2] = false;
    if (key == 'd') kat.keys[3] = false;
  }