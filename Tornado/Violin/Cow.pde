class Cow {
 
  PVector loc;
  PVector velocity;
  PVector acceleration;
  float mass;
  PShape cow;
  boolean capture;
  PVector pos2;
  
  Cow(float _x, float _y){
    
    loc = new PVector(_x, _y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1.0;
    cow = loadShape("cow.svg");
    capture = false;
    pos2 = new PVector(0,0);
    
  }
  
  // applys gravitational force to cows
  void applyForce(PVector force, Tornado tor) {
    
    // gets length from cow to tornado(close enough?)
    PVector enough = PVector.sub(loc,tor.trsLoc);
    float dist = enough.mag();
    
    // friction
    PVector friction = velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(0.08);
      
    if(dist<160 && dist>50) {
    
      // if distance between tornado and cow is close enough..    
      PVector f = PVector.div(force,mass); // Adjust gravity force for Mass.
        
      // Pass on gravity and friction forces to acceleration. 
      acceleration.add(f);
           
      if (capture == false) {
        capture = true; //flips captured boolean
        tornado.score+=128496;
      }
        
      // else if right next to tornado..  
      } else if (dist>160) {
        acceleration.add(friction);
      }
      
  }
  
  
  void update() {
    
    // Add forces to location(loc).
    velocity.add(acceleration);
    loc.add(velocity);
    acceleration.mult(0);
  }
  
  
  void checkEdges() {
    
    // If cows are forced to the edges, bounce them back in the sketch.
    if (loc.x > terrain.zoom.x) {
      velocity.x*=-1;
      loc.x=terrain.zoom.x;
    } else if (loc.x < 0) {
      velocity.x*=-1;
      loc.x=0;
    }
    
    if (loc.y > terrain.zoom.y) {
      velocity.y*=-1;
      loc.y=terrain.zoom.y;
    } else if (loc.y < 0) {
      velocity.y*=-1;
      loc.y=0;
    }  
  }
  
}