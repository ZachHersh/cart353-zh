Mover[] zachs = new Mover[20];

void setup() {
  size(640,360);
  background(255);
  for (int i=0; i<zachs.length; i++) {
    zachs[i] = new Mover();
  }    
}


void draw() {
  background(255);
  for(int i=0; i<zachs.length; i++) {
    zachs[i].update();
    zachs[i].checkEdges();
    zachs[i].display();
  }
}