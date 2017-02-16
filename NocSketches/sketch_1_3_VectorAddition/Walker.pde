class Walker {
 PVector location;
 PVector offset;
 
 Walker() {
  location = new PVector(width/2,height/2);
  offset = new PVector(0,10000);
 }
  
 void display() {
  background(255,218,185);
  noStroke();
  fill(139,119,101);
  ellipse(location.x,location.y,8,8);
 }
  
 void step() {

   // Method 7.3 - 2D perlin noise for stepsize walker
   float stepsizex = int(map(noise(offset.x),0,1,0,50));
   float stepsizey = int(map(noise(offset.y),0,1,0,50));
   
   float stepx = random(-stepsizex, stepsizex+1);
   float stepy = random(-stepsizey, stepsizey+1);
   
   location.x+=stepx; 
   location.y+=stepy;
   
   location.x = constrain(location.x,40,width);
   location.y = constrain(location.y,40,height);
   
   offset.x+=0.001;
   offset.y+=0.001;
   
 }
  
 
}