class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float offset;
  float xoff;
  float yoff;
  
  Mover() {
    location = new PVector(width/2, width/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed=10;
    offset = 0;
    xoff=0;
    yoff=10000;
  }


  void update() {
    acceleration = new PVector(map(noise(xoff),0,1,-20,20), map(noise(yoff),0,1,-20,20));
    //acceleration.mult(map(noise(offset),0,1,0,20));
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    //offset+=0.01;
    xoff+=0.01;
    yoff+=0.01;
    println(xoff, yoff, acceleration);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y,16,16);
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x<0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }


}