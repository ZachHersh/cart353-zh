Particle p;

void setup() {
  size(640, 360);
  p = new Particle(new PVector(width/2,30));
}

void draw() {
  background(255);
  p.run();
  if (p.isDead()) {
    p = new Particle(new PVector(width/2,30));
  }
}


  
  