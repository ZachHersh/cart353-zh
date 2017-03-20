class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(Particle part) {
    particles.add(part);
  }
  
  void run() {
    addParticle(new Particle(new PVector(mouseX, mouseY)));
    
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()) {
      Particle p = it.next();
      p.run();
      if(p.isDead()) {
        it.remove();
      }
    }
  }
  
}