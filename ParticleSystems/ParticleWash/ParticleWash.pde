import java.util.Iterator;

Carwash carwash;
Car car;

ArrayList<NozzleSystem> ns;

void setup() {
  
  size(788,576);
  
  // Setting classes 
  carwash = new Carwash();
  car = new Car(); 
  
  // Particle system array
  ns = new ArrayList<NozzleSystem>();
  
  // Particle arrays
  ns.add(new NozzleSystem(new PVector(310, 82), 2));
  ns.add(new NozzleSystem(new PVector(470, 82), 2));
  ns.add(new NozzleSystem(new PVector(300, 64), 1));
  ns.add(new NozzleSystem(new PVector(500, 64), 1));
  
}


void draw() {
  displaySetting();
  
  Iterator<NozzleSystem> it = ns.iterator();
  
  while (it.hasNext()) {
    NozzleSystem ns = it.next();
    ns.run();
  }
  
  fill(0, 102, 153);
  String loc = mouseX + ", " + mouseY;
  text(loc, mouseX, mouseY);
}


void displaySetting() {
  carwash.display();
  car.run();
}