Walker zach;

void setup() {
size(400,400);
zach = new Walker();
}

void draw() {
  
  zach.step();
  zach.display();
}