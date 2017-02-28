class Mover {
 
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover(float m, float xp, float yp) {
    mass = m;
    position = new PVector(xp,yp);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
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
    fill(0,100);
    ellipse(position.x,position.y,mass*16,mass*16);
  }
  
  
  boolean isInside(Liquid l) {
    
    if (position.x>l.x && position.x<l.x+l.w && position.y>l.y && position.y<l.y+l.h) {
      return true;
    } else {
      return false;
    }
    
  }
  
  void drag(Liquid l) {
    
    float speed = velocity.mag();
    float dragMagnitude = l.c * speed * speed;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    
    drag.mult(dragMagnitude);
    applyForce(drag);
    
    if (position.y > height-mass/2) {
     acceleration.mult(0);
     position.y = height-mass/2;
    }
  }
  
  
  
}