class Mover {
 PVector location;
 PVector velocity;
 PVector mouse;
 PVector dir;
 
 Mover() {
  location = new PVector(width/2,height/2);
  velocity =new PVector(0,0);
  mouse = new PVector(mouseX,mouseY);
  dir = PVector.sub(mouse,location);
 }
 
 
 
 
  
  
}