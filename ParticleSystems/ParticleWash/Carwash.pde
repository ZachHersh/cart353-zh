class Carwash {
  
  PVector location;
  PImage wash;
  
 Carwash(){
   location = new PVector(0,0);
   wash = loadImage("carwash.jpg");
 }
  
 void display() {
   imageMode(CORNER);
   image(wash,0,0);
   wash.resize(788,576);
 } 
  
  
}