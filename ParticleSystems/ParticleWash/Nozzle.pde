class Nozzle {
  
  // forces
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan; 
  
  Nozzle(PVector l) {
    acceleration = new PVector(0,0.5);
    velocity = new PVector(random(-1,1),random(-1,0));
    location = l.copy();
    lifespan = 255.0;
  }
  
  void run() {
    // add forces
    PVector gravity = new PVector(0,0.05);
    applyForce(gravity);
    update();
    display();
  }
  
  void applyForce(PVector force) {
    
    acceleration.add(force); 
    
  }
  
  
  void update() {
    
    // update forces
    velocity.add(acceleration);
    location.add(velocity);
    
    //clear acceleration
    acceleration.mult(0); 
    
    // update lifespan
    lifespan-=2.0;
    
  }
  
  
  void display() {
 
    // shapes and styles of foam   
    noStroke();
    fill(245,0,0,lifespan);
    rect(location.x,location.y,28,28);
 
  }
  
  
  boolean isDead() {
    
    if (lifespan < 60.0) {
      return true; 
    } else {
      return false;
    }
    
  }
    
}