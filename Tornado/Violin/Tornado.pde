class Tornado {
  
  int size; // equivelant of mass
  float theta1; // used to spin circles that make up tornado
  
  float r; // radius of tornado circle spin
  float mass; // for gravity effect
  PVector loc; // Tornado display location
  PVector trsLoc; // Translation locationf for forces
  float G; // Overall gravity effect
  String tLoc;
  int score;
  
  Tornado() {
    
    // For display; ellipse movement.
    size = 120;
    theta1 = 0;
    
    // For forces; gravity and friction.
    r = 10;
    loc = new PVector(width/2,height/2);
    trsLoc = new PVector(terrain.loc.x, terrain.loc.y);
    mass=size-40;
    G=1.8;
    
    // Score
    score = 0;
    
  }
  
  PVector attract(Cow c) {
    
    // Make the gameplay location of the tornado relative to terrain translation.
    trsLoc = terrain.loc.copy();
    trsLoc.mult(-1);
    PVector center = new PVector(width/2,height/2);
    trsLoc.add(center);
    
    tLoc = int(trsLoc.x) + "," + int(trsLoc.y);
    
    
    PVector force = PVector.sub(trsLoc,c.loc);
    float distance = force.mag();
    distance = constrain(distance,5,25.0);
    force.normalize();
    
    float strength = (G * mass * c.mass) / (distance * distance);
    force.mult(strength);
    
    return force;

  }
  
  // tornado display
  void display() { 
    
    // circle locations that make up tornado
    PVector circ1 = new PVector(r * cos(theta1),r * sin(theta1));
    PVector circ2 = new PVector(r * cos(theta1+1.6),r * sin(theta1+1.6));
    PVector circ3 = new PVector(r * cos(theta1+3.2),r * sin(theta1+2.6));
    PVector circ4 = new PVector(r * cos(theta1+3.6),r * sin(theta1+3.6));
    
    // circles and circle styles that make tornado
    noFill(); stroke(220,90); strokeWeight(28);
    ellipse(circ1.x+loc.x, circ1.y+loc.y, size, size);
    stroke(220,84); strokeWeight(24);
    ellipse(circ2.x+loc.x, circ2.y+loc.y, size-30, size-30);
    strokeWeight(18);
    ellipse(circ3.x+loc.x, circ3.y+loc.y, size-52, size-52);
    strokeWeight(12);
    ellipse(circ4.x+loc.x, circ4.y+loc.y, size-74, size-74);
    theta1+=0.09;
  
  }
  
}

  