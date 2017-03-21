class NozzleSystem{
  ArrayList<Nozzle> nozzles;
  
  PVector origin;
  
  NozzleSystem(PVector location) {
    origin = location.copy();
    nozzles = new ArrayList<Nozzle>();
  }
  
  void addParticle(Nozzle noz) {
    nozzles.add(noz); 
  }
  
  void run() {
    addParticle(new Nozzle(new PVector(origin.x, origin.y)));
    
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