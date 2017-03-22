class Car {
  
  PVector location;
  PShape redcar;
  
  Car() {
    
    location = new PVector(width/2,mouseY);
    redcar = loadShape("car.svg");
    
  }
  
  
  void run() {
    
    update();
    display();
    
  }
  
  
  void update() {
    
    location.y = map(mouseY, 80, 480,  300, 380);
    location.y = constrain(location.y, 300, 380);
  
  }
  
  
  void display() {
    float offset = map(mouseY, 80, 480,  0.48, 0.7);
    offset = constrain(offset,0.48,0.7);
    pushMatrix();
    translate(location.x, location.y);
    shapeMode(CENTER);
    scale(offset);
    shape(redcar, 0, 0);
    popMatrix();
  }
  
  
}