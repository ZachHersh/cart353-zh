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
  popMatrix();
  ellipse(width/2,height/2,16,16);
  
}


void keyPressed() {
  if (key == 'w') location.y+=10;  
  if (key == 'a') location.x+=10;
  if (key == 's') location.y-=10;
  if (key == 'd') location.x-=10;
}