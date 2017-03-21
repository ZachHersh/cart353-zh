import java.util.Iterator;

Carwash carwash;
Car car;

ArrayList<NozzleSystem> ns;

void setup() {
  size(788,576);
  carwash = new Carwash();
  car = new Car(); 
  ns = new ArrayList<NozzleSystem>();
  ns.add(new NozzleSystem(new PVector(310, 94)));
  ns.add(new NozzleSystem(new PVector(470, 94)));
  ns.add(new NozzleSystem(new PVector(260, 64)));
  ns.add(new NozzleSystem(new PVector(540, 64)));
  
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
  car.display();
}