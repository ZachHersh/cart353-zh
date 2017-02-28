Mover[] movers = new Mover[10];

Float c = 0.0; // Friction Coefficient
float c1 = -0.06;
float c2 = 0.01;

void setup() {
 size(640,480); 
 
 // instanitating movers with mass between .1 and 4 and x of 30 and y of 0
 for (int i=0; i < movers.length;i++) {
   movers[i] = new Mover(random(0.1,4),30,0);
 }
 
}

void draw() {
  background(255);
  
  // make a wind force
  PVector wind = new PVector(0.01,0);
  
  // apply forces, update, animte movers
  for (int i=0; i < movers.length;i++) {
    // make gravity force that is same to all movers despite having differing mass
    PVector gravity = new PVector(0,0.1*movers[i].mass);
    
    // Friction
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    if (movers[i].position.x < 200) {
      friction.mult(c);
    } else if ((movers[i].position.x >= 200) && (movers[i].position.x <= 280)) {
      friction.mult(c1);
    } else if ((movers[i].position.x > 280) && (movers[i].position.x < 500)) {
      friction.mult(c);
    } else if ((movers[i].position.x >= 500) && (movers[i].position.x <= 580)) {
      friction.mult(c2);
    } else if (movers[i].position.x > 580) {
      friction.mult(c);
    }
    
    friction.y *= 0;//(0.05*movers[i].mass);
        
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
  
  // draw friction zones
  fill(0,20);
  noStroke();
  rect(200,0,80,height);
  rect(500,0,80,height);
  
}