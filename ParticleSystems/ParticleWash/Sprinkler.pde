class Sprinkler extends Nozzle {
  
  Sprinkler(PVector l) {
    super(l);
  }
  
  void display() {
    
    //Rilla's Code for rain
    stroke(127, lifespan);
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    // a raindrop is a line drawn at its velocity angle
    stroke(78,169,205);
    line(0, 0, 6, 0);
    popMatrix();
  }
  
}