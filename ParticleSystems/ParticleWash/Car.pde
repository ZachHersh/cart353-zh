class Car {
  
  PVector location;
  PImage redcar;
  
  Car() {
    location = new PVector(0,0);
    redcar = loadImage("car.png");
  }
  
  void display() {
    imageMode(CENTER);
    image(redcar,width/2,height/1.5);
    redcar.resize(378,303);
  }
  
}