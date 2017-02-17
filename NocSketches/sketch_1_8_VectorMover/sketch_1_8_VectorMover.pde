Mover zach;

void setup() {
  zach = new Mover();
  size(640, 360);
}

void draw() {
 background(255);
 zach.update();
 zach.checkEdges();
 zach.display();
 
}