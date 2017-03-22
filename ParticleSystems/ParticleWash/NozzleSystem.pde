class NozzleSystem{
  
  ArrayList<Nozzle> nozzles;
  PVector origin;
  int nozzleType;
  
  NozzleSystem(PVector location, int nType) {
    origin = location.copy();
    nozzles = new ArrayList<Nozzle>();
    nozzleType = nType;
  }
  
  void addParticle(Nozzle noz) {
    nozzles.add(noz); 
  }
  
  void run() {
    
    // fill array list with appropriate nozzle type, 1 is foam, 2 is sprinkler
    if (nozzleType == 1 && mouseY > 280) {
      addParticle(new Foam(new PVector(origin.x, origin.y)));
    } else if (nozzleType == 2 && mouseY < 280) { 
      addParticle(new Sprinkler(new PVector(origin.x, origin.y)));
    }
    
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