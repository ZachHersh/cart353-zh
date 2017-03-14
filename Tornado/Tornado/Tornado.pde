PImage photo;
PVector location;

void setup() {
  size(400,400);  
  photo = loadImage("terrain-terrain.jpg");
  location = new PVector(0,0);
  
}

void draw() {
  
  pushMatrix();
  translate(location.x,location.y);
  image(photo,0,0);
  println(location.x, location.y);
  popMatrix();
  ellipse(width/2,height/2,16,16);
  println(location.x, location.y);
  
}


void keyPressed() {
  if (key == 'w' && location.y>0) location.y+=10;  
  if (key == 'a' && location.x<0) location.x+=10;
  if (key == 's') location.y-=10;
  if (key == 'd') location.x-=10;
}