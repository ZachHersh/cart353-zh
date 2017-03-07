Mover[] zach = new Mover[10];
Attractor dulce;


int frame;

void setup() {
  size(800, 200);
  for (int i=0; i<zach.length; i++) {
    zach[i] = new Mover(random(0.1,2),random(width),random(height));
  } 
  dulce = new Attractor();
  
}

void draw() {
  background(255);
  
  for (int i=0; i<zach.length;i++) {
  PVector force = dulce.attract(zach[i]);
  zach[i].applyForce(force);
  zach[i].update();
  
  smooth();
  dulce.display();
  zach[i].display();
  }

}