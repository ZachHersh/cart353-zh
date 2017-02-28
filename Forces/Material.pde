class Material {

  PVector position;
  PVector velocity;
  PVector acceleration;
  Float mass;
  PImage look;
  boolean capture;
  PVector pos2;
  
  
  Material(float x_, float y_, String l_) {

    // icon by David Gladis, Sherrinford, 
    
    position = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1.0;
    look = loadImage(l_);
    capture = false;
    pos2 = new PVector(0,0);
    
  }

  // applys gravity and friction force to material objects if within a certain range 
  void applyForce(PVector force, Katamari K) {
    // gets length from material objects to Katamri
    PVector enough = PVector.sub(position,K.location);
    float Km = enough.mag();
    
    //friction
    PVector friction = velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(0.05);

    // if material not captured by katamari..
    if (!capture) {
      //passes on gravity & friction to material if close enough to katamari
      if(Km<160 && Km>50) {
      PVector f = PVector.div(force,mass);
        // passes on frcition and gravity
        acceleration.add(f);
        acceleration.add(friction);
      } else if (Km<50) {
      //records location of material to katemari if within sticking location
        pos2 = enough;
        K.mass+=2; // also grows mass of katamari
        capture = true; // flips captured variable
      }
    } else {
      // sticks material to katamari if captured variable flipped, adjusts sticking 
      // point for katamari mass
      pos2.normalize();
      pos2.mult(K.mass*1.25);
      position = PVector.add(K.location,pos2);
      
    }
  }

  void update() {
    // adds forces to location
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void checkEdges() {
    if (position.x > width) {
      velocity.x*=-1;
      position.x=width;
    } else if (position.x < 0) {
      velocity.x*=-1;
      position.x=0;
    }
    
    if (position.y > height) {
      velocity.y*=-1;
      position.y=height;
    } else if (position.y < 0) {
      velocity.y*=-1;
      position.y=0;
    }
    
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0, 127);
    //ellipse(position.x, position.y, 16, 16);
    imageMode(CENTER);
    image(look,position.x, position.y);
  }

  
}