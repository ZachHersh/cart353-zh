class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  Float mass;
  
  
  Mover() {

    position = new PVector(400, 50);
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
    mass = 1.0; 
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0, 127);
    ellipse(position.x, position.y, 16, 16);
  }

  
}