Mover zach;
Attractor dulce;


int frame;

void setup() {
  size(800, 200);
  zach = new Mover();
  dulce = new Attractor();
  
}

void draw() {
  background(255);
  
  PVector force = dulce.attract(zach);
  
  zach.applyForce(force);
  zach.update();
  
  dulce.display();
  zach.display();

}