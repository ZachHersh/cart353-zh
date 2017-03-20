import java.util.Iterator;

ParticleSystem ps;

void setup() {
  size(640, 360);
  ps = new ParticleSystem(new PVector(width/2,30));

}

void draw() {
  background(255);
  ps.run();
}


  
  