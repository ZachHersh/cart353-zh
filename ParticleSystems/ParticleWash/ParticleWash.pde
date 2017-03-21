import java.util.Iterator;

Carwash carwash;
Car car;

NozzleSystem ns;

void setup() {
  size(788,576);
  carwash = new Carwash();
  car = new Car(); 
  ns = new NozzleSystem(new PVector(width/2,30));
}

void draw() {
  displaySetting();
  ns.run();
}

void displaySetting() {
  carwash.display();
  car.display();
}