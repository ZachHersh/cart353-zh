class Tornado {
  
  float health; // health determines size of tornado and gameover if health too low
  float size; // equivelant of mass
  float theta1; // used to spin circles that make up tornado
  
  float r; // radius of tornado circle spin
  float mass; // for gravity effect
  PVector loc; // Tornado display location
  PVector trsLoc; // Translation location for forces
  PVector trsLoc2; // Translation location for jets.
  float G; // Overall gravity effect
  String tLoc;
  int score;
  
  
  Tornado() {
    
    // For display; ellipse movement.
    health = 5;
    size = 1;
    theta1 = 0;
    
    // For forces; gravity and friction.
    r = 10;
    loc = new PVector(width/2,height/2);
    trsLoc = new PVector(terrain.loc.x, terrain.loc.y);
    mass=size*80; //size*80   ..for new size
    G=1.8;
    
    // Score
    score = 0;
  }
  
  
  void healthInc(JetStream j) {
    
    // Make the gameplay location of the jet relative to terrain translation.
    // by copying and reversing terrain translation and adding center location
    trsLoc2 = terrain.loc.copy();
    trsLoc2.mult(-1);
    PVector center = new PVector(width/2,height/2);
    trsLoc2.add(center);
    
    if(j.jets.size()>0) {
      for (int i = 0; i< j.jets.size(); i++) {
 
        Jet jL = j.jets.get(i);
        PVector jLoc = jL.location;
        PVector difference = PVector.sub(trsLoc2,jLoc);
        float distance = difference.mag();
        
        if (distance < 200 && health < 5.9) {
         health+=0.003;
        }
      }
    }
    
    size = health/4;
  }
  
  
  PVector attract(Cow c) {
   
    trsLoc = terrain.loc.copy();
    trsLoc.mult(-1);
    PVector center = new PVector(width/2, height/2);
    trsLoc.add(center);
    
    // Calculates distance between tornado and cow.
    PVector force = PVector.sub(trsLoc,c.loc);
    float distance = force.mag();
    
    // Adjusts force and distance to adjust attraction.
    distance = constrain(distance,5,25.0);
    force.normalize();
    
    // Calculates vectors to send to cows.
    float strength = (G * mass * c.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
  
  
  void display() { 
    
    //float size=1;
    // circle locations that make up tornado
    PVector circ1 = new PVector(r * cos(theta1),r * sin(theta1));
    PVector circ2 = new PVector(r * cos(theta1+1.6),r * sin(theta1+1.6));
    PVector circ3 = new PVector(r * cos(theta1+3.2),r * sin(theta1+2.6));
    PVector circ4 = new PVector(r * cos(theta1+3.6),r * sin(theta1+3.6));
    
    // circles and circle styles that make tornado
    noFill(); stroke(220,90); 
    
    strokeWeight(size*12);
    ellipse(circ4.x+loc.x, circ4.y+loc.y, size*46, size*46);
    
    strokeWeight(size*18);
    ellipse(circ3.x+loc.x, circ3.y+loc.y, size*68, size*68);
    
    strokeWeight(size*24);
    ellipse(circ2.x+loc.x, circ2.y+loc.y, size*90, size*90);
    
    strokeWeight(size*28);
    ellipse(circ1.x+loc.x, circ1.y+loc.y, size*120, size*120);
    
    // Increment circular circle movement
    theta1+=0.19;
  }
  
}

  