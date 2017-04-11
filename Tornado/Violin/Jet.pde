class Jet {
   
  float angle = 0;
  float aVelocity = 0.03;
  PVector osc;
  PVector location;
  PShape jetB;
  float lifespan; 
  color jetColor = color(255,100);
  
  Jet(PVector _origin) {
    osc = new PVector();
    location = new PVector(_origin.x,_origin.y);
    jetShape();
    lifespan = 600.0;  
  }
  
  
  void run() {
    update();
    display();
  }
  
  
  void update() {
    
    // floats for curving x path of jet
    float amplitude = 8.0;
    float x = amplitude*cos(angle);
    osc = new PVector(x,-6);
    location.add(osc);
    lifespan-=0.8;   
    angle+= aVelocity;
  }
  
  
  void display() {
    
    // Displays jets rotated according to direction
    // and translated to account for map rather then screen size.
    float angle2 = osc.heading();
    
    pushMatrix();
    shapeMode(CENTER);
    
    translate(location.x,location.y);
    rotate(angle2);
    
    shape(jetB,0,0);
    popMatrix();
  }
  
  
  boolean isDead() {
    
    // Destroys Jets.
    if (lifespan < 0) {
      return true; 
    } else {
      return false;
    }
  }
  
  
  void jetShape() {
    
    // The jet.
    jetB = createShape();
    jetB.beginShape();
    jetB.noStroke();
    jetB.fill(jetColor);
    jetB.vertex(0,0);
    jetB.bezierVertex(80,0, 80,80, 0,80);
    jetB.bezierVertex(36,66, 36,14, 0,0);
    jetB.endShape();
  }
  
  
}