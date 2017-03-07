class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  Float mass;
  
  float angle=0.0;
  float aVelocity=0.0;
  float aAcceleration=0.0;  
  
  Mover(float _mass, float _x, float _y) {

    position = new PVector(_x, _y);
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
    mass = _mass; 
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {   
    velocity.add(acceleration);
    position.add(velocity);
    
    aAcceleration = acceleration.x/10.0;
    aVelocity += aAcceleration;
    constrain(aVelocity,-0.1,0.1);
    angle += aVelocity;
    
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0, 127);
    rectMode(CENTER);
 
    pushMatrix();
    translate(position.x,position.y);
    rotate(angle);
    rect(0, 0, mass*16, mass*16);
    popMatrix();
  }

  
}