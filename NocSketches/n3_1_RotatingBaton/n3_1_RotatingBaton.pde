PVector b1;
PVector b2;

float angleDegrees;

void setup() {
  size(300,300);
  background(255);
  
  // location for ends of baton
  b1 = new PVector(-50,0);
  b2 = new PVector(50,0);
  
  // the angle will be in degrees
  angleDegrees = 0;
}

void draw() {
  background(255);
  
  // set point of origin in middle of screen
  translate(width/2, height/2);
  
  // increase angle
  angleDegrees+= 1.5;
  
  // convert it to radians
  float angleRadians = radians(angleDegrees);
  
  //rotate(on z -axis) by this amount - NB Processing's rotate method 
  //assumes radians as input
  rotate(angleRadians);
  
  strokeWeight(2);
  
  //draw a line between the points specified in our vectors
  line(b1.x,b1.y,b2.x,b2.y);
  fill(0);
  
  // draw a circle at each point 
  ellipse(b1.x,b1.y,10,10);
  ellipse(b2.x,b2.y,10,10);
}
  