PImage photo;
PVector location;

Terrain terrain;
Tornado tornado;

void setup() {
  size(400,400);  
  photo = loadImage("terrain-terrain.jpg");
  location = new PVector(0,0);
  terrain = new Terrain(800, 800,3,4);
  tornado = new Tornado();
  
}

void draw() {
  
  background(255);
  
  pushMatrix();
  translate(location.x,location.y);
  terrain.display();
  popMatrix();
  tornado.display();
  //ellipse(width/2,height/2,16,16);
  /*
  pushMatrix();
  translate(location.x,location.y);
  image(photo,0,0);
  popMatrix();
  ellipse(width/2,height/2,16,16);
  */


}


void keyPressed() {
  if (key == 'w') location.y+=10;  
  if (key == 'a') location.x+=10;
  if (key == 's') location.y-=10;
  if (key == 'd') location.x-=10;
}