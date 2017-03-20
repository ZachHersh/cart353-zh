class Particle {
  
  // forces
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan; 
  
  //angular velocity
  float aAcceleration;
  float angle;
  
  float pLength;
  
  Particle(PVector l) {
   acceleration = new PVector(0,0.5);
   velocity = new PVector(random(-1,1),random(-1,0));
   location = l.copy();
   
   aAcceleration = 0.2;
   angle = 0.0;
   
   lifespan = 255.0;
   pLength = 10;
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
    
    // update angular velocity
    angle += aAcceleration;
    
    //clear acceleration
    acceleration.mult(0); 
    
    // update lifespan
    lifespan-=2.0;
  }
  
  void display() {
    //style
    noStroke();
    fill(175,lifespan);
    
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(-4,-12,8,8);
    rect(-12,-4,8,8);
    rect(4,-4,8,8);
    rect(-4,4,8,8);
    popMatrix();
  }
  
  boolean isDead() {
    if (lifespan < 60.0) {
      return true; 
    } else {
      return false;
    }
  }
    
}