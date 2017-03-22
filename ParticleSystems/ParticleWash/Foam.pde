class Foam extends Nozzle {
  
 //angular velocity
  float aAcceleration;
  float angle;
  
  Foam(PVector l) {
    
    super(l);
    aAcceleration = 0.2;
    angle = 0.0;
    
  }

  void update() {
    
    // repeat functions of superclass
    super.update();
    
    // add angular velocity update
    angle += aAcceleration;
  
  }


  void display() {
  // shapes and styles of foam  
    
    noStroke();
    fill(245,lifespan);
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(-4,-12,8,8);
    rect(-12,-4,8,8);
    fill(255,lifespan);
    rect(4,-4,8,8);
    rect(-4,4,8,8);
    popMatrix();
    
  }

}