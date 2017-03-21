class NozzleSystem{
  ArrayList<Nozzle> nozzles;
  ArrayList<Nozzle> nozzles2;
  PVector origin;
  
  NozzleSystem(PVector location) {
    origin = location.copy();
    nozzles = new ArrayList<Nozzle>();
    nozzles2 = new ArrayList<Nozzle>();
  }
  
  void addParticle(Nozzle noz) {
    nozzles.add(noz); 
  }
  
  void run() {
    addParticle(new Nozzle(new PVector(mouseX, mouseY)));
    
    Iterator<Nozzle> it = nozzles.iterator();
    
    while(it.hasNext()) {
      Nozzle n = it.next();
      n.run();
      if(n.isDead()) {
        it.remove();
      }
    }
  }
  
}